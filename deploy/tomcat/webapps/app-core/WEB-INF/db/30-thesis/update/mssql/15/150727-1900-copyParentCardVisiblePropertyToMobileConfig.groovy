import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.sys.AppContext
import com.haulmont.thesis.core.app.ConfigPropertiesService

/*
 * Copyright (c) 2015 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */

/**
 *
 * @author mishunin
 * @version $Id: 150727-1900-copyParentCardVisiblePropertyToMobileConfig.groovy 21320 2015-08-19 07:36:23Z mishunin $
 */

postUpdate.add({
    ConfigPropertiesService configPropertiesService = AppBeans.get(ConfigPropertiesService.NAME)

    String confDir = AppContext.getProperty('cuba.confDir').replace('-core', '')
    String pathApp = confDir + '/local.web-app.properties'
    String pathMobile = confDir + '-mobile/local-mobile.app.properties'

    Map<String, Object> configParametersWebApp = configPropertiesService.readConfig('file:///' + pathApp)

    String key = 'thesis.parentCardVisible'
    String value = configParametersWebApp.get(key)

    if (value != null) {
        Map<String, Object> configParametersMobile = configPropertiesService.readConfig('file:///' + pathMobile)
        LinkedHashMap<String, Object> newConfigParametersMobile = new LinkedHashMap()
        if (configParametersMobile != null) newConfigParametersMobile.putAll(configParametersMobile)

        newConfigParametersMobile.put(key, value)
        newConfigParametersMobile.remove("mobile.app.taskman.parentCardVisible")

        configPropertiesService.writeConfig(pathMobile, newConfigParametersMobile)
    }
})