import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.fts.ThesisFtsManagerAPI

/*
 * Copyright (c) 2014 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */

/**
 *
 * @author gaponenkov
 * @version $Id: 140115-1900-reindexUser.groovy 14352 2014-01-15 15:03:40Z gaponenkov $
 */

postUpdate.add({
    ThesisFtsManagerAPI ftsManager = AppBeans.get(ThesisFtsManagerAPI.NAME);
    ftsManager.reindexEntity("tm\$User");
    ftsManager.processQueue()
})
