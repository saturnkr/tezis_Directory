--$Id: 130320-1316-addStartTaskType.sql 9304 2013-04-22 10:18:03Z tsarevskiy $
--$Description:

alter table TM_TASK add START_TASK_TYPE integer^
update TM_TASK set START_TASK_TYPE = 0^

alter table TM_TASK_PATTERN add START_TASK_TYPE integer^
update TM_TASK_PATTERN set START_TASK_TYPE = 0^

alter table TM_TASK_VERSION add START_TASK_TYPE integer^
update TM_TASK_VERSION set START_TASK_TYPE = 0;

