alter table TM_TASK_GROUP_TASK add FULL_DESCR varchar(255);
alter table TM_TASK_GROUP_TASK add TASK_TYPE_ID uuid;
alter table TM_TASK_GROUP_TASK add PRIORITY_ID uuid;
alter table TM_TASK_GROUP_TASK add CONTROLLER_ID uuid;
alter table TM_TASK_GROUP_TASK add PROJECT_ID uuid;