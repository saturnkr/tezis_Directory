-- $Id: 02-081-changeTaskNameLength.sql 1562 2011-03-10 11:49:23Z pavlov $
-- Description:

alter table TM_TASK alter column TASK_NAME type varchar(500);

alter table TM_TASK_PATTERN alter column TASK_NAME type varchar(500);