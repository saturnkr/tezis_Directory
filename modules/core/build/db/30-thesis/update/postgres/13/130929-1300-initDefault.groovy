import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.app.DocflowDeployerMBean

/*
 * Copyright (c) 2013 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */

/**
 *
 * @author pavlov
 * @version $Id: 130929-1300-initDefault.groovy 12077 2013-09-29 11:59:45Z pavlov $
 */

postUpdate.add({ AppBeans.get(DocflowDeployerMBean.class).initDefault("init"); })
