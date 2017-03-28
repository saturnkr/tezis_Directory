/*
 * Copyright (c) 2014 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */

import com.haulmont.bali.util.Dom4j
import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.security.entity.Presentation
import com.haulmont.cuba.security.entity.UserSetting
import org.apache.commons.collections.CollectionUtils
import org.apache.commons.lang.StringUtils
import org.dom4j.Document
import org.dom4j.DocumentHelper
import org.dom4j.Element

/**
 *
 * @author kozyaikin
 * @version $Id: 140722-1046-updatePresentationInUserSetting.groovy 16802 2014-07-22 11:45:51Z kozyaikin $
 */

postUpdate.add({
    Transaction tx = AppBeans.get(Persistence.class).createTransaction();
    EntityManager em = AppBeans.get(Persistence.class).getEntityManager();
    List<UserSetting> userSettings;
    List listNames=new ArrayList();
    listNames.add('df$SimpleDoc.browse');
    listNames.add('tm$Task.browse');
    listNames.add('df$Contract.browse');
    listNames.add('df$DocIncome.browse');
    listNames.add('df$DocInternal.browse');
    listNames.add('df$DocOutcome.browse');
    try {
        userSettings = em.createQuery("select p from sec\$UserSetting p where p.name in :listNames").setParameter("listNames",listNames).getResultList();
        if(CollectionUtils.isNotEmpty(userSettings)) {
            for (UserSetting userSetting:userSettings){
                Document doc;
                if (!StringUtils.isEmpty(userSetting.getValue())) {
                    doc = Dom4j.readDocument(userSetting.getValue());
                }
                Element root= doc.getRootElement();
                final Element componentsElem = root.element("components");

                for (Element compElem : Dom4j.elements(componentsElem, "component")) {
                    if( "docsTable".equals(compElem.attributeValue("name")) ||
                        "tasksTable".equals(compElem.attributeValue("name")) ||
                        "cardsTable".equals(compElem.attributeValue("name"))){

                        final Element columnsElem = compElem.element("columns");
                        boolean haveProject=false;
                        for (Element colElem : Dom4j.elements(columnsElem, "columns")) {
                            if("project".equals(colElem.attributeValue("id"))){
                                haveProject=true;
                                break;
                            }
                        }
                        if(!haveProject){
                            Element projectNode=DocumentHelper.createElement("columns")
                            projectNode.addAttribute("id","project")
                            projectNode.addAttribute("visible","false")
                            columnsElem.add(projectNode);
                        }
                    }
                }
                userSetting.setValue(Dom4j.writeDocument(doc,false))
                em.merge(userSetting)
            }
        }
        tx.commit();
    } finally {
        tx.end();
    }
})