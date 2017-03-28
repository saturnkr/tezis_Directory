-- $Id: 150912-1414-updateFieldsXmlForMeetingDocKind.sql 21666 2015-09-12 10:16:51Z timokhov $
-- Description:
update DF_DOC_KIND set fields_xml = ('<?xml version="1.0" encoding="UTF-8"?>

                                           <fields>
                                             <field name="responseToDoc" visible="true" required="false" signed="false"/>
                                             <field name="dateTime" visible="true" required="true" signed="false"/>
                                             <field name="duration" visible="true" required="false" signed="false"/>
                                             <field name="availableForAll" visible="false" required="false" signed="false"/>
                                             <field name="initiator" visible="true" required="true" signed="false"/>
                                             <field name="officeExecutor" visible="true" required="false" signed="false"/>
                                             <field name="employeeExecutor" visible="true" required="false" signed="false"/>
                                             <field name="docCategory" visible="true" required="false" signed="false"/>
                                             <field name="owner" visible="true" required="false" signed="false"/>
                                             <field name="place" visible="true" required="false" signed="false"/>
                                             <field name="name" visible="true" required="true" signed="false"/>
                                             <field name="number" visible="true" required="false" signed="false"/>
                                             <field name="organization" visible="true" required="false" signed="false"/>
                                             <field name="parentCard" visible="true" required="false" signed="false"/>
                                             <field name="sender" visible="true" required="false" signed="false"/>
                                             <field name="meetingQuestions" visible="true" required="false" signed="false"/>
                                             <field name="officeSignedBy" visible="true" required="false" signed="false"/>
                                             <field name="department" visible="true" required="false" signed="false"/>
                                             <field name="postTrackingNumber" visible="true" required="false" signed="false"/>
                                             <field name="chairman" visible="true" required="true" signed="false"/>
                                             <field name="projects" visible="false" required="false" signed="false"/>
                                             <field name="resolution" visible="true" required="false" signed="false"/>
                                             <field name="solutions" visible="true" required="false" signed="false"/>
                                             <field name="secretary" visible="true" required="true" signed="false"/>
                                             <field name="comment" visible="true" required="false" signed="false"/>
                                             <field name="receivingMethod" visible="true" required="false" signed="false"/>
                                             <field name="finishDatePlan" visible="true" required="false" signed="false"/>
                                             <field name="theme" visible="true" required="true" signed="false"/>
                                             <field name="members" visible="true" required="false" signed="false"/>
                                             <field name="target" visible="true" required="false" signed="false"/>
                                             <field name="parentCardAccess" visible="false" required="false" signed="false"/>
                                           </fields>'
                                           )
where category_id = '9415792f-c473-cbeb-d150-8ae687c4dcd2';

