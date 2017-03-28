/*
 * Copyright (c) 2014 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */


import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.entity.Entity
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.app.DocflowDeployerMBean

/**
 * Office file filters 'In archive request', 'Archived', 'Destroyed' now must not be shown
 * in OfficeFile.browse and OfficeFile.lookup screens
 *
 * @author Sergey Saiyan
 * @version $Id: 140818-1230-moveOfficeFileFilters.groovy 17123 2014-08-18 13:26:19Z saiyan $
 */

postUpdate.add({
    AppBeans.get(Persistence.class).createTransaction().execute(new Transaction.Runnable() {
        @Override
        void run(EntityManager em) {
            // query for filter select from AbstractDeployer
            String queryStr = "select f from sec\$Filter f where f.code = ?1 and f.name = ?2 and f.componentId = ?3";

            List<QueryParams> queryParams = Arrays.asList(
                    new QueryParams("OfficeFile.SysFilter.Archived", "", "[df\$OfficeFile.browse].genericFilter"),
                    new QueryParams("OfficeFile.SysFilter.PassedToArchives", "", "[df\$OfficeFile.browse].genericFilter"),
                    new QueryParams("OfficeFile.SysFilter.ObliteratedFiles", "", "[df\$OfficeFile.browse].genericFilter"),

                    new QueryParams("OfficeFile.SysFilter.Archived", "", "[df\$OfficeFile.lookup].genericFilter"),
                    new QueryParams("OfficeFile.SysFilter.PassedToArchives", "", "[df\$OfficeFile.lookup].genericFilter"),
                    new QueryParams("OfficeFile.SysFilter.ObliteratedFiles", "", "[df\$OfficeFile.lookup].genericFilter")
            );


            queryParams.each { QueryParams params ->
                em.createQuery(queryStr).setParameter(1, params.code).setParameter(2, params.name).setParameter(3, params.componentId)
                        .getResultList().each { Entity entity -> em.remove(entity) }
            }

            AppBeans.get(DocflowDeployerMBean.class).createSysFilters();
        }
    })
})

class QueryParams {
    String code;
    String name;
    String componentId;

    QueryParams(String code, String name, String componentId) {
        this.code = code
        this.name = name
        this.componentId = componentId
    }
}
