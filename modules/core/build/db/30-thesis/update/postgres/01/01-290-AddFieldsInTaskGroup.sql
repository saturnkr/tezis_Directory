-- $Id: 01-290-AddFieldsInTaskGroup.sql 397 2010-07-27 15:56:55Z novikov $
-- Description:

alter table TM_TASK_GROUP add INITIATOR_ID uuid;
alter table TM_TASK_GROUP add constraint FK_TM_TASK_GROUP_INITIATOR foreign key (INITIATOR_ID) references SEC_USER(ID);
alter table WF_ATTACHMENT add TASK_GROUP_ID uuid;
alter table WF_ATTACHMENT add constraint FK_WF_ATTACHMENT_TASK_GROUP foreign key (TASK_GROUP_ID) references TM_TASK_GROUP (ID);