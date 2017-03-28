-- $Id$
-- Description:

ALTER TABLE DF_EMPLOYEE add HAS_ATTACHMENTS tinyint^
update DF_EMPLOYEE SET has_attachments = 0 where has_attachments is null^
update df_organization SET has_attachments = 0 where has_attachments is null^