import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Query
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.security.entity.FilterEntity

postUpdate.add({
    Persistence persistence = AppBeans.get(Persistence.NAME);
    Transaction tx = persistence.createTransaction();
    try {
        EntityManager em = persistence.getEntityManager();
        Query query = em.createQuery("select f from sec\$Filter f")
        List<FilterEntity> filters = query.getResultList();
        for (FilterEntity filter : filters) {
            String xml = filter.getXml();
            xml = xml.replace("com.haulmont.docflow", "com.haulmont.thesis");
            xml = xml.replace("com.haulmont.taskman", "com.haulmont.thesis");
            filter.setXml(xml);
        }
        tx.commit();
    } finally {
        tx.end();
    }
})
