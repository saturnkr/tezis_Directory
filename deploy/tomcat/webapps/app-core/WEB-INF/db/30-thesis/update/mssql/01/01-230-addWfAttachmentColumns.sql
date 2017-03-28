-- $Id$
-- Description:
ALTER TABLE WF_ATTACHMENT add ORGANIZATION_ID uniqueidentifier^
ALTER TABLE WF_ATTACHMENT add CORRESPONDENT_ID uniqueidentifier^

ALTER TABLE DF_ORGANIZATION add HAS_ATTACHMENTS tinyint^
update df_organization SET has_attachments = 0 where has_attachments is null^