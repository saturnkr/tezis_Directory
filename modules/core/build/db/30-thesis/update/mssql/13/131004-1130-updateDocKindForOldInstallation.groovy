import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.global.View
import com.haulmont.thesis.core.entity.DocKind
import com.haulmont.thesis.core.entity.DocType
import com.haulmont.thesis.core.entity.FieldInfo

/*
 * Copyright (c) 2013 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */

/**
 * Created with IntelliJ IDEA.
 * User: zaskanov
 * Date: 04.10.13
 * Time: 11:00
 * To change this template use File | Settings | File Templates.
 */

postUpdate.add({
    Persistence persistence = AppBeans.get(Persistence.class);
    Transaction tx = persistence.createTransaction();
    EntityManager em = persistence.getEntityManager();
    try {
        List<DocKind> docKinds = em.createQuery("select docKind from df\$DocKind docKind join docKind.docType docType where docType.name='df\$SimpleDoc'")
                .setView(new View(DocKind.class).addProperty("fieldsXml").addProperty("docType", new View(DocType.class).addProperty("fieldsXml")))
                .getResultList();
        List<String> names = new ArrayList<String>();
        names.add("orderCause");
        names.add("orderText");
        names.add("docSender");
        names.add("docReceiver");
        names.add("docCopyReceiver");
        for (DocKind docKind : docKinds) {
            List<FieldInfo> fields = docKind.getFields();
            for (String name : names) {
                FieldInfo fieldInfo = null;
                for (FieldInfo fi : fields) {
                    if (name.equals(fi.getName())) {
                        fieldInfo = fi;
                        break;
                    }
                }

                if (fieldInfo == null) {
                    fieldInfo = new FieldInfo();
                    fieldInfo.setName(name);
                    fieldInfo.setVisible(false);
                    fieldInfo.setRequired(false);
                    fields.add(fieldInfo);
                } else {
                    fieldInfo.setVisible(false);
                    fieldInfo.setRequired(false);
                }
            }
            docKind.updateFieldsXml();
            em.merge(docKind);
        }
        tx.commit();
    } finally {
        tx.end();
    }
});