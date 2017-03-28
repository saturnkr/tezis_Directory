-- $Id: 02-190-AddRowExecutorAttachmentIntoAttachmentType.sql 1693 2011-04-01 10:15:39Z ternovsky $
-- Description:

insert into WF_ATTACHMENTTYPE (ID,CODE,ISDEFAULT)
values ('144feeb6-5ad8-11e0-a80d-cf59394498a5','AttachmentType.executorAttachment',false)^