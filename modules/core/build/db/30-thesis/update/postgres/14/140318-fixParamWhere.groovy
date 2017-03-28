import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.sys.DbUpdater
import com.haulmont.cuba.security.entity.FilterEntity
import com.haulmont.cuba.security.entity.SearchFolder
import org.apache.commons.logging.Log
import org.apache.commons.logging.LogFactory

import java.util.regex.Matcher
import java.util.regex.Pattern



postUpdate.add({

    Transaction tx = AppBeans.get(Persistence.class).createTransaction();
    EntityManager em = AppBeans.get(Persistence.class).getEntityManager();
    List<SearchFolder> searchFolders;
    try {
        searchFolders = em.createQuery("select sf from sec\$SearchFolder sf where sf.filterXml like '%paramWhere%'").getResultList();
        searchFolders.each { SearchFolder searchFolder ->

            searchFolder.setFilterXml(Transformer.transform(searchFolder.getFilterXml()));
        }

        query = em.createQuery("select f from sec\$Filter f where f.xml like '%paramWhere%'")
        List<FilterEntity> filters = query.getResultList();
        for (FilterEntity filter : filters) {

            filter.setXml(Transformer.transform(filter.getXml()));
        }
        tx.commit();
    } finally {
        tx.end();
    }
})

final class Transformer {

    static Pattern findAliasPattern = Pattern.compile("paramWhere=\"(not )*\\s*(\\w{1,5}.)");

    static Log log = LogFactory.getLog(DbUpdater.class);

    public static String transform(String input) {

        log.info("Start transforming string :");
        log.info(input);

        Matcher findAliasMatcher = findAliasPattern.matcher(input);

        Map<String, String> regionsToReplace = new LinkedHashMap<String, String>();

        while (findAliasMatcher.find()) {

            String aliasGroup = findAliasMatcher.group(2);
            String alias = aliasGroup.substring(0, aliasGroup.length() - 1);
            String aliasRegexFirst = "^paramWhere=\"" + alias + "\\.";
            String aliasRegexMiddle = " " + alias + "\\.";

            int startIdx = findAliasMatcher.start();

            boolean found = false;
            int pos = startIdx + "paramWhere=\"".length();
            while (!found && pos++ < input.length()) {
                char c = input.charAt(pos);
                found = c == '"';
            }

            String region = input.substring(startIdx, pos + 1);
            System.out.println("Region : " + region);

            String replacedRegion = region
                    .replaceAll(aliasRegexFirst, "paramWhere=\"{E}.")
                    .replaceAll(aliasRegexMiddle, " {E}.");

            regionsToReplace.put(region, replacedRegion);
        }

        for (String region : regionsToReplace.keySet()) {
            input = input.replace(region, regionsToReplace.get(region));
        }

        log.info("Finished transforming string. Result : ")
        log.info(input);

        return input;
    }
}