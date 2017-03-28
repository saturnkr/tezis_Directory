-- $Id
-- Description: change DF_DOC_KIND's FIELDS_XML field length

alter table DF_DOC_KIND alter column FIELDS_XML type varchar(7000);