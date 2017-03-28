/*
 * Copyright (c) 2015 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */



import com.haulmont.bali.util.Dom4j
import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.security.entity.UserSetting
import org.apache.commons.collections.CollectionUtils
import org.apache.commons.lang.StringUtils
import org.dom4j.Attribute
import org.dom4j.Document
import org.dom4j.Element

/**
 * @author hasanov
 * @version $Id: 150205-1300-setPreviewSplitPosition.groovy 18935 2015-02-05 09:25:22Z hasanov $
 */

postUpdate.add({
    Transaction tx = AppBeans.get(Persistence.class).createTransaction();
    EntityManager em = AppBeans.get(Persistence.class).getEntityManager();
    List<UserSetting> userSettings;
    List listNames=new ArrayList();
    listNames.add('df$SimpleDoc.edit');
    listNames.add('tm$Task.edit');
    listNames.add('df$Contract.edit');
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
                    if( "cardAttachmentsFrame.previewSplit".equals(compElem.attributeValue("name"))) {
                        for (Element position : Dom4j.elements(compElem, "position")) {
                            Attribute value = position.attribute("value");
                            if (value != null && value.getValue().equals("100"))
                                value.setValue("30");
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