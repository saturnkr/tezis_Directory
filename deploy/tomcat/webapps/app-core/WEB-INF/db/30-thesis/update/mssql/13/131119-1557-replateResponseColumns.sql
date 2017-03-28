-- $Id: 131119-1557-replateResponseColumns.sql 13354 2013-11-20 11:42:12Z zudin $
-- Description:

alter table DF_DOC drop column RESPOND_TO;
alter table DF_DOC drop column RESPOND_REGISTRATION_DATE;

alter table DF_DOC_OFFICE_DATA add RESPONSE_PLAN_DATE datetime;
alter table DF_DOC_OFFICE_DATA add RESPONSE_DATE datetime;
