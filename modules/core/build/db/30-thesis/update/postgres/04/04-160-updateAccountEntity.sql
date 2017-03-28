-- $Id: 04-160-updateAccountEntity.sql 3199 2011-11-14 14:49:51Z chernov $
-- Description:

alter table DF_CONTRACTOR_ACCOUNT add column APPOINTMENT varchar(500);

alter table DF_ORGANIZATION_ACCOUNT add column APPOINTMENT varchar(500);
