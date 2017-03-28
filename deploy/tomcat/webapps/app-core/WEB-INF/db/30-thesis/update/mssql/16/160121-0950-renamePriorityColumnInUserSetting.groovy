import com.haulmont.bali.util.Dom4j
import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.security.entity.UserSetting
import org.apache.commons.collections.CollectionUtils
import org.apache.commons.lang.StringUtils
import org.dom4j.Document
import org.dom4j.Element

/*
 * Copyright (c) 2016 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */

/**
 *
 * @author tsarev
 * @version $Id: 160121-0950-renamePriorityColumnInUserSetting.groovy 23752 2016-03-15 15:51:14Z shatokhin $
 */

postUpdate.add({
    Transaction tx = AppBeans.get(Persistence.class).createTransaction()
    EntityManager em = AppBeans.get(Persistence.class).getEntityManager()
    List<UserSetting> userSettings
    List listComponents = Arrays.asList('tm$Task.browse', 'tm$TaskGroup.edit', 'tm$TaskGroupTemplate.edit', 'df$MeetingDoc.edit')
    try {
        userSettings = em.createQuery("select p from sec\$UserSetting p where p.name in :listNames", UserSetting.class).setParameter("listNames", listComponents).getResultList();
        if (CollectionUtils.isNotEmpty(userSettings)) {
            for (UserSetting userSetting : userSettings) {
                Document doc
                if (!StringUtils.isEmpty(userSetting.getValue())) {
                    doc = Dom4j.readDocument(userSetting.getValue());

                    Element root = doc.getRootElement();
                    final Element componentsElem = root.element("components");

                    for (Element compElem : Dom4j.elements(componentsElem, "component")) {
                        if ("tasksTable".equals(compElem.attributeValue("name"))
                                || "cardsTable".equals(compElem.attributeValue("name"))
                                || "taskGroupTasksFrame.tasksTable".equals(compElem.attributeValue("name"))
                                || "solutionFrame.solutionsTable".equals(compElem.attributeValue("name"))) {

                            Element columnsElem = compElem.element("columns");
                            for (Element colElem : Dom4j.elements(columnsElem, "columns")) {
                                if ("priority".equals(colElem.attributeValue("id"))) {
                                    colElem.addAttribute("id", "priority.orderNo")
                                }
                            }
                        }
                    }
                    userSetting.setValue(Dom4j.writeDocument(doc, false))
                    em.merge(userSetting)
                }
            }
        }
        tx.commit();
    } finally {
        tx.end();
    }
})
