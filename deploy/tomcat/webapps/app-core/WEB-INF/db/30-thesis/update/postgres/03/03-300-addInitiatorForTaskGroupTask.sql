-- $Id: 03-300-addInitiatorForTaskGroupTask.sql 2857 2011-10-11 06:02:23Z zudin $
-- Description:

alter table TM_TASK_GROUP_TASK add column INITIATOR_ID UUID^
alter table TM_TASK_GROUP_TASK add constraint FK_DF_INITIATOR_USER foreign key (INITIATOR_ID) references SEC_USER(ID)^
