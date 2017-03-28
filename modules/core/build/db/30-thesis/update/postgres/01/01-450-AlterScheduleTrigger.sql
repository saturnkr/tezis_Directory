-- $Id: 01-450-AlterScheduleTrigger.sql 775 2010-09-28 08:21:13Z gorbunkov $
-- Description:

alter table TM_SCHEDULE_TRIGGER drop column START_TIME;
alter table TM_SCHEDULE_TRIGGER add START_DATE timestamp;