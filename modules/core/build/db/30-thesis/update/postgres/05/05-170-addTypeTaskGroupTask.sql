-- $Id: 05-170-addTypeTaskGroupTask.sql 7707 2013-02-06 08:57:44Z zudin $
-- Description:

alter table TM_TASK_GROUP_TASK add column TYPE varchar(2);
update TM_TASK_GROUP_TASK set type = 'TG';
