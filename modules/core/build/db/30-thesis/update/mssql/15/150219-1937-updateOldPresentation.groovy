import com.haulmont.bali.util.Dom4j
import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.security.entity.Presentation
import org.apache.commons.collections.CollectionUtils
import org.apache.commons.lang.StringUtils
import org.dom4j.Document
import org.dom4j.DocumentHelper
import org.dom4j.Element

/*
 * Copyright (c) 2015 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */

/**
 *
 * @author kovalenko
 * @version $Id$
 */

postUpdate.add({
    Transaction tx = AppBeans.get(Persistence.class).createTransaction();
    EntityManager em = AppBeans.get(Persistence.class).getEntityManager();
    List<Presentation> presentations;
    List listComponents=new ArrayList();
    listComponents.add('[df$DocIncome.browse].cardsTable');
    listComponents.add('[df$DocOutcome.browse].cardsTable');
    listComponents.add('[df$DocInternal.browse].cardsTable');
    listComponents.add('[df$Doc.browse].cardsTable');
    try {
        presentations = em.createQuery("select p from sec\$Presentation p where p.componentId in :listComponents").setParameter("listComponents",listComponents).getResultList();
        if(CollectionUtils.isNotEmpty(presentations)) {
            for (Presentation presentation:presentations){
                Document doc;
                if (!StringUtils.isEmpty(presentation.getXml())) {
                    doc = Dom4j.readDocument(presentation.getXml());
                } else {
                    doc = DocumentHelper.createDocument();
                    doc.setRootElement(doc.addElement("presentation"));
                }
                Element root= doc.getRootElement();
                final Element columnsElem = root.element("columns");

                boolean haveProject=false;
                boolean haveImportant=false;
                boolean haveHasAttributes=false;
                Iterator<Element> iterator = Dom4j.elements(columnsElem, "columns").iterator();
                Element colElem;
                while(iterator.hasNext() && !(haveProject && haveImportant && haveHasAttributes)) {
                    colElem = iterator.next();
                    switch(colElem.attributeValue("id")) {
                        case "project":
                            haveProject=true;
                            break;
                        case "important":
                            haveImportant=true;
                            break;
                        case "hasAttributes":
                            haveHasAttributes=true;
                            break;
                    }
                }
                def addColumn = { boolean haveColumn, String nameOfColumn ->
                    if(!haveColumn) {
                        Element projectNode=DocumentHelper.createElement("columns")
                        projectNode.addAttribute("id",nameOfColumn)
                        projectNode.addAttribute("visible","false")
                        columnsElem.add(projectNode);
                    }
                }
                addColumn(haveProject, "project")
                addColumn(haveImportant, "important")
                addColumn(haveHasAttributes, "hasAttributes")
                presentation.setXml(Dom4j.writeDocument(doc,false))
                em.merge(presentation)
            }
        }
        tx.commit();
    } finally {
        tx.end();
    }
})
