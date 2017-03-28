import com.haulmont.bali.util.Dom4j
import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.security.entity.UserSetting
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
 * @version $Id: 150326-1636-updateUserSettings.groovy 19690 2015-04-06 13:07:23Z kovalenko $
 */

postUpdate.add({
    Transaction tx = AppBeans.get(Persistence.class).createTransaction();
    EntityManager em = AppBeans.get(Persistence.class).getEntityManager();
    List listNames = new ArrayList();
    listNames.add('df$SimpleDoc.browse');
    listNames.add('tm$Task.browse');
    listNames.add('df$Contract.browse');
    listNames.add('df$DocOutcome.browse');
    listNames.add('df$SimpleDoc.templateBrowse');
    listNames.add('df$Contract.templateBrowse');
    listNames.add('df$DocIncome.browse');
    listNames.add('df$DocInternal.browse');
    listNames.add('df$Doc.browse');
    try {
        List<UserSetting> settings = em.createQuery("select s from sec\$UserSetting s where s.name in :listNames").setParameter("listNames", listNames).getResultList();
        if (CollectionUtils.isNotEmpty(settings)) {
            for (UserSetting setting : settings) {
                Document doc;
                if (!StringUtils.isEmpty(setting.getValue())) {
                    doc = Dom4j.readDocument(setting.getValue());
                    List<Element> components = doc.getRootElement().element("components").elements("component");
                    for (Element component : components) {
                        if (Arrays.asList("docsTable", "tasksTable").contains(component.attributeValue("name"))) {
                            component.attribute("name").setValue("cardsTable");
                        }
                        if ("cardsTable".equals(component.attributeValue("name"))) {
                            final Element columnsElem = component.element("columns");
                            final String sortElem = columnsElem.attributeValue("sortProperty");
                            final Element groupElem = component.element("groupProperties");
                            def createColumn = { String nameOfColumn, String visible ->
                                hasColumn = false;
                                for (Element column : Dom4j.elements(columnsElem, "columns")) {
                                    if (nameOfColumn.equals(column.attributeValue("id"))) {
                                        hasColumn = true;
                                        break;
                                    }
                                }
                                if (!hasColumn) {
                                    Element columnImportant = DocumentHelper.createElement("columns")
                                    columnImportant.addAttribute("id", nameOfColumn)
                                    columnImportant.addAttribute("visible", visible)
                                    columnsElem.add(columnImportant)
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
                            switch (setting.getName()) {
                                case listNames.get(0):
                                    createColumn("theme", "true");
                                    break;
                                case listNames.get(2):
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
                                            updateGroupProperty("contractor.name", "contractor")
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
                                case listNames.get(3):
                                case listNames.get(7):
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
                                    createColumn("important", "true");
                                    createColumn("hasAttributes", "true");
                                    break;
                                case listNames.get(4):
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
                                    createColumn("theme", "true");
                                    break;
                                case listNames.get(5):
                                    for (Element column : Dom4j.elements(columnsElem, "columns")) {
                                        if ("contractor.name".equals(column.attributeValue("id"))) {
                                            column.attribute("id").setValue("contractor");
                                            updateGroupProperty("contractor.name", "contractor")
                                            if (sortElem != null && "contractor.name".equals(sortElem)) {
                                                columnsElem.attribute("sortProperty").setValue("contractor");
                                            }
                                            break;
                                        }
                                    }
                                    break;
                                case listNames.get(6):
                                    createColumn("docOfficeData.responsePlanDate", "true");
                                    createColumn("important", "true");
                                    createColumn("hasAttributes", "true");
                                    break;
                                case listNames.get(8):
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
                                    createColumn("important", "true");
                                    createColumn("hasAttributes", "true");
                                    createColumn("project", "true");
                                    break;
                            }
                        }
                    }
                    setting.setValue(Dom4j.writeDocument(doc, false))
                    em.merge(setting)
                }
            }
        }
        tx.commit();
    } finally {
        tx.end();
    }
})

