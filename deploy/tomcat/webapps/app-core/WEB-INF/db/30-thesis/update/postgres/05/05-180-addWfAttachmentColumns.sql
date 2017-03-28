-- $Id$
-- Description:
ALTER TABLE WF_ATTACHMENT add ORGANIZATION_ID uuid^
ALTER TABLE WF_ATTACHMENT add CORRESPONDENT_ID uuid^

alter table WF_ATTACHMENT add constraint FK_WF_ATTACHMENT_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
alter table WF_ATTACHMENT add constraint FK_WF_ATTACHMENT_CORRESPONDENT foreign key (CORRESPONDENT_ID) references DF_CORRESPONDENT (ID)^

ALTER TABLE DF_ORGANIZATION add HAS_ATTACHMENTS boolean^
ALTER TABLE DF_EMPLOYEE add HAS_ATTACHMENTS boolean^

update DF_EMPLOYEE SET has_attachments = false where has_attachments is null^
update df_organization SET has_attachments = false where has_attachments is null^