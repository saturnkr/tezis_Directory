--$Id: 131021-1243-alterCompanyFullNameColumnType.sql 12681 2013-10-21 11:14:25Z chekashkin $
--$Description: set FULL_NAME column length to 500

alter table DF_COMPANY alter column FULL_NAME type varchar(500)^