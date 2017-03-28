import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.sys.DbUpdater
import com.haulmont.cuba.security.entity.Permission
import org.apache.commons.lang.exception.ExceptionUtils
import org.apache.commons.logging.Log
import org.apache.commons.logging.LogFactory

postUpdate.add({
    Log log = LogFactory.getLog(DbUpdater.class);
    Persistence persistence = AppBeans.get(Persistence.NAME);
    Transaction tx = persistence.createTransaction();
    try {
        EntityManager em = persistence.getEntityManager();
        em.setSoftDeletion(false);

        List<Permission> contractorPermissions = em.createQuery("select p from sec\$Permission p where p.target like :target")
                .setParameter("target", "df\$ContractorAttachment%")
                .getResultList();

        for (Permission permission : contractorPermissions) {
            String target = permission.getTarget();
            target = target.replace("ContractorAttachment", "CorrespondentAttachment");

            List existPermissions = em.createQuery("select p from sec\$Permission p where p.target = :target and p.role.id = :roleId and p.type = :type and p.value = :value")
                    .setParameter("target", target)
                    .setParameter("roleId", permission.getRole().getId())
                    .setParameter("type", permission.getType().getId())
                    .setParameter("value", permission.getValue())
                    .getResultList();

            if (existPermissions.isEmpty()) {
                permission.setTarget(target);
                em.merge(permission);
            } else {
                em.remove(permission);
            }
        }

        tx.commit();

    } catch (Exception ex) {
        log.error(ExceptionUtils.getStackTrace(ex));
    } finally {
        tx.end();
    }
});