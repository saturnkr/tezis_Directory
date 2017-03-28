import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.app.DocflowDeployerMBean

/*
 * Copyright (c) 2015 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */

/**
 *
 * @author kozyaikin
 * @version $Id: 150507-1220-initDefault.groovy 20170 2015-05-22 14:35:38Z kozyaikin $
 */
postUpdate.add({ AppBeans.get(DocflowDeployerMBean.class).initDefault("init"); })
