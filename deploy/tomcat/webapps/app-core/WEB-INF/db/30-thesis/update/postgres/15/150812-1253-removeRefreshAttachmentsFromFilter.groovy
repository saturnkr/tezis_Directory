/*
 * Copyright (c) 2015 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */





/**
 *
 * @author pavlov
 * @version $Id: 150812-1253-removeRefreshAttachmentsFromFilter.groovy 21202 2015-08-12 08:53:06Z pavlov $
 */
import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.security.entity.FilterEntity

postUpdate.add({
    AppBeans.get(Persistence.class).createTransaction().execute(new Transaction.Runnable() {
        @Override
        void run(EntityManager em) {
            String conditionOld="select distinct cu.important from wf\$CardUserInfo cu where cu.card.id = {E}.id and cu.user.id =:session\$userId and cu.refreshAttachment is null and cu.deleteTs is null)"
            String conditionNew="select distinct cu.important from wf\$CardUserInfo cu where cu.card.id = {E}.id and cu.user.id =:session\$userId and cu.deleteTs is null)"
            em.createQuery("select f from sec\$Filter f").getResultList().each { FilterEntity filter ->
                String xml = filter.getXml();
                if (xml != null) {
                    xml = xml.replace(conditionOld, conditionNew)
                    filter.setXml(xml)
                }
                em.merge(filter)
            }
        }
    })
})