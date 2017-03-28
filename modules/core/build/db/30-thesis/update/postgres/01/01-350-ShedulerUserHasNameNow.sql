-- $Id: 01-350-ShedulerUserHasNameNow.sql 572 2010-08-11 06:59:51Z gorbunkov $
-- Description:

update SEC_USER set NAME = 'Системный пользователь' where LOGIN='SchedulerUser'