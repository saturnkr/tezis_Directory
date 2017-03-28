import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.global.Configuration
import com.haulmont.cuba.security.entity.ScreenHistoryEntity
import com.haulmont.thesis.core.config.ThesisConfig
import org.apache.commons.collections.CollectionUtils
import org.apache.commons.lang.StringUtils
import org.apache.commons.logging.Log
import org.apache.commons.logging.LogFactory

/*
 * Copyright (c) 2014 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */

/**
 *
 * @author chekashkin
 * @version $Id: 140609-1550-deleteOpenfromhistoryParamFromLinks.groovy 17724 2014-10-10 12:17:52Z saiyan $
 */

postUpdate.add({
    Log log = LogFactory.getLog(getClass());

    Persistence persistence = AppBeans.get(Persistence.NAME);
    Long cnt = persistence.createTransaction().execute(new Transaction.Callable<Long>() {
        @Override
        Long call(EntityManager em) {
            return em.createQuery("select count(h) from sec\$ScreenHistory h").getSingleResult() as Long;
        }
    });
    if (cnt <= 0) return
    log.debug("Found " + cnt + " screen history items")

    final int BULK_SIZE = 5000;
    int iterations = cnt / BULK_SIZE + 1;

    String excludedParams = AppBeans.get(Configuration.class).getConfig(ThesisConfig.class).getScreenHistoryExcludedParams();
    String regex = '';
    if (StringUtils.isNotBlank(excludedParams)) {
        for (String key : excludedParams.split("\\s*,\\s*")) {
            regex += key + ':|'
        }
    }
    regex += 'openFromScreenHistory:'
    regex = '(,)(param\\$)*(' + regex + ')(true|false)'

    for (int i = 0; i < iterations; i++) {
        persistence.createTransaction().execute(new Transaction.Runnable() {
            @Override
            void run(EntityManager em) {
                List<ScreenHistoryEntity> screenHistoryEntities = em.createQuery("select s from sec\$ScreenHistory s")
                        .setMaxResults(BULK_SIZE)
                        .setFirstResult(i * BULK_SIZE)
                        .getResultList();

                if (CollectionUtils.isNotEmpty(screenHistoryEntities)) {
                    screenHistoryEntities.each { entity ->
                        String url = entity.url;
                        url = url.replaceAll(regex, '')
                        entity.setUrl(url)
                    }
                }

                log.debug("Processed " + i + " partition of screen history items")
            }
        })
    }
})

