-- $Id: 01-250-addTypeToOrganizationAccount.sql 6923 2012-12-05 07:56:03Z shishov $
-- Description:

ALTER TABLE DF_ORGANIZATION_ACCOUNT ADD TYPE varchar(1)^
UPDATE DF_ORGANIZATION_ACCOUNT set TYPE='O'^