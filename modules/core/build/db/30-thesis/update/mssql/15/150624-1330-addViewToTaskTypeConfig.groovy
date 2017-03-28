import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.entity.Config
import com.haulmont.cuba.core.global.AppBeans

/*
 * Copyright (c) 2015 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */

/**
 *
 * @author mishunin
 * @version $Id: 150624-1330-addViewToTaskTypeConfig.groovy 20478 2015-06-24 11:02:38Z mishunin $
 */

postUpdate.add({
    Transaction tx = AppBeans.get(Persistence.class).createTransaction()
    EntityManager em = AppBeans.get(Persistence.class).getEntityManager()
    Config config
    try {
        config = em.createQuery("select c from sys\$Config c where c.name = :name").setParameter("name", "com.haulmont.thesis.core.config.taskTypeDefault").getFirstResult()
        config.setValue(config.value + "-edit")
        tx.commit()
    } finally {
        tx.end()
    }
})