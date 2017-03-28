-- $Id: 130920-1258-updateDocKind.sql 11922 2013-09-20 09:11:16Z gaponenkov $
-- Description:

update DF_DOC_KIND set fields_xml = '<?xml version="1.0" encoding="UTF-8"?>

                                    <fields>
                                    <field name="addressee" visible="false" required="false"/>
                                    <field name="responseToDoc" visible="false" required="false"/>
                                    <field name="docKind" visible="false" required="false"/>
                                    <field name="attachments" visible="false" required="false"/>
                                    <field name="dateTime" visible="false" required="false"/>
                                    <field name="date" visible="true" required="false"/>
                                    <field name="finishDatePlan" visible="false" required="false"/>
                                    <field name="createDate" visible="false" required="false"/>
                                    <field name="officeExecutor" visible="false" required="false"/>
                                    <field name="category" visible="true" required="false"/>
                                    <field name="comment" visible="true" required="false"/>
                                    <field name="officeContactPersonTo" visible="false" required="false"/>
                                    <field name="owner" visible="false" required="false"/>
                                    <field name="assignments" visible="false" required="false"/>
                                    <field name="number" visible="true" required="false"/>
                                    <field name="parentCard" visible="true" required="false"/>
                                    <field name="sender" visible="true" required="false"/>
                                    <field name="officeSignedBy" visible="false" required="false"/>
                                    <field name="department" visible="true" required="false"/>
                                    <field name="projects" visible="false" required="false"/>
                                    <field name="receivingMethod" visible="false" required="false"/>
                                    <field name="availableForAll" visible="false" required="false"/>
                                    <field name="theme" visible="true" required="false"/>
                                    <field name="orderCause" visible="false" required="false"/>
                                    <field name="orderText" visible="false" required="false"/>
                                    <field name="organization" visible="true" required="false"/>
                                    <field name="docSender" visible="false" required="false"/>
                                    <field name="docReceiver" visible="false" required="false"/>
                                    <field name="docCopyReceiver" visible="false" required="false"/>
                                    </fields>'
where category_id = '44f912b6-fe8e-11e2-a6b7-5bb93c75e36b';

update DF_DOC_KIND set fields_xml = '<?xml version="1.0" encoding="UTF-8"?>

                                    <fields>
                                    <field name="addressee" visible="false" required="false"/>
                                    <field name="responseToDoc" visible="false" required="false"/>
                                    <field name="docKind" visible="false" required="false"/>
                                    <field name="attachments" visible="false" required="false"/>
                                    <field name="dateTime" visible="false" required="false"/>
                                    <field name="date" visible="true" required="false"/>
                                    <field name="finishDatePlan" visible="false" required="false"/>
                                    <field name="createDate" visible="false" required="false"/>
                                    <field name="officeExecutor" visible="false" required="false"/>
                                    <field name="category" visible="true" required="false"/>
                                    <field name="comment" visible="true" required="false"/>
                                    <field name="officeContactPersonTo" visible="false" required="false"/>
                                    <field name="owner" visible="false" required="false"/>
                                    <field name="assignments" visible="false" required="false"/>
                                    <field name="number" visible="true" required="false"/>
                                    <field name="parentCard" visible="true" required="false"/>
                                    <field name="sender" visible="true" required="false"/>
                                    <field name="officeSignedBy" visible="false" required="false"/>
                                    <field name="department" visible="true" required="false"/>
                                    <field name="projects" visible="false" required="false"/>
                                    <field name="receivingMethod" visible="false" required="false"/>
                                    <field name="availableForAll" visible="false" required="false"/>
                                    <field name="theme" visible="true" required="false"/>
                                    <field name="orderCause" visible="false" required="false"/>
                                    <field name="orderText" visible="false" required="false"/>
                                    <field name="organization" visible="true" required="false"/>
                                    <field name="docSender" visible="false" required="false"/>
                                    <field name="docReceiver" visible="false" required="false"/>
                                    <field name="docCopyReceiver" visible="false" required="false"/>
                                    </fields>'
where category_id = '7f1b0314-fe8e-11e2-85d5-f7a577d85b9f';