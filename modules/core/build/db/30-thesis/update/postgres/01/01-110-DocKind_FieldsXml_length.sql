-- $Id: 01-110-DocKind_FieldsXml_length.sql 131 2010-04-29 11:33:18Z gorbunkov $
-- Description: change DF_DOC_KIND's FIELDS_XML field length

alter table DF_DOC_KIND alter column FIELDS_XML type varchar(3000);