-- $Id: 05-200-addSecretaryFieldIntoOrganization.sql 6137 2012-10-08 13:01:59Z Novikov $
-- Description:
alter table DF_ORGANIZATION add SECRETARY_ID uuid^
alter table DF_ORGANIZATION add constraint FK_DF_ORGANIZATION_SECRETARY foreign key (SECRETARY_ID) references SEC_USER(ID)^