/*
 * Copyright (c) 2012 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */


import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Query
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.entity.DocKind
import com.haulmont.thesis.core.entity.FieldInfo

/**
 *
 * @version $Id: 01-220-setAvailableForAllInFalse.groovy 12781 2013-10-25 09:55:02Z saiyan $
 *
 * @author kozyaikin
 */

postUpdate.add({
    Transaction tx = AppBeans.get(Persistence.class).createTransaction();
    try {
        EntityManager em = AppBeans.get(Persistence.class).getEntityManager();
        Query query = em.createQuery("select dk from df\$DocKind dk")
        List<DocKind> docKinds = query.getResultList();
        for (DocKind docKind : docKinds) {
            List<FieldInfo> fieldInfoList = docKind.getFields();
            for (FieldInfo fieldInfo : fieldInfoList) {
                if ("availableForAll".equals(fieldInfo.getName())) {
                    fieldInfo.setRequired(false);
                    if (!fieldInfo.signed) {
                        fieldInfo.setSigned(false);
                    }
                    if (!fieldInfo.visible) {
                        fieldInfo.setVisible(false);
                    }
                }
            }
            docKind.updateFieldsXml();
        }
        tx.commit();
    } finally {
        tx.end();
    }
});

