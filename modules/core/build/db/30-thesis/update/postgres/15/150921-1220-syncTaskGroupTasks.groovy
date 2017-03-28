import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.entity.TaskGroupTask

/*
 * Copyright (c) 2015 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */

/**
 *
 * @author gaslov
 * @version $Id: 150921-1220-syncTaskGroupTasks.groovy 21800 2015-09-21 11:48:06Z gaslov $
 */

postUpdate.add({
    Persistence persistence = AppBeans.get(Persistence.class)
    Transaction tx = persistence.createTransaction()
    EntityManager em = persistence.getEntityManager()
    try {
        List<TaskGroupTask> tgts = em.createQuery("select tgt from tm\$TaskGroupTask tgt where tgt.task is not null")
                .setView(TaskGroupTask.class, "taskGroupTask-edit").getResultList()
        for (TaskGroupTask tgt : tgts) {
            tgt.syncWithTask()
        }
        tx.commit()
    } finally {
        tx.end()
    }
})