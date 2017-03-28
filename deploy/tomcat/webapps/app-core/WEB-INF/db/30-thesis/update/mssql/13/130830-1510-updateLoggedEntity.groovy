import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.global.ExtendedEntities
import com.haulmont.cuba.core.global.Metadata
import com.haulmont.cuba.security.entity.LoggedEntity

/*
 * Copyright (c) 2013 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */

/**
 *
 * @author gaponenkov
 * @version $Id: 130830-1510-updateLoggedEntity.groovy 18732 2015-01-22 12:40:47Z tsarevskiy $
 */

postUpdate.add({
    Transaction tx = AppBeans.get(Persistence.class).createTransaction();
    EntityManager em = AppBeans.get(Persistence.class).getEntityManager();
    List<LoggedEntity> loggedEntities;
    def entityClassName;
    def entityName;
    try {
        loggedEntities = em.createQuery("select l from sec\$LoggedEntity l").getResultList();
        Set<String> set = new HashSet<>();
        loggedEntities.each { LoggedEntity entity ->
            if (entity.getName() != null && !entity.getName().contains('$')) {
                entityClassName = entity.getName();
                com.haulmont.chile.core.model.MetaClass currentClass = AppBeans.get(Metadata.class).getSession()
                        .getClass(getClass().getClassLoader().loadClass(entityClassName));
                com.haulmont.chile.core.model.MetaClass originalClass = AppBeans.get(ExtendedEntities.class).getOriginalMetaClass(currentClass);
                if (originalClass == null) {
                    originalClass = currentClass;
                }
                entityName = originalClass.getName();
                if (entityName != null) {
                    em.createQuery("update sec\$EntityLog e set e.entity = :entity where e.entity = :entityName")
                            .setParameter("entity", entityName)
                            .setParameter("entityName", entity.getName())
                            .executeUpdate();
                    if (set.contains(entityName)) {
                        em.remove(entity);
                    } else {
                        entity.setName(entityName);
                        set.add(entityName);
                    }
                }
            }
        }
        tx.commit();
    } finally {
        tx.end();
    }
})
