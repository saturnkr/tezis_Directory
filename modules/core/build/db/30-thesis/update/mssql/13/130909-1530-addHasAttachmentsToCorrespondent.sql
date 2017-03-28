--$Id: 130909-1530-addHasAttachmentsToCorrespondent.sql 12290 2013-10-04 11:46:42Z saiyan $
--$Description: moves HAS_ATTACHMENT attribute back to correspondent entity

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'DF_CORRESPONDENT'
and COLUMN_NAME = 'HAS_ATTACHMENTS')
BEGIN
alter table DF_CORRESPONDENT add HAS_ATTACHMENTS tinyint;
END^

