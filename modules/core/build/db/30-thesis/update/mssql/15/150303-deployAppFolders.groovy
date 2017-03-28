import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.sys.DbUpdater
import com.haulmont.cuba.security.app.Authentication
import com.haulmont.thesis.core.app.DocflowDeployer
import com.haulmont.thesis.core.app.DocflowDeployerMBean
import org.apache.commons.lang.exception.ExceptionUtils
import org.apache.commons.logging.LogFactory

/*
 * Copyright (c) 2015 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */

/**
 * @author Sergey Saiyan
 * @version $Id: 150303-deployAppFolders.groovy 19251 2015-03-03 13:18:45Z saiyan $
 */

postUpdate.add({
    Authentication authentication = AppBeans.get(Authentication.NAME);
    DocflowDeployerMBean bean = AppBeans.get(DocflowDeployer.NAME);
    try {
        authentication.begin()
        bean.deployAppFolders();
    } catch (Exception ex) {
        LogFactory.getLog(DbUpdater.class).error(ExceptionUtils.getStackTrace(ex))
    } finally {
        authentication.end()
    }
})
