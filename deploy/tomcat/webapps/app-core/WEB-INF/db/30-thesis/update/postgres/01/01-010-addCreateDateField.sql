-- $Id: 01-010-addCreateDateField.sql 85 2010-04-08 11:43:55Z krivopustov $
-- Description: add

-- TM_TASK

alter table TM_TASK add CREATE_DATETIME timestamp;

update TM_TASK set CREATE_DATETIME = CREATE_DATE;

alter table TM_TASK drop CREATE_DATE;

alter table TM_TASK add CREATE_DATE date;

update TM_TASK set CREATE_DATE = CREATE_DATETIME;

-- TM_TASK_PATTERN

alter table TM_TASK_PATTERN add CREATE_DATETIME timestamp;

update TM_TASK_PATTERN set CREATE_DATETIME = CREATE_DATE;

alter table TM_TASK_PATTERN drop CREATE_DATE;

alter table TM_TASK_PATTERN add CREATE_DATE date;

update TM_TASK_PATTERN set CREATE_DATE = CREATE_DATETIME;

-- TM_TASK_VERSION

alter table TM_TASK_VERSION add CREATE_DATETIME timestamp;

update TM_TASK_VERSION set CREATE_DATETIME = CREATE_DATE;

alter table TM_TASK_VERSION drop CREATE_DATE;

alter table TM_TASK_VERSION add CREATE_DATE date;

update TM_TASK_VERSION set CREATE_DATE = CREATE_DATETIME;

