-- $Id: 01-270-addFieldsInTaskGroup.sql
-- Description: add fields: dataMeet, number, thema, goal, participants, chairman, secretary
alter table TM_TASK_GROUP add DATE_MEET date;
alter table TM_TASK_GROUP add NUMBER varchar(50);
alter table TM_TASK_GROUP add THEME varchar(100);
alter table TM_TASK_GROUP add GOAL varchar(100);
alter table TM_TASK_GROUP add CHAIRMAN_ID uuid;
alter table TM_TASK_GROUP add SECRETARY_ID uuid;

alter table TM_TASK_GROUP add constraint FK_TM_TASK_GROUP_CHAIRMAN foreign key (CHAIRMAN_ID) references SEC_USER(ID);
alter table TM_TASK_GROUP add constraint FK_TM_TASK_GROUP_SECRETARY foreign key (SECRETARY_ID) references SEC_USER(ID);

create table TM_TASK_GROUP_USER (
    USER_ID uuid,
    TASK_GROUP_ID uuid
);

alter table TM_TASK_GROUP_USER add constraint TM_TASK_GROUP_USER_PROFILE foreign key (TASK_GROUP_ID) references TM_TASK_GROUP(ID);
alter table TM_TASK_GROUP_USER add constraint TM_TASK_GROUP_USER_USER foreign key (USER_ID) references SEC_USER(ID);

create table TM_TASK_GROUP_TASK (
    ID uuid not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    FINISH_DATE date,
    DESCR varchar(255),
    TASK_ID uuid,
    TASK_GROUP_ID uuid,
    primary key (ID)
);

alter table TM_TASK_GROUP_TASK add constraint TM_TASK_GROUP_TASK_PROFILE foreign key (TASK_GROUP_ID) references TM_TASK_GROUP(ID);
alter table TM_TASK_GROUP_TASK add constraint TM_TASK_GROUP_TASK_TASK foreign key (TASK_ID) references TM_TASK(CARD_ID);
create unique index IDX_TM_TASK_GROUP_TASK_UNIQ_TASK on TM_TASK_GROUP_TASK (TASK_GROUP_ID, TASK_ID) where DELETE_TS is null;

create table TM_TASK_GROUP_TASK_USER (
    USER_ID uuid,
    TASK_GROUP_TASK_ID uuid
);

alter table TM_TASK_GROUP_TASK_USER add constraint TM_TASK_GROUP_TASK_USER_PROFILE foreign key (TASK_GROUP_TASK_ID) references TM_TASK_GROUP_TASK(ID);
alter table TM_TASK_GROUP_TASK_USER add constraint TM_TASK_GROUP_TASK_USER_USER foreign key (USER_ID) references SEC_USER(ID);

