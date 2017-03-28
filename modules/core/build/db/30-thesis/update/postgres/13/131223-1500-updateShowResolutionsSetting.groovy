import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.security.entity.UserSetting

postUpdate.add({

    Persistence persistence = AppBeans.get(Persistence.NAME);

    def searchTerm = "%name=\"hideResolutions\"%"
    def names = Arrays.asList("df\$Doc.browse", "tm\$Task.browse", "df\$SimpleDoc.browse", "df\$Contract.browse",
            "df\$DocIncome.browse", "df\$DocOutcome.browse", "df\$DocInternal.browse")

    Transaction tx = persistence.createTransaction();
    try {
        EntityManager em = persistence.getEntityManager();

        List<UserSetting> userSettings = em.createQuery("select s from sec\$UserSetting s where s.value like :searchTerm")
                .setParameter("searchTerm", searchTerm)
                .getResultList();

        for (UserSetting userSetting : userSettings) {
            String value = userSetting.getValue();

            userSetting.setValue(value.replace("name=\"hideResolutions\"", "name=\"showResolutions\""))
        }

        tx.commit();
    } catch (Exception ex) {
        throw new RuntimeException(ex);
    } finally {
        tx.end();
    }
})



