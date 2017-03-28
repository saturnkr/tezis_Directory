-- $Id:
-- Description:

alter table TM_TASK_GROUP_TASK add column DURATION numeric(5,2);
alter table TM_TASK_GROUP_TASK add column TIME_UNIT varchar(1)^
