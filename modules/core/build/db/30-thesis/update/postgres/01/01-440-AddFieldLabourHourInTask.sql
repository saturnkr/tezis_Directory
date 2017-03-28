-- $Id: 01-440-AddFieldLabourHourInTask.sql 781 2010-09-29 08:10:45Z novikov $
-- Description:
alter table TM_TASK add LABOUR_HOUR numeric(7,2);

update TM_TASK set LABOUR_HOUR = LABOUR_INTENSITY*8 where LABOUR_UNIT = 'D' and LABOUR_HOUR is null;
update TM_TASK set LABOUR_HOUR = LABOUR_INTENSITY/60 where LABOUR_UNIT = 'M' and LABOUR_HOUR is null;
update TM_TASK set LABOUR_HOUR = LABOUR_INTENSITY where LABOUR_UNIT = 'H' and LABOUR_HOUR is null;
update TM_TASK set LABOUR_HOUR = LABOUR_INTENSITY where LABOUR_UNIT is null and LABOUR_HOUR is null;