-- $Id: 01-240-addNotificationDatesToTask.sql 394 2010-06-23 10:46:15Z gorbunkov $
-- Description:

alter table TM_TASK drop notified;
alter table TM_TASK add OVERDUE_NOTIFIED varchar(1);