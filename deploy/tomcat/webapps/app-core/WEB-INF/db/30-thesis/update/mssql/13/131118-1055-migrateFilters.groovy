import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.security.entity.FilterEntity

/*
 * Copyright (c) 2013 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */

/**
 *
 * @author gaponenkov
 * @version $Id: 131118-1055-migrateFilters.groovy 13289 2013-11-18 07:07:10Z gaponenkov $
 */


postUpdate.add({
    Transaction tx = AppBeans.get(Persistence.class).createTransaction();
    EntityManager em = AppBeans.get(Persistence.class).getEntityManager();
    List<FilterEntity> filters;
    try {
        filters = em.createQuery("select f from sec\$Filter f").getResultList();
        filters.each { FilterEntity filter ->
            String xml = filter.getXml();
            if (xml != null) {
                xml = xml.replace("com.haulmont.docflow", "com.haulmont.thesis");
                xml = xml.replace("com.haulmont.taskman", "com.haulmont.thesis");
                xml = xml.replace("dk.docType", "{E}.docType");
                filter.setXml(xml);
            }
        }
        tx.commit();
    } finally {
        tx.end();
    }
})