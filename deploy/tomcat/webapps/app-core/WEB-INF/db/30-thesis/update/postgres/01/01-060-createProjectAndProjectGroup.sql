-- $Id: 01-060-createProjectAndProjectGroup.sql 85 2010-04-08 11:43:55Z krivopustov $
-- Description: create ProjectGroup and Project table and reference on Project from Task and TaskPattern

create table TM_PROJECT_GROUP (
    ID uuid,
    NAME varchar(50),
    PARENT_PROJECT_GROUP_ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    primary key (ID)
);

alter table TM_PROJECT_GROUP add constraint FK_TM_PROJECT_GROUP_PROJECT_GROUP foreign key (PARENT_PROJECT_GROUP_ID) references TM_PROJECT_GROUP(ID);

create table TM_PROJECT (
    ID uuid,
    NAME varchar(50),
    PROJECT_GROUP_ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    primary key (ID)
);

alter table TM_PROJECT add constraint FK_TM_PROJECT_PROJECT_GROUP foreign key (PROJECT_GROUP_ID) references TM_PROJECT_GROUP(ID);

alter table TM_TASK add column PROJECT_ID uuid;
alter table TM_TASK add constraint FK_TM_TASK_PROJECT foreign key (PROJECT_ID) references TM_PROJECT(ID);

alter table TM_TASK_PATTERN add column PROJECT_ID uuid;
alter table TM_TASK_PATTERN add constraint FK_TM_TASK_PATTERN_PROJECT foreign key (PROJECT_ID) references TM_PROJECT(ID);

alter table TM_TASK_VERSION add column PROJECT_ID uuid;
alter table TM_TASK_VERSION add constraint FK_TM_TASK_VERSION_PROJECT foreign key (PROJECT_ID) references TM_PROJECT(ID);