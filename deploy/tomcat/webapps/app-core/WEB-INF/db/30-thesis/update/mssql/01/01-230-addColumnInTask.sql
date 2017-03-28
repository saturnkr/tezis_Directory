--$Id: 01-230-addColumnInTask.sql 5899 2012-08-31 09:39:02Z kozyaikin $
--Description:
alter table TM_TASK add SCHEDULE_TASK_ID uniqueidentifier;
alter table TM_TASK add constraint FK_TM_TASK_SCHEDULE_TASK_ID foreign key (SCHEDULE_TASK_ID) references TM_SCHEDULE_TASK(ID)^