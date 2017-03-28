-- $Id$

alter table TM_TASK_GROUP_TASK alter column DESCR varchar(500);
alter table TM_TASK_GROUP_TASK alter column FULL_DESCR varchar(max);
