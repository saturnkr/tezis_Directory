--$Id: 130611-1600-changesSetIdType.sql 10273 2013-06-11 12:19:49Z pavlov $
--Description:

alter table DF_APP_INTEGRATION_LOG alter column CHANGES_SET_ID type varchar(100);