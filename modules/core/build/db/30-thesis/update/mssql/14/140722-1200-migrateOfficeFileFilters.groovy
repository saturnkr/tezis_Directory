import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.entity.AbstractSearchFolder
import com.haulmont.cuba.core.entity.AppFolder
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.sys.DbUpdater
import com.haulmont.cuba.security.entity.FilterEntity
import com.haulmont.cuba.security.entity.SearchFolder
import com.haulmont.cuba.security.entity.User
import org.apache.commons.logging.Log
import org.apache.commons.logging.LogFactory

import java.util.regex.Matcher
import java.util.regex.Pattern

/*
 * Copyright (c) 2014 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */

/**
 * Migrates filters and folders
 *
 * @author Sergey Saiyan
 * @version $Id: 140722-1200-migrateOfficeFileFilters.groovy 16813 2014-07-23 06:59:05Z tsarevskiy $
 */
postUpdate.add({
    AppBeans.get(Persistence.class).createTransaction().execute(new Transaction.Runnable() {

        Log log = LogFactory.getLog(DbUpdater.class);

        @Override
        public void run(EntityManager em) {

            String[] keys = ["closed", "inArchive", "destroyed"]

            /* Update filters */
            List<FilterEntity> filters = em.createQuery("select f from sec\$Filter f where f.componentId = :componentName" +
                    " and (f.xml like :xmlCriteria1 or f.xml like :xmlCriteria2 or f.xml like :xmlCriteria3)" +
                    // system filters will be updated in DocflowDeployer
                    " and f.code is null")
                    .setParameter("componentName", "[df\$OfficeFile.browse].genericFilter")
                    .setParameter("xmlCriteria1", "%OfficeFile.closed%")
                    .setParameter("xmlCriteria2", "%OfficeFile.inArchive%")
                    .setParameter("xmlCriteria3", "%OfficeFile.destroyed%")
                    .getResultList();

            /* Try to find and update only one global filter */
            FilterEntity globalFilter = findGlobalFilter(filters);
            if (globalFilter != null) {
                for (String key : keys) {
                    if (globalFilter.getXml().contains(key)) {
                        updateFilter(globalFilter, key);
                    }
                }
                for (FilterEntity filterEntity : filters) {
                    if (globalFilter != filterEntity) {
                        em.remove(filterEntity);
                    }
                }
            } else {
                /* Each user needs only one OfficeFileState filter */
                Set<User> usersWithUpdatedFilters = new HashSet<>();
                for (FilterEntity filter : filters) {
                    if (!usersWithUpdatedFilters.contains(filter.getUser())) {
                        for (String key : keys) {
                            if (filter.getXml().contains(key)) {
                                updateFilter(filter, key);
                                usersWithUpdatedFilters.add(filter.getUser());
                            }
                        }
                    } else {
                        em.remove(filter);
                    }
                }
            }

            /* App folders */
            List<AppFolder> appFolders = em.createQuery("select f from sys\$AppFolder f where f.filterComponentId = :componentName" +
                    " and (f.filterXml like :xml1 or f.filterXml like :xml2 or f.filterXml like :xml3)")
                    .setParameter("componentName", "[df\$OfficeFile.browse].genericFilter")
                    .setParameter("xml1", "%OfficeFile.closed%")
                    .setParameter("xml2", "%OfficeFile.inArchive%")
                    .setParameter("xml3", "%OfficeFile.destroyed%")
                    .getResultList();

            /* Update one app folder, remove others */
            if (appFolders.size() > 0) {
                AppFolder firstFolder = appFolders.get(0);
                for (String key : keys) {
                    if (firstFolder.getFilterXml().contains(key)) {
                        updateFolder(firstFolder, key);
                    }
                }
                for (int i = 1; i < appFolders.size(); i++) {
                    em.remove(appFolders.get(i));
                }
            }

            List<SearchFolder> searchFolders = em.createQuery("select f from sec\$SearchFolder f where f.filterComponentId = :componentName" +
                    " and (f.filterXml like :xml1 or f.filterXml like :xml2 or f.filterXml like :xml3)")
                    .setParameter("componentName", "[df\$OfficeFile.browse].genericFilter")
                    .setParameter("xml1", "%OfficeFile.closed%")
                    .setParameter("xml2", "%OfficeFile.inArchive%")
                    .setParameter("xml3", "%OfficeFile.destroyed%")
                    .getResultList();

            SearchFolder globalFolder = findGlobalSearchFolder(searchFolders);
            if (globalFolder != null) {
                for (String key : keys) {
                    if (globalFolder.getFilterXml().contains(key)) {
                        updateFolder(globalFolder, key);
                    }
                }
                for (SearchFolder folder : searchFolders) {
                    if (globalFolder != folder) {
                        em.remove(folder);
                    }
                }
            } else {
                /* Each user needs only one OfficeFileState search folder */
                Set<User> usersWithUpdatedFolders = new HashSet<>();
                for (SearchFolder folder : searchFolders) {
                    if (!usersWithUpdatedFolders.contains(folder.getUser())) {
                        for (String key : keys) {
                            if (folder.getFilterXml().contains(key)) {
                                updateFolder(folder, key);
                                usersWithUpdatedFolders.add(folder.getUser());
                            }
                        }
                    } else {
                        em.remove(folder);
                    }
                }
            }
        }

        protected FilterEntity findGlobalFilter(List<FilterEntity> filters) {
            for (FilterEntity filter : filters) {
                if (filter.getUser() == null) {
                    return filter;
                }
            }
            return null;
        }

        protected SearchFolder findGlobalSearchFolder(List<SearchFolder> folders) {
            for (SearchFolder folder : folders) {
                if (folder.getUser() == null) {
                    return folder;
                }
            }
            return null;
        }

        protected void updateFilter(FilterEntity filterEntity, String key) {
            log.info("Old xml :\n" + filterEntity.getXml());
            String updXml = replace(filterEntity.getXml(), key);
            filterEntity.setXml(updXml);
            log.info("New xml :\n" + updXml);
        }

        protected void updateFolder(AbstractSearchFolder folder, String key) {
            log.info("Old xml :\n" + folder.getFilterXml());
            String updXml = replace(folder.getFilterXml(), key);
            folder.setFilterXml(updXml);
            log.info("New xml :\n" + updXml);
        }

        protected String replace(String xml, String key) {
            Pattern mainConditionPattern = Pattern.compile("<c name=\"" + key + "\" .+</c>", Pattern.DOTALL);
            Pattern operatorTypePattern = Pattern.compile("operatorType=\"(.+)\"");
            Pattern componentPattern = Pattern.compile("." + key + " .+\n");
            Pattern paramPattern = Pattern.compile("<param .+</param>");

            String paramStr = "<param name=\"component\$genericFilter.state12345\" javaClass=\"com.haulmont.thesis.core.enums.OfficeFileState\">NULL</param>";

            Matcher matcher = mainConditionPattern.matcher(xml);

            if (matcher.find()) {
                String conditionGroup = matcher.group();
                String updGroup = conditionGroup
                        .replace("class=\"java.lang.Boolean\"", "class=\"com.haulmont.thesis.core.enums.OfficeFileState\"")
                        .replace("name=\"" + key + "\"", "name=\"state\"")
                        .replace("entity/OfficeFile." + key, "entity/OfficeFile.state");

                Matcher operatorTypeMatcher = operatorTypePattern.matcher(updGroup);
                if (operatorTypeMatcher.find()) {
                    String operatorType = operatorTypeMatcher.group(1);
                    updGroup = updGroup.replace("operatorType=\"" + operatorType + "\"", "operatorType=\"EQUAL\"");
                }

                Matcher componentMatcher = componentPattern.matcher(updGroup);
                if (componentMatcher.find()) {
                    updGroup = updGroup.replace(componentMatcher.group(), ".state = :component\$genericFilter.state12345\n");
                }

                Matcher paramMatcher = paramPattern.matcher(updGroup);
                if (paramMatcher.find()) {
                    updGroup = updGroup.replace(paramMatcher.group(), paramStr);
                }

                updGroup = updGroup.replace(" unary=\"true\"", "").replace(" unary=\"false\"", "");

                return xml.replace(conditionGroup, updGroup);
            } else {
                log.error("Could not update filter xml :\n");
                log.error(xml);
                return xml;
            }
        }
    })
})
