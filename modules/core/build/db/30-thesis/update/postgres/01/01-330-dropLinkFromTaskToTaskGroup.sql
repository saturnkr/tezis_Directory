-- $Id: 01-330-dropLinkFromTaskToTaskGroup.sql 542 2010-08-05 11:22:52Z gorbunkov $
-- Description: remove unnecessary references from task to taskGroup

alter table TM_TASK drop constraint FK_TM_TASK_TASK_GROUP;
alter table TM_TASK drop TASK_GROUP_ID;

alter table TM_TASK_PATTERN drop constraint FK_TM_TASK_PATTERN_TASK_GROUP;
alter table TM_TASK_PATTERN drop TASK_GROUP_ID;

alter table TM_TASK_VERSION drop constraint FK_TM_TASK_VERSION_TASK_GROUP;
alter table TM_TASK_VERSION drop TASK_GROUP_ID;