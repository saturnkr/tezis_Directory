import com.haulmont.cuba.core.Locator
import com.haulmont.thesis.core.app.TaskmanDeployerMBean

/*
 * Copyright (c) 2013 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */

/**
 *
 * @author Saiyan Sergey
 * @version $Id: 130840-1500-taskmanInitDefault.groovy 12781 2013-10-25 09:55:02Z saiyan $
 */

postUpdate.add({
    TaskmanDeployerMBean taskmanDeployerMBean = Locator.lookup("tm_TaskmanDeployer");
    taskmanDeployerMBean.initDefault("init");
});