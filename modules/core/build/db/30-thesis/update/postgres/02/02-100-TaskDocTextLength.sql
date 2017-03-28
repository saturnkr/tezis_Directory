-- $Id: 02-100-TaskDocTextLength.sql 1352 2011-01-13 09:40:12Z novikov $
-- Description:

alter table TM_TASK alter FULL_DESCR type text;
alter table DF_DOC alter COMMENT type text;
alter table DF_CONTRACT alter PAYMENT_CONDITIONS type text;