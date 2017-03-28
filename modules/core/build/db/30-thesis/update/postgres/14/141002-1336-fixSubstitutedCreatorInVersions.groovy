/*
 * Copyright (c) 2014 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */



import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.sys.DbUpdaterEngine
import com.haulmont.cuba.security.app.EntityLog
import com.haulmont.thesis.core.entity.Doc
import com.haulmont.workflow.core.entity.Card
import org.apache.commons.logging.LogFactory

postUpdate.add({
    EntityLog entityLog = AppBeans.get(EntityLog.NAME);
    Boolean entityLogEnable = entityLog.isEnabled();
    entityLog.setEnabled(false);
    try {
        AppBeans.get(Persistence.class).createTransaction().execute(new Transaction.Runnable() {
            @Override
            public void run(EntityManager em) {
                em.setSoftDeletion(false);
                List<Card> cards = em.createQuery("select c from wf\$Card c where c.substitutedCreator is null",
                        Card.class).getResultList();
                for (Card card : cards) {
                    if (card instanceof Doc) {
                        Doc doc = (Doc) card;
                        Doc versionOf = doc.getVersionOf();
                        if (versionOf != null) {
                            doc.setSubstitutedCreator(versionOf.getSubstitutedCreator());
                            if (doc.getCreator() == null) {
                                doc.setCreator(versionOf.getCreator());
                            }
                            em.merge(doc);
                        } else {
                            LogFactory.getLog(DbUpdaterEngine.class).error("Aren't able to find creator for card: "
                                    + card.getId());
                        }
                    } else {
                        LogFactory.getLog(DbUpdaterEngine.class).error("Aren't able to find creator for card: "
                                + card.getId());
                    }
                }
            }
        });
    } finally {
        entityLog.setEnabled(entityLogEnable);
    }
})
