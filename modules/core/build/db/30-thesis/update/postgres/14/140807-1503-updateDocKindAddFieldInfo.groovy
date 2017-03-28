/*
 * Copyright (c) 2014 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.bali.util.Dom4j
import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.global.View
import com.haulmont.thesis.core.entity.DocKind
import com.haulmont.thesis.core.entity.DocType
import com.haulmont.thesis.core.entity.FieldInfo

//скрипт проставляет в fieldsXml всех видов документов недостающие fieldInfo (то есть те которые есть в Типе но нет в Виде)
//если отсутствующий fieldInfo в Типе помечен как ненастраиваемый в виде, то запишем в вид дефолтные настройки "видимый, необязательный, неподписываемый"
//потому что так работало раньше, и раньше значения не брались из Типа в таком случае
//если отсутствующий fieldInfo в Типе помечен как настраиваемый в виде
//(такая ситуация могла случиться, если при создании вида, поле в типе было ненастраиваемое, а после его сделали настраиваемым)
//,то запишем в вид нынешние настройки поля из Типа потому что раньше эти настройки брались в рантайме из Типа
//(поменяли в типе - поменялся в документе), но сейчас решили, что работать должно не так - настройки должны браться из вида, и настраиваться там
postUpdate.add({
    Persistence persistence = AppBeans.get(Persistence.class)
    Transaction tx = persistence.createTransaction()
    EntityManager em = persistence.entityManager
    try {
        List<DocKind> docKinds = em.createQuery('select d from df$DocKind d')
                .setView(new View(DocKind.class).addProperty('fieldsXml')
                .addProperty('docType', new View(DocType.class).addProperty('name').addProperty('fieldsXml')))
                .getResultList()

        Map<DocType, DocKind> docTypeDocKinds = docKinds.groupBy { it.docType } as Map<DocType, DocKind>
        for (DocType docType : docTypeDocKinds.keySet()) {
            for (DocKind docKind : docTypeDocKinds.get(docType)) {
                if (!docKind.fieldsXml) {
                    docKind.getFields()
                    docKind.updateFieldsXml()
                } else {
                    def doc = Dom4j.readDocument(docKind.fieldsXml)
                    def docKindFields = Dom4j.elements(doc.rootElement, 'field')
                    for (FieldInfo docTypeFieldInfo : docType.fields) {
                        def element = docKindFields.find {it.attributeValue('name').equals(docTypeFieldInfo.name)}
                        if (!element) {
                            element = doc.rootElement.addElement('field')
                            element.addAttribute('name', docTypeFieldInfo.name)
                            element.addAttribute('visible', docTypeFieldInfo.inDocKind ? docTypeFieldInfo.visible.toString() : 'true')
                            element.addAttribute('required', docTypeFieldInfo.inDocKind ? docTypeFieldInfo.required.toString() : 'false')
                            element.addAttribute('signed', docTypeFieldInfo.inDocKind ? docTypeFieldInfo.signed.toString() : 'false')
                        }
                    }
                    StringWriter writer = new StringWriter()
                    Dom4j.writeDocument(doc, true, writer)

                    docKind.setFieldsXml(writer.toString())
                }

                em.merge(docKind)
            }
        }
        tx.commit()
    } finally {
        tx.end()
    }
})