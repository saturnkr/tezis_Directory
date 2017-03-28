import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Query
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.security.app.EntityLog
import com.haulmont.thesis.core.entity.Doc
import com.haulmont.thesis.core.entity.DocOfficeData
import com.haulmont.thesis.core.enums.DocOfficeDocKind

postUpdate.add({
    Transaction tx = AppBeans.get(Persistence.class).createTransaction();
    EntityManager em = AppBeans.get(Persistence.class).getEntityManager();
    EntityLog entityLog = AppBeans.get(EntityLog.NAME);

    Boolean entityLogEnable = entityLog.isEnabled();
    entityLog.setEnabled(false);
    try {
        Query query = em.createQuery("select d from df\$Doc d where d.docOfficeDocKind = 'O' and d.registered = true");
        List<Doc> registeredDocs = query.getResultList();
        for (Doc doc : registeredDocs) {
            if (doc.getDocOfficeData() != null) {
                Doc respondToDoc = doc.getDocOfficeData().getResponseToDoc();
                if (respondToDoc != null && respondToDoc.getDocOfficeDocKind().equals(DocOfficeDocKind.INCOME)) {
                    DocOfficeData responseData = respondToDoc.getDocOfficeData()
                    if (responseData != null) {
                        responseData.setResponseDate(doc.getRegDate());
                        em.merge(responseData);
                    }
                }
            }
        }
        tx.commit();
    } finally {
        entityLog.setEnabled(entityLogEnable);
        tx.end();
    }
})