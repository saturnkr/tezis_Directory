--$Id: 131127-1830-addTaskGroupTypeColumn.sql 13533 2013-11-28 12:04:59Z chekashkin $
--$Description: add column for task group type and updates it

alter table TM_TASK_GROUP add column TASK_GROUP_TYPE varchar(50);
update TM_TASK_GROUP set TASK_GROUP_TYPE = 'Protocol' where date_meet is not null;
update TM_TASK_GROUP set TASK_GROUP_TYPE = 'TaskGroup' where date_meet is null^
