import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.global.ClientType
import com.haulmont.cuba.security.entity.User
import com.haulmont.cuba.security.entity.UserSetting
import groovy.transform.Field
import org.ocpsoft.prettytime.shade.org.apache.commons.lang.StringUtils

/*
 * Copyright (c) 2015 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */

/**
 * @author chekashkin
 * @version $Id: 151021-1530-migrateSplitSettings.groovy 22260 2015-10-21 13:08:36Z chekashkin $
 */
@Field
final String FOLDERS_PANE_DOCKED_SETTING = "foldersPaneDocked"
@Field
final String FOLDERS_PANE_SCRIPT_SETTING = "foldersPaneState"

postUpdate.add({
    Transaction tx = AppBeans.get(Persistence.class).createTransaction();
    EntityManager em = AppBeans.get(Persistence.class).getEntityManager();

    List<UserSetting> userSettings;
    try {
        userSettings = em.createQuery("select us from sec\$UserSetting us where us.name in :names")
                .setParameter("names", ["foldersState", FOLDERS_PANE_SCRIPT_SETTING, FOLDERS_PANE_DOCKED_SETTING])
                .getResultList();

        userSettings.findAll {
            it.name == "foldersState" && StringUtils.isNotBlank(it.value)
        }.each { UserSetting setting ->
            String[] value = setting.getValue().split(",");
            Integer hPos = value[1].toInteger();

            UserSetting paneStateSetting = findUserSetting(setting.user, FOLDERS_PANE_SCRIPT_SETTING, userSettings);
            if (!paneStateSetting && hPos != null && hPos != -1) {
                saveSetting(FOLDERS_PANE_SCRIPT_SETTING, hPos.toString(), setting.user, em);

                Boolean isDocked = 0 == hPos;
                UserSetting paneDockSetting = findUserSetting(setting.user, FOLDERS_PANE_DOCKED_SETTING, userSettings);
                if (!paneDockSetting)
                    saveSetting(FOLDERS_PANE_DOCKED_SETTING, isDocked.toString(), setting.user, em);
            }
        }
        tx.commit();
    } finally {
        tx.end();
    }
})

def saveSetting(String name, String value, User user, EntityManager em) {
    UserSetting us = new UserSetting();
    us.setUser(user);
    us.setName(name);
    us.setClientType(ClientType.WEB);
    us.setValue(value);
    em.persist(us);
}

def UserSetting findUserSetting(User user, String setting, Collection<UserSetting> settings) {
    return settings.find { it.user?.equals(user) && it.name == setting };
}