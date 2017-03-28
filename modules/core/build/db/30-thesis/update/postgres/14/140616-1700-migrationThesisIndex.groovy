import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.fts.index.ThesisFtsMigrationWorker

/*
 * Copyright (c) 2014 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */


postUpdate.add({
    AppBeans.get(ThesisFtsMigrationWorker.class).createTaskForFtsMigration();
})