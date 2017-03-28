import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.fts.ThesisFtsManagerAPI

/*
 * Copyright (c) 2014 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */

// no post update
AppBeans.get(ThesisFtsManagerAPI.class).updateEntities("df\$ContractorAttachment", "df\$CorrespondentAttachment");