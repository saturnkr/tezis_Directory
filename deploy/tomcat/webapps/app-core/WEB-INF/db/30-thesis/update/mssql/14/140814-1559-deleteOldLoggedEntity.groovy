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
import com.haulmont.cuba.core.global.Metadata
import com.haulmont.cuba.security.app.EntityLogAPI
import com.haulmont.cuba.security.entity.LoggedEntity

//remove old sec$LoggedEntity and sec$LoggedAttribute with not original metaclass name
postUpdate.add({
    Persistence persistence = AppBeans.get(Persistence.class)
    Metadata metadata = AppBeans.get(Metadata.class)

    Transaction tx = persistence.createTransaction()
    EntityManager em = persistence.entityManager
    try {
        List<LoggedEntity> loggedEntities = em.createQuery('select a from sec$LoggedEntity a').resultList
        loggedEntities.each {
            MetaClass originalMetaClass = metadata.extendedEntities.getOriginalMetaClass(it.name)
            if (originalMetaClass && !it.name.equals(originalMetaClass.name)) {
                em.createQuery('delete from sec$LoggedAttribute a where a.entity.id = :id')
                        .setParameter('id', it.id).executeUpdate()
                em.createQuery('delete from sec$LoggedEntity a where a.id = :id')
                        .setParameter('id', it.id).executeUpdate()
            }
        }
        (AppBeans.get(EntityLogAPI.NAME) as EntityLogAPI).invalidateCache()

        tx.commit()
    } finally {
        tx.end()
    }
})