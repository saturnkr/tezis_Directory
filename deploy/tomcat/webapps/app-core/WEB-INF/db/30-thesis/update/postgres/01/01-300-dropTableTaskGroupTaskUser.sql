-- $Id: 01-300-dropTableTaskGroupTaskUser.sql 397 2010-07-27 15:56:55Z novikov $
-- Description:

alter table TM_TASK_GROUP_TASK_USER drop constraint TM_TASK_GROUP_TASK_USER_PROFILE;
alter table TM_TASK_GROUP_TASK_USER drop constraint TM_TASK_GROUP_TASK_USER_USER;
drop table TM_TASK_GROUP_TASK_USER;
alter table TM_TASK_GROUP_TASK add USER_ID uuid;
alter table TM_TASK_GROUP_TASK add constraint TM_TASK_GROUP_TASK_USER foreign key (USER_ID) references SEC_USER(ID);