-- $Id: 01-410-ScheduleTables.sql 23597 2016-03-03 09:28:49Z feoktistov $
-- Description: create tables for scheduler mechanism

create table TM_SCHEDULE_TASK (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    NAME varchar(100),
    DESCRIPTION varchar(1000),
    START_IF_FAILED boolean,
    primary key (ID)
);

---------------------------------------------------------------------------------------------------

create table TM_SCHEDULE_TRIGGER (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    TIME_UNITS_QTY numeric(3),
    DAYS_OF_WEEK varchar(16),
    MONTHS varchar(39),
    DAYS varchar(100),
    WEEK_NUMBERS varchar(10),
    ACTIVE boolean,
    NEXT_START_DATE timestamp,
    START_TIME time,
    TIME_UNIT varchar(1),
    TYPE varchar(2),
    SCHEDULE_TASK_ID uuid,
    primary key (ID)
);

alter table TM_SCHEDULE_TRIGGER add constraint FK_TM_SCHEDULE_TRIGGER_SCHEDULE_TASK foreign key (SCHEDULE_TASK_ID) references TM_SCHEDULE_TASK(ID);

---------------------------------------------------------------------------------------------------

create table TM_SCHEDULE_ACTION_TYPE (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    NAME varchar(100),
    SCREEN_ID varchar(100),
    ENTITY_NAME varchar(100),
    PROCESSOR_CLASS_NAME varchar(200),
    primary key (ID)
);

---------------------------------------------------------------------------------------------------

create table TM_SCHEDULE_ACTION (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    ACTION_NAME varchar(100),
    SCHEDULE_TASK_ID uuid,
    SCHEDULE_ACTION_TYPE_ID uuid,
    DISCRIMINATOR integer,
    primary key (ID)
);

alter table TM_SCHEDULE_ACTION add constraint FK_TM_SCHEDULE_ACTION_SCHEDULE_TASK foreign key (SCHEDULE_TASK_ID) references TM_SCHEDULE_TASK(ID);
alter table TM_SCHEDULE_ACTION add constraint FK_TM_SCHEDULE_ACTION_SCHEDULE_ACTION_TYPE foreign key (SCHEDULE_ACTION_TYPE_ID) references TM_SCHEDULE_ACTION_TYPE(ID);

---------------------------------------------------------------------------------------------------

create table TM_START_TASK_SCHEDULE_ACTION (
    SCHEDULE_ACTION_ID uuid,
    TASK_PATTERN_ID uuid,
    SCRIPT varchar(3000),
    NOTIFY_INITIATOR boolean,
    SCRIPT_ENABLED boolean,
    primary key (SCHEDULE_ACTION_ID)
);

alter table TM_START_TASK_SCHEDULE_ACTION add constraint FK_TM_START_TASK_SCHEDULE_ACTION_SCHEDULE_ACTION foreign key (SCHEDULE_ACTION_ID) references TM_SCHEDULE_ACTION(ID);
alter table TM_START_TASK_SCHEDULE_ACTION add constraint FK_TM_START_TASK_SCHEDULE_ACTION_TASK_PATTERN foreign key (TASK_PATTERN_ID) references TM_TASK_PATTERN(CARD_ID);

---------------------------------------------------------------------------------------------------

create table TM_SCHEDULE_ACTION_LOG (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    LOG_DATE timestamp,
    MESSAGE varchar(1000),
    SCHEDULE_ACTION_ID uuid,
    primary key (ID)
);

alter table TM_SCHEDULE_ACTION_LOG add constraint FK_TM_TM_SCHEDULE_ACTION_LOG_SCHEDULE_ACTION foreign key (SCHEDULE_ACTION_ID) references TM_SCHEDULE_ACTION(ID);

---------------------------------------------------------------------------------------------------

insert into SEC_ROLE (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role,is_super) VALUES ('5115e833-4146-4c98-a119-1c06053adb92',now(),'admin',1,now(),null,null,null,'schedule_task_creator','Создание периодических задач',null,null,null);

INSERT INTO SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,type,target,value,role_id) VALUES ('0c0110cf-75fc-4588-98ab-9b0ea7427f60',now(),'admin',1,now(),null,null,null,10,'tm$ScheduleTask.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,type,target,value,role_id) VALUES ('4b498d47-05ce-4bdc-a598-163799386316',now(),'admin',1,now(),null,null,null,10,'tm$ScheduleActionType.browse',1,'0c018061-b26f-4de2-a5be-dff348347f93');
INSERT INTO SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,type,target,value,role_id) VALUES ('8be19e1d-973d-4491-9df9-ed30ff785ba9',now(),'admin',1,now(),null,null,null,10,'tm$ScheduleActionType.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,type,target,value,role_id) VALUES ('8f402cc1-2540-47cb-9807-2fd56abedee5',now(),'admin',1,now(),null,null,null,10,'tm$ScheduleTask.browse',1,'5115e833-4146-4c98-a119-1c06053adb92');