-- $Id: 01-040-addNotifiedField.sql 85 2010-04-08 11:43:55Z krivopustov $
-- Description: add notified field in tm_task

alter table TM_TASK add notified boolean;