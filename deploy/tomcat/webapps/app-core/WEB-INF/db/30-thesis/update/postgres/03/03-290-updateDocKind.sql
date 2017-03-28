-- $Id: 03-290-updateDocKind.sql 2856 2011-10-11 05:46:58Z zudin $
-- Description:

update DF_DOC_KIND set fields_xml =
'<?xml version="1.0" encoding="UTF-8"?>
<fields>
<field name="addressee" visible="true" required="false"/>
<field name="active" visible="true" required="false"/>
<field name="responseToDoc" visible="true" required="false"/>
<field name="docKind" visible="true" required="false"/>
<field name="attachments" visible="true" required="false"/>
<field name="dateTime" visible="true" required="false"/>
<field name="date" visible="true" required="false"/>
<field name="finishDatePlan" visible="true" required="false"/>
<field name="createDate" visible="true" required="false"/>
<field name="officeExecutor" visible="true" required="false"/>
<field name="category" visible="true" required="false"/>
<field name="currency" visible="true" required="false"/>
<field name="comment" visible="true" required="false"/>
<field name="officeContactPersonTo" visible="true" required="false"/>
<field name="contactPerson" visible="true" required="false"/>
<field name="contractor" visible="true" required="false"/>
<field name="owner" visible="true" required="false"/>
<field name="vatInclusive" visible="true" required="false"/>
<field name="assignments" visible="true" required="false"/>
<field name="liabilityStart" visible="true" required="false"/>
<field name="organization" visible="true" required="false"/>
<field name="number" visible="true" required="false"/>
<field name="liabilityEnd" visible="true" required="false"/>
<field name="parentCard" visible="true" required="false"/>
<field name="sender" visible="true" required="false"/>
<field name="officeSignedBy" visible="true" required="false"/>
<field name="department" visible="true" required="false"/>
<field name="projects" visible="true" required="false"/>
<field name="receivingMethod" visible="true" required="false"/>
<field name="vatRate" visible="true" required="false"/>
<field name="amount" visible="true" required="false"/>
<field name="vatAmount" visible="true" required="false"/>
<field name="paymentConditions" visible="true" required="false"/>
</fields>'
where category_id  = '9cd678e3-7978-4f53-a503-a36bce3a76d6'

