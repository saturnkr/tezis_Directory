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
 * @version $Id: 150330-1552-updateOldPresentation.groovy 19690 2015-04-06 13:07:23Z kovalenko $
 */

postUpdate.add({
    Transaction tx = AppBeans.get(Persistence.class).createTransaction();
    EntityManager em = AppBeans.get(Persistence.class).getEntityManager();
    List listComponents=new ArrayList();
    listComponents.add('[df$Contract.browse].cardsTable');
    listComponents.add('[df$SimpleDoc.browse].cardsTable');
    listComponents.add('[df$Doc.browse].cardsTable');
    listComponents.add('[df$DocOutcome.browse].cardsTable');
    listComponents.add('[df$DocInternal.browse].cardsTable');
    listComponents.add('[df$DocIncome.browse].cardsTable');
    listComponents.add('[df$SimpleDoc.templateBrowse].docsTable');
    listComponents.add('[df$Contract.templateBrowse].docsTable');
    try {
        List<Presentation> presentations = em.createQuery("select p from sec\$Presentation p where p.componentId in :listComponents")
                .setParameter("listComponents",listComponents).getResultList();
        if (CollectionUtils.isNotEmpty(presentations)) {
            for (Presentation presentation : presentations) {
                Document doc;
                if (!StringUtils.isEmpty(presentation.getXml())) {
                    doc = Dom4j.readDocument(presentation.getXml());
                } else {
                    doc = DocumentHelper.createDocument();
                    doc.setRootElement(doc.addElement("presentation"));
                }
                Element root = doc.getRootElement();
                final Element columnsElem = root.element("columns");
                final String sortElem = columnsElem.attributeValue("sortProperty");
                final Element groupElem = root.element("groupProperties");
                def createColumn = { String nameOfColumn, String visible ->
                    hasColumn = false;
                    for (Element column : Dom4j.elements(columnsElem, "columns")) {
                        if (nameOfColumn.equals(column.attributeValue("id"))) {
                            hasColumn = true;
                            break;
                        }
                    }
                    if (!hasColumn) {
                        Element column = DocumentHelper.createElement("columns")
                        column.addAttribute("id", nameOfColumn)
                        column.addAttribute("visible", visible)
                        columnsElem.add(column)
                    }
                }
                def removeGroupProperty = { String nameOfProperty ->
                    for (Element property : Dom4j.elements(groupElem, "property")) {
                        if (nameOfProperty.equals(property.attributeValue("id"))) {
                            groupElem.remove(property);
                            break;
                        }
                    }
                }
                def updateGroupProperty = { String oldNameOfProperty, String newNameOfProperty ->
                    for (Element property : Dom4j.elements(groupElem, "property")) {
                        if (oldNameOfProperty.equals(property.attributeValue("id"))) {
                            property.attribute("id").setValue(newNameOfProperty);
                            break;
                        }
                    }
                }
                switch(presentation.getComponentId()) {
                    case listComponents.get(0):
                        regNo = false;
                        contractor = false;
                        for (Element column : Dom4j.elements(columnsElem, "columns")) {
                            if ("regNo".equals(column.attributeValue("id"))) {
                                columnsElem.remove(column);
                                removeGroupProperty("regNo");
                                if (sortElem != null && "regNo".equals(sortElem)) {
                                    columnsElem.attribute("sortProperty").setValue("");
                                    columnsElem.attribute("sortAscending").setValue("");
                                }
                                regNo = true;
                            } else if ("contractor.name".equals(column.attributeValue("id"))) {
                                column.attribute("id").setValue("contractor");
                                updateGroupProperty("contractor.name", "contractor");
                                if (sortElem != null && "contractor.name".equals(sortElem)) {
                                    columnsElem.attribute("sortProperty").setValue("contractor");
                                }
                                contractor = true;
                            }
                            if (regNo && contractor) {
                                break;
                            }
                        }
                        break;
                    case listComponents.get(1):
                        createColumn("theme", "false")
                        break;
                    case listComponents.get(2):
                    case listComponents.get(3):
                    case listComponents.get(4):
                        outcomeNo = false;
                        outcomeDate = false;
                        for (Element column : Dom4j.elements(columnsElem, "columns")) {
                            if ("outcomeNo".equals(column.attributeValue("id"))) {
                                columnsElem.remove(column);
                                removeGroupProperty("outcomeNo");
                                if (sortElem != null && "outcomeNo".equals(sortElem)) {
                                    columnsElem.attribute("sortProperty").setValue("");
                                    columnsElem.attribute("sortAscending").setValue("");
                                }
                                outcomeNo = true;
                            } else if ("outcomeDate".equals(column.attributeValue("id"))) {
                                columnsElem.remove(column);
                                removeGroupProperty("outcomeDate");
                                if (sortElem != null && "outcomeDate".equals(sortElem)) {
                                    columnsElem.attribute("sortProperty").setValue("");
                                    columnsElem.attribute("sortAscending").setValue("");
                                }
                                outcomeDate = true;
                            }
                            if (outcomeNo && outcomeDate) {
                                break;
                            }
                        }
                        break;
                    case listComponents.get(5):
                        createColumn("docOfficeData.responsePlanDate", "false")
                        break;
                    case listComponents.get(6):
                        presentation.setComponentId('[df$SimpleDoc.templateBrowse].cardsTable')
                        for (Element column : Dom4j.elements(columnsElem, "columns")) {
                            if ("resolution".equals(column.attributeValue("id"))) {
                                columnsElem.remove(column);
                                removeGroupProperty("resolution");
                                if (sortElem != null && "resolution".equals(sortElem)) {
                                    columnsElem.attribute("sortProperty").setValue("");
                                    columnsElem.attribute("sortAscending").setValue("");
                                }
                                break;
                            }
                        }
                        createColumn("theme", "false");
                        break;
                    case listComponents.get(7):
                        presentation.setComponentId('[df$Contract.templateBrowse].cardsTable')
                        for (Element column : Dom4j.elements(columnsElem, "columns")) {
                            if ("contractor.name".equals(column.attributeValue("id"))) {
                                column.attribute("id").setValue("contractor");
                                updateGroupProperty("contractor.name", "contractor");
                                if (sortElem != null && "contractor.name".equals(sortElem)) {
                                    columnsElem.attribute("sortProperty").setValue("contractor");
                                }
                                break;
                            }
                        }
                        break;
                }
                presentation.setXml(Dom4j.writeDocument(doc,false))
                em.merge(presentation)
            }
        }
        tx.commit();
    } finally {
        tx.end();
    }
})