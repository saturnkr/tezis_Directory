-- $Id: 05-080-increaseFullNameForCompanies.sql 5296 2012-06-22 14:54:45Z kozyaikin $
-- Description:
alter table DF_COMPANY
   alter column FULL_NAME type character varying(400)^