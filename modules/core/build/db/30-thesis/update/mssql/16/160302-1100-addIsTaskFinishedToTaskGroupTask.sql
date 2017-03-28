-- $Id: 160302-1100-addIsTaskFinishedToTaskGroupTask.sql 23574 2016-03-02 09:57:50Z gaslov $

alter table TM_TASK_GROUP_TASK add HAS_TASK tinyint;
alter table TM_TASK_GROUP_TASK add IS_TASK_FINISHED tinyint;