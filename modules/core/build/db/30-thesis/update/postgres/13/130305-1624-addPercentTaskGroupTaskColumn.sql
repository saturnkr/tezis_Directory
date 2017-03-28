--$Id: 130305-1624-addPercentTaskGroupTaskColumn.sql 8581 2013-03-21 14:11:36Z stekolschikov $
--$Description:

alter table TM_TASK_GROUP_TASK add PERCENT_COMPLETION numeric(3)^
alter table TM_TASK_GROUP_TASK add CREATE_DATETIME timestamp^