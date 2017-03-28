import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.sys.DbUpdater
import org.apache.commons.logging.Log
import org.apache.commons.logging.LogFactory

/*
 * Copyright (c) 2014 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */

/**
 *
 * @author Sergey Saiyan
 * @version $Id: 140603-1300-updatePostgresSequences.groovy 16392 2014-06-20 13:46:36Z saiyan $
 */
postUpdate.add({
    Log log = LogFactory.getLog(DbUpdater.class);
    Persistence persistence = AppBeans.get(Persistence.NAME);

    persistence.createTransaction().execute(new Transaction.Callable() {
        @Override
        Object call(EntityManager em) {
            def list = em.createNativeQuery("select c.relname from pg_class c where c.relkind = 'S'").getResultList();
            list.each {
                em.createNativeQuery("alter sequence \"" + it + "\" minvalue 0").executeUpdate();
                log.info("Updated sequence '" + it + "' to minvalue = 0")
            }
        }
    })
})