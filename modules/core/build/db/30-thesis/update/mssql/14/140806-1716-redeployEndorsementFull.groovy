/*
 * Copyright (c) 2014 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */


import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.app.DocflowDeployer
import com.haulmont.thesis.core.app.DocflowDeployerMBean
import com.haulmont.workflow.core.entity.Proc

/**
 *
 * @author tsarevskiy
 * @version $Id$
 */

postUpdate.add({
    Transaction tx = AppBeans.get(Persistence.class).createTransaction();
    EntityManager em = AppBeans.get(Persistence.class).getEntityManager();

    try {
        List<Proc> procs = em.createQuery("select p from wf\$Proc p where p.code = 'EndorsementFull'").getResultList();
        tx.commit();
        if (!procs.isEmpty()) {
            ((DocflowDeployerMBean) AppBeans.get(DocflowDeployer.NAME)).deployEndorsementFullProcess();
        }
    } finally {
        tx.end();
    }

}) 