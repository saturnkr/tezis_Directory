--$Id: 130510-1500-addTaskTypeTabName.sql 9563 2013-05-11 07:46:01Z saiyan $
--$Description : adds field Tab name to store user setting of additional fields tab name

alter table TM_TASK_TYPE add column TAB_NAME varchar(30);

update TM_TASK_TYPE set TAB_NAME = 'Доп. поля';