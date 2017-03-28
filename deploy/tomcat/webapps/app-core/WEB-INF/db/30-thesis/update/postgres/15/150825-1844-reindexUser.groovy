import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.global.Metadata
import com.haulmont.cuba.security.entity.User
import com.haulmont.thesis.core.fts.ThesisFtsManagerAPI

/*
 * Copyright (c) 2015 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */

/**
 *
 * @author mishunin
 * @version $Id: 150825-1844-reindexUser.groovy 21404 2015-08-25 15:06:39Z mishunin $
 */

postUpdate.add({
    ThesisFtsManagerAPI ftsManager = AppBeans.get(ThesisFtsManagerAPI.NAME);
    Metadata metadata = AppBeans.get(Metadata.NAME);
    ftsManager.reindexEntity(metadata.getExtendedEntities().getEffectiveMetaClass(User.class).getName());
    ftsManager.processQueue()
})