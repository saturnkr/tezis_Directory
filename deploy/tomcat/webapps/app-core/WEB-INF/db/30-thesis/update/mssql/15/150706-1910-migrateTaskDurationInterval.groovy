/*
 * Copyright (c) 2015 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.global.Configuration
import com.haulmont.thesis.core.config.TmConfig

/**
 *
 * @author mishunin
 * @version $Id: 150706-1910-migrateTaskDurationInterval.groovy 20632 2015-07-07 07:40:29Z mishunin $
 */

postUpdate.add({
    int millisecondInMinute = 60000

    Configuration configuration = AppBeans.get(Configuration.NAME)
    TmConfig tmConfig = configuration.getConfig(TmConfig.class)

    int overdueTaskInterval = Integer.parseInt(tmConfig.getNotifyOverdueTaskInterval())
    int taskDuration = Integer.parseInt(tmConfig.getNotifiableTaskDuration())
    if (overdueTaskInterval >= millisecondInMinute)
        tmConfig.setNotifyOverdueTaskInterval((overdueTaskInterval / millisecondInMinute).toString())
    if (taskDuration >= millisecondInMinute)
        tmConfig.setNotifiableTaskDuration((taskDuration / millisecondInMinute).toString())
})
