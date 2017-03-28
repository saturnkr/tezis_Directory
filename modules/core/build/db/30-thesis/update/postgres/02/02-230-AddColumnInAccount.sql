-- $Id: 02-230-AddColumnInAccount.sql 1774 2011-04-20 13:20:11Z novikov $
-- Description:

alter table DF_CONTRACTOR_ACCOUNT add column CORRESPONDENT_NO varchar(20)^
alter table DF_ORGANIZATION_ACCOUNT add column CORRESPONDENT_NO varchar(20)^