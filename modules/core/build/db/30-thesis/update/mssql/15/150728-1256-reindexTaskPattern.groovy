/*
 * Copyright (c) 2015 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.global.Metadata
import com.haulmont.thesis.core.entity.TaskPattern
import com.haulmont.thesis.core.fts.ThesisFtsManagerAPI

/**
 * Created by timokhov on 28.07.2015.
 */
postUpdate.add({
    ThesisFtsManagerAPI ftsManager = AppBeans.get(ThesisFtsManagerAPI.NAME);
    Metadata metadata = AppBeans.get(Metadata.NAME);
    ftsManager.reindexEntity(metadata.getExtendedEntities().getEffectiveMetaClass(TaskPattern.class).getName());
    ftsManager.processQueue()
})
