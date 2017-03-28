--$Id: 04-340-addConfirmRequiredToTaskPattern.sql 3954 2012-02-10 07:17:28Z shishov $

alter table TM_TASK_PATTERN add column CONFIRM_REQUIRED boolean^
alter table TM_TASK_VERSION add column CONFIRM_REQUIRED boolean^