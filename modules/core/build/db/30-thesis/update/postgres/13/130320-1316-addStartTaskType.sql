--$Id: 130320-1316-addStartTaskType.sql 8566 2013-03-21 09:34:05Z tsarevskiy $
--$Description:

alter table TM_TASK add START_TASK_TYPE integer;
update TM_TASK set START_TASK_TYPE = 0;

alter table TM_TASK_PATTERN add START_TASK_TYPE integer;
update TM_TASK_PATTERN set START_TASK_TYPE = 0;

alter table TM_TASK_VERSION add START_TASK_TYPE integer;
update TM_TASK_VERSION set START_TASK_TYPE = 0;

