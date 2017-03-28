import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.TypedQuery
import com.haulmont.cuba.core.entity.Config
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.sys.AppContext
import com.haulmont.thesis.core.app.ConfigPropertiesService

import javax.management.MBeanServerConnection
import javax.management.ObjectName
import java.lang.management.ManagementFactory

postUpdate.add({
    Persistence persistence = AppBeans.get(Persistence.class)
    ConfigPropertiesService configPropertiesService = AppBeans.get(ConfigPropertiesService.NAME)

    Transaction transaction = persistence.getTransaction()
    try {
        EntityManager em = persistence.entityManager
        TypedQuery<Config> query = em.createQuery('select c from sys$Config c where c.name in (:configNameList)', Config.class)
        query.setParameter('configNameList', ['taskman.useDepartmentCodeInUserName', 'taskman.usePositionInUserName'])
        List<Config> configList = query.resultList

        if (configList.isEmpty())
            return

        String confDir = AppContext.getProperty('cuba.confDir').replace('-core', '')
        String pathApp = confDir + '/local.web-app.properties'
        String pathAppCore = confDir + '-core/local.app.properties'
        String pathPortal = confDir + '-portal/local.app.properties'
        String pathMobile = confDir + '-mobile/local-mobile.app.properties'

        LinkedHashMap newConfigParametersApp = new LinkedHashMap()
        LinkedHashMap newConfigParametersWebApp = new LinkedHashMap()
        LinkedHashMap newConfigParametersPortal = new LinkedHashMap()
        LinkedHashMap newConfigParametersMobile = new LinkedHashMap()

        Map configParametersApp = configPropertiesService.readConfig('file:///' + pathAppCore)
        Map configParametersWebApp = configPropertiesService.readConfig('file:///' + pathApp)
        Map configParametersPortal = configPropertiesService.readConfig('file:///' + pathPortal)
        Map configParametersMobile = configPropertiesService.readConfig('file:///' + pathMobile)

        if (configParametersApp != null) newConfigParametersApp.putAll(configParametersApp)
        if (configParametersWebApp != null) newConfigParametersWebApp.putAll(configParametersWebApp)
        if (configParametersPortal != null) newConfigParametersPortal.putAll(configParametersPortal)
        if (configParametersMobile != null) newConfigParametersMobile.putAll(configParametersMobile)

        MBeanServerConnection connection = ManagementFactory.getPlatformMBeanServer()
        List<ObjectName> mBeans = new LinkedList(connection.queryNames(new ObjectName('*:type=ConfigStorage'), null))

        for (Config config : configList) {
            String key = config.name
            String value = config.value
            for (Map map : [newConfigParametersWebApp, newConfigParametersApp, newConfigParametersPortal, newConfigParametersMobile])
                map.put(key, value)

            Object[] params = [key, value]
            String[] signature = ['java.lang.String', 'java.lang.String']
            for (ObjectName mBean : mBeans)
                connection.invoke(mBean, 'setAppProperty', params, signature)

            em.remove(config)
        }

        configPropertiesService.writeConfig(pathAppCore, newConfigParametersApp)
        configPropertiesService.writeConfig(pathApp, newConfigParametersWebApp)
        configPropertiesService.writeConfig(pathPortal, newConfigParametersPortal)
        configPropertiesService.writeConfig(pathMobile, newConfigParametersMobile)

        transaction.commit()
    } catch (Exception ex) {
        throw new RuntimeException(ex)
    } finally {
        transaction.end()
    }
})