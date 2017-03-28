-- $Id: 01-250-AddLabourUnitInTask.sql 397 2010-07-23 15:56:55Z novikov $
-- Description:

alter table TM_TASK add LABOUR_UNIT varchar(1);
alter table TM_TASK_PATTERN add LABOUR_UNIT varchar(1);
alter table TM_TASK_VERSION add LABOUR_UNIT varchar(1);