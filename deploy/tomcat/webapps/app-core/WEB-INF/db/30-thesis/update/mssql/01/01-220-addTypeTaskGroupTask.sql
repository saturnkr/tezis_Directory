-- $Id: 01-220-addTypeTaskGroupTask.sql 7707 2013-02-06 08:57:44Z zudin $
-- Description:

ALTER TABLE TM_TASK_GROUP_TASK ADD TYPE varchar(2)^
UPDATE TM_TASK_GROUP_TASK set TYPE='TG'^