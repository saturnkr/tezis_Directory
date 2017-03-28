-- $Id: 03-110-setBooleanFieldInTaskPatternAndTaskGroup.sql 4121 2012-03-01 11:09:08Z pavlov $
update TM_TASK_PATTERN set GLOBAL = 'false' where GLOBAL is null^
update TM_TASK_GROUP set GLOBAL = 'false' where GLOBAL is null^