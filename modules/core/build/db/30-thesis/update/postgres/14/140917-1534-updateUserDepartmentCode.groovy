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
import com.haulmont.thesis.core.entity.Department
import com.haulmont.thesis.core.entity.Employee
import com.haulmont.thesis.core.entity.OfficeFile
import com.haulmont.thesis.core.entity.TsUser
import org.apache.commons.lang.StringUtils

/**
 * @author
 * @version
 */


postUpdate.add({
    AppBeans.get(Persistence.class).createTransaction().execute(new Transaction.Runnable() {
        @Override
        void run(EntityManager em) {

            em.createQuery("select u from tm\$User u").setView(TsUser.class, "_local").getResultList().each { TsUser entity ->
                Employee employee= em.createQuery("select em from df\$Employee em where em.user.id=:userId")
                        .setParameter("userId",entity.getId())
                        .setView(Employee.class,"with-department-code").getFirstResult();
                if (employee != null) {
                    Department department = employee.getDepartment();
                    if (department != null) {
                        if (!StringUtils.isBlank(department.getCode())) {
                            entity.setDepartmentCode(department.getCode())
                        }
                    }
                }
                em.merge(entity);
            }
        }
    })
})