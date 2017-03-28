import com.haulmont.bali.datastruct.Pair
import com.haulmont.bali.db.DbUtils
import com.haulmont.bali.db.QueryRunner
import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.global.Configuration
import com.haulmont.cuba.core.sys.persistence.DbTypeConverter
import com.haulmont.thesis.core.config.ThesisConfig
import org.apache.commons.lang.StringUtils
import org.apache.commons.logging.Log
import org.apache.commons.logging.LogFactory

import java.sql.PreparedStatement
import java.sql.ResultSet
import java.sql.SQLException
import java.sql.Types
import java.util.regex.Matcher
import java.util.regex.Pattern

/*
 * Copyright (c) 2014 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */

/**
 *
 * @author chekashkin
 * @version $Id: 140609-1550-deleteOpenfromhistoryParamFromLinks.groovy 19068 2015-02-16 11:49:35Z tsarevskiy $
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

    Boolean dbAbleToLimit = persistence.createTransaction().execute(new Transaction.Callable<Boolean>() {
        @Override
        Boolean call(EntityManager em) {
            boolean result = true;
            PreparedStatement ps = null;
            try {
                ps = em.getConnection().prepareStatement("select url, id from sec_screen_history order " +
                        "by create_ts offset 0 rows fetch next 1 rows only",
                        ResultSet.TYPE_SCROLL_INSENSITIVE,
                        ResultSet.CONCUR_READ_ONLY);
                try {
                    ps.executeQuery();
                } finally {
                    ps.close();
                }
            } catch (Exception e) {
                result = false;
            } finally {
                DbUtils.close(ps);
            }
            return result;
        }
    });

    log.debug("deleteOpenfromhistoryParamFromLinks script db able to limit " + dbAbleToLimit);

    String excludedParams = AppBeans.get(Configuration.class).getConfig(ThesisConfig.class).getScreenHistoryExcludedParams();
    String regex = '';
    if (StringUtils.isNotBlank(excludedParams)) {
        for (String key : excludedParams.split("\\s*,\\s*")) {
            regex += key + ':|'
        }
    }
    regex += 'openFromScreenHistory:'
    regex = '(,)(param\\$)*(' + regex + ')(true|false)'

    Pattern pattern = Pattern.compile(regex);

    for (int i = 0; i < iterations; i++) {
        persistence.createTransaction().execute(new Transaction.Runnable() {
            @Override
            void run(EntityManager em) {
                DbTypeConverter converter = persistence.getDbTypeConverter();
                QueryRunner runner = new QueryRunner();
                String sql = "SELECT A.url, A.id FROM (SELECT row_number() OVER (ORDER BY id) AS rownum, url, " +
                        "id FROM SEC_SCREEN_HISTORY) AS A WHERE A.rownum BETWEEN ? AND ?";
                if (dbAbleToLimit) {
                    sql = "select url, id from sec_screen_history order by create_ts offset ? rows fetch " +
                            "next ? rows only"
                }

                PreparedStatement stmt = null;
                ResultSet rs = null;

                Object[][] batchParams
                List<Pair<Object, Object>> batchParamslist = null;
                try {
                    PreparedStatement preparedStatement = em.getConnection().prepareStatement(sql,
                            ResultSet.TYPE_SCROLL_INSENSITIVE,
                            ResultSet.CONCUR_READ_ONLY);

                    preparedStatement.setInt(1, i * BULK_SIZE);
                    preparedStatement.setInt(2, i * BULK_SIZE + BULK_SIZE);
                    ResultSet resultSet = preparedStatement.executeQuery();
                    resultSet.last();

                    int size = resultSet.getRow();
                    resultSet.beforeFirst();

                    batchParamslist = new ArrayList<>(size);

                    while (resultSet.next()) {
                        Matcher matcher = pattern.matcher(resultSet.getString(1));
                        boolean result = matcher.find();
                        if (result) {
                            StringBuffer sb = new StringBuffer();
                            while ({
                                matcher.appendReplacement(sb, "");
                                matcher.find()
                            }());
                            matcher.appendTail(sb);
                            batchParamslist.add(
                                    new Pair<>(converter.getSqlObject(sb.toString()),
                                            converter.getSqlObject(resultSet.getObject(2))))
                        }
                    }
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } finally {
                    try {
                        DbUtils.close(rs);
                    } finally {
                        DbUtils.close(stmt);
                    }
                }
                sql = "update SEC_SCREEN_HISTORY set URL = ? where ID = ?";
                try {
                    int[] paramTypes = [Types.VARCHAR, Types.OTHER];
                    batchParams = new Object[batchParamslist.size()][2];
                    for (int j = 0; j < batchParamslist.size(); j++) {
                        batchParams[j][0] = batchParamslist.get(j).getFirst();
                        batchParams[j][1] = batchParamslist.get(j).getSecond();
                    }
                    runner.batch(em.getConnection(), sql, batchParams, paramTypes);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                log.debug("Processed " + i + " partition of screen history items")
            }
        })
    }
})