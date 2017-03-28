/*
 * Copyright (c) 2015 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.chile.core.model.MetaClass
import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.global.Metadata
import com.haulmont.cuba.security.entity.UserSetting
import com.haulmont.thesis.core.entity.Doc

/**
 *
 * @author kozyaikin
 * @version $Id: 150605-1249-updateDefaultTemplateUserSetting.groovy 20302 2015-06-05 11:19:06Z kozyaikin $
 */

postUpdate.add({
    Metadata metadata = AppBeans.get(Metadata.class);
    Transaction tx = AppBeans.get(Persistence.class).createTransaction();
    EntityManager em = AppBeans.get(Persistence.class).getEntityManager();
    List<UserSetting> userSettings;
    try {
        userSettings = em.createQuery("select us from sec\$UserSetting us where us.name like 'template.%'").getResultList();
        List<MetaClass> metaClasses = new ArrayList<>();
        MetaClassesGetter.initDocOriginalMetaClasses(metadata.getClassNN(Doc.class), metaClasses, metadata);
        for (MetaClass metaClass : metaClasses) {
            MetaClass effectiveMetaClass = metadata.getExtendedEntities().getEffectiveMetaClass(metaClass);
            if (metaClass.equals(effectiveMetaClass)) continue;
            for (UserSetting userSetting : userSettings) {
                String effectiveName = "template." + effectiveMetaClass.getName();
                String originalName = "template." + metaClass.getName();
                if (userSetting.getName().contains(effectiveName)) {
                    userSetting.setName(userSetting.getName().replace(effectiveName, originalName));
                    em.merge(userSetting);
                }
            }
        }
        tx.commit();
    } finally {
        tx.end();
    }
})

class MetaClassesGetter {
    public
    static void initDocOriginalMetaClasses(MetaClass parentMetaClass, List<MetaClass> metaClasses, Metadata metadata) {
        for (MetaClass metaClass : parentMetaClass.getDescendants()) {
            MetaClass originalMetaClass = getOriginalMetaClass(metaClass, metadata);
            if (!metaClasses.contains(originalMetaClass))
                metaClasses.add(originalMetaClass);
            initDocOriginalMetaClasses(metaClass, metaClasses, metadata);
        }
    }

    protected static MetaClass getOriginalMetaClass(MetaClass metaClass, Metadata metadata) {
        MetaClass orgMetaClass = metadata.getExtendedEntities().getOriginalMetaClass(metaClass);
        return orgMetaClass == null ? metaClass : orgMetaClass;
    }
}

