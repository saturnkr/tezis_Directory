import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.global.Metadata
import com.haulmont.thesis.core.entity.SimpleDoc
import com.haulmont.thesis.core.fts.ThesisFtsManagerAPI

/*
 * Copyright (c) 2015 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */

/**
 *
 * @author gaslov
 * @version $Id: 150827-1200-reindexSimpleDoc.groovy 21456 2015-08-27 10:24:15Z gaslov $
 */

postUpdate.add({
    ThesisFtsManagerAPI ftsManager = AppBeans.get(ThesisFtsManagerAPI.NAME);
    Metadata metadata = AppBeans.get(Metadata.NAME);
    ftsManager.reindexEntity(metadata.getExtendedEntities().getEffectiveMetaClass(SimpleDoc.class).getName());
    ftsManager.processQueue()
})