import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.sys.DbUpdater
import com.haulmont.thesis.core.app.TaskmanDeployerMBean
import org.apache.commons.logging.Log
import org.apache.commons.logging.LogFactory

/*
 * Copyright (c) 2014 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */

/**
 * @author Sergey Saiyan
 * @version $Id: 141002-1830-deployTaskProcess.groovy 17619 2014-10-02 15:48:38Z saiyan $
 */

postUpdate.add({
    try {
        TaskmanDeployerMBean taskmanDeployerMBean = AppBeans.get(TaskmanDeployerMBean.class);
        taskmanDeployerMBean.deployProcess();
    } catch (Exception ex) {
        Log log = LogFactory.getLog(DbUpdater.class);
        log.error("Could not deploy Task process");
        log.error(ex);
        // try to run app anyway
    }
})
