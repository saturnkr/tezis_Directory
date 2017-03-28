/*
 * Copyright (c) 2014 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */


import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.app.OfficeFileWorker
import com.haulmont.thesis.core.entity.OfficeFile

/**
 * Office file filters 'In archive request', 'Archived', 'Destroyed' now must not be shown
 * in OfficeFile.browse and OfficeFile.lookup screens
 *
 * @author Sergey Saiyan
 * @version $Id: 140829-1438-updateOfficeFileDisplayedName.groovy 17243 2014-08-29 14:21:31Z kozyaikin $
 */


postUpdate.add({
    AppBeans.get(Persistence.class).createTransaction().execute(new Transaction.Runnable() {
        @Override
        void run(EntityManager em) {

            em.createQuery("select o from df\$OfficeFile o").setView(OfficeFile.class, "edit").getResultList().each { OfficeFile entity ->
                OfficeFileWorker officeFileWorker = AppBeans.get(OfficeFileWorker.class);
                officeFileWorker.updateDisplayedName(entity, entity.getNomenclature());
                em.merge(entity);
            }
        }
    })
})