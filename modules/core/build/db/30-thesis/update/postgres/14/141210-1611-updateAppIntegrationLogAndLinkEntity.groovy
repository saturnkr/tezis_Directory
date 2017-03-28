/*
 * Copyright (c) 2014 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.chile.core.model.MetaClass
import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.global.ExtendedEntities
import com.haulmont.thesis.core.entity.appintegration.AppIntegrationLinkEntity
import com.haulmont.thesis.core.entity.appintegration.AppIntegrationLog

//update df$AppIntegrationLog and df$AppIntegrationLinkEntity with not original metaclass entityName
postUpdate.add({
    Persistence persistence = AppBeans.get(Persistence.class)
    ExtendedEntities extendedEntities = AppBeans.get(ExtendedEntities.class)

    Transaction tx = persistence.createTransaction()
    EntityManager em = persistence.entityManager
    try {
        List<AppIntegrationLog> integrationLogs = em.createQuery('select a from df$AppIntegrationLog a').resultList
        integrationLogs.each {
            MetaClass originalMetaClass = extendedEntities.getOriginalMetaClass(it.entityName)
            if (originalMetaClass)
                it.setEntityName(originalMetaClass.name)
        }

        List<AppIntegrationLinkEntity> integrationLinkEntities = em.createQuery('select a from df$AppIntegrationLinkEntity a').resultList
        integrationLinkEntities.each {
            MetaClass originalMetaClass = extendedEntities.getOriginalMetaClass(it.entityName)
            if (originalMetaClass)
                it.setEntityName(originalMetaClass.name)
        }

        tx.commit()
    } finally {
        tx.end()
    }
})