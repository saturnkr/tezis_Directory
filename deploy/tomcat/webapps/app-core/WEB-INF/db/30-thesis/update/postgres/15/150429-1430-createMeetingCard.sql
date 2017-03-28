-- $Id: 150429-1430-createMeetingCard.sql 20170 2015-05-22 14:35:38Z kozyaikin $
-- Description:
create table DF_MEETING_DOC (
    CARD_ID uuid,
    --
    TARGET varchar(500),
    PLACE varchar(500),
    CHAIRMAN_ID uuid,
    SECRETARY_ID uuid,
    INITIATOR_ID uuid,
    DATE_START timestamp,
    DURATION integer,
    STATUS integer,
    TIME_UNIT varchar(1),
    --
    primary key (CARD_ID)
);

alter table DF_MEETING_DOC add constraint FK_DF_MEETING_DOC_CHAIRMAN_ID foreign key (CHAIRMAN_ID) references SEC_USER(ID);
alter table DF_MEETING_DOC add constraint FK_DF_MEETING_DOC_SECRETARY_ID foreign key (SECRETARY_ID) references SEC_USER(ID);
alter table DF_MEETING_DOC add constraint FK_DF_MEETING_DOC_INITIATOR_ID foreign key (INITIATOR_ID) references SEC_USER(ID);
alter table DF_MEETING_DOC add constraint FK_DF_MEETING_DOC_CARD_ID foreign key (CARD_ID) references DF_DOC(CARD_ID);
create index IDX_DF_MEETING_DOC_SECRETARY on DF_MEETING_DOC (SECRETARY_ID);
create index IDX_DF_MEETING_DOC_CHAIRMAN on DF_MEETING_DOC (CHAIRMAN_ID);
create index IDX_DF_MEETING_DOC_INITIATOR on DF_MEETING_DOC (INITIATOR_ID)^

---------------------------------------------------------------------------------------------------

create table DF_MEETING_QUESTION (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    NUMBER_ integer,
    QUESTION varchar(500),
    SPEAKER_ID uuid,
    DURATION integer,
    COMMENT_ varchar(1000),
    MEETING_DOC_ID uuid,
    TIME_UNIT varchar(1),
    --
    primary key (ID)
);

alter table DF_MEETING_QUESTION add constraint FK_DF_MEETING_QUESTION_SPEAKER_ID foreign key (SPEAKER_ID) references SEC_USER(ID);
alter table DF_MEETING_QUESTION add constraint FK_DF_MEETING_QUESTION_MEETING_DOC_ID foreign key (MEETING_DOC_ID) references DF_MEETING_DOC(CARD_ID);
create index IDX_DF_MEETING_QUESTION_MEETING_DOC on DF_MEETING_QUESTION (MEETING_DOC_ID);
create index IDX_DF_MEETING_QUESTION_SPEAKER on DF_MEETING_QUESTION (SPEAKER_ID)^

---------------------------------------------------------------------------------------------------

create table DF_SOLUTION (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    SOLUTION varchar(1000),
    QUESTION_ID uuid,
    EXECUTOR_ID uuid,
    INITIATOR_ID uuid,
    CONTROLLER_ID uuid,
    OBSERVER_ID uuid,
    TASK_ID uuid,
    MEETING_DOC_ID uuid,
    FINISH_DATE_PLAN timestamp,
    COMMENT_ varchar(1000),
    TASK_TYPE_ID uuid,
    PRIORITY_ID uuid,
    PROJECT_ID uuid,
    --
    primary key (ID)
);

alter table DF_SOLUTION add constraint FK_DF_SOLUTION_QUESTION_ID foreign key (QUESTION_ID) references DF_MEETING_QUESTION(ID);
alter table DF_SOLUTION add constraint FK_DF_SOLUTION_EXECUTOR_ID foreign key (EXECUTOR_ID) references SEC_USER(ID);
alter table DF_SOLUTION add constraint FK_DF_SOLUTION_INITIATOR_ID foreign key (INITIATOR_ID) references SEC_USER(ID);
alter table DF_SOLUTION add constraint FK_DF_SOLUTION_CONTROLLER_ID foreign key (CONTROLLER_ID) references SEC_USER(ID);
alter table DF_SOLUTION add constraint FK_DF_SOLUTION_OBSERVER_ID foreign key (OBSERVER_ID) references SEC_USER(ID);
alter table DF_SOLUTION add constraint FK_DF_SOLUTION_TASK_ID foreign key (TASK_ID) references TM_TASK(CARD_ID);
alter table DF_SOLUTION add constraint FK_DF_SOLUTION_MEETING_DOC_ID foreign key (MEETING_DOC_ID) references DF_MEETING_DOC(CARD_ID);
create index IDX_DF_SOLUTION_MEETING_DOC on DF_SOLUTION (MEETING_DOC_ID);
create index IDX_DF_SOLUTION_CONTROLLER on DF_SOLUTION (CONTROLLER_ID);
create index IDX_DF_SOLUTION_OBSERVER on DF_SOLUTION (OBSERVER_ID);
create index IDX_DF_SOLUTION_TASK on DF_SOLUTION (TASK_ID);
create index IDX_DF_SOLUTION_EXECUTOR on DF_SOLUTION (EXECUTOR_ID);
create index IDX_DF_SOLUTION_QUESTION on DF_SOLUTION (QUESTION_ID);
create index IDX_DF_SOLUTION_INITIATOR on DF_SOLUTION (INITIATOR_ID)^

---------------------------------------------------------------------------------------------------

create table DF_MEETING_PARTICIPANT (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    USER_ID uuid,
    OUTER_ varchar(255),
    EMAIL varchar(255),
    CONTACT_PERSON_ID uuid,
    MEETING_DOC_ID uuid,
    CONTRACTOR_ID uuid,
    --
    primary key (ID)
);

alter table DF_MEETING_PARTICIPANT add constraint FK_DF_MEETING_PARTICIPANT_USER_ID foreign key (USER_ID) references SEC_USER(ID);
alter table DF_MEETING_PARTICIPANT add constraint FK_DF_MEETING_PARTICIPANT_CONTACT_PERSON_ID foreign key (CONTACT_PERSON_ID) references DF_CONTACT_PERSON(ID);
alter table DF_MEETING_PARTICIPANT add constraint FK_DF_MEETING_PARTICIPANT_DOC_ID foreign key (MEETING_DOC_ID) references DF_MEETING_DOC(CARD_ID);
alter table DF_MEETING_PARTICIPANT add constraint FK_DF_MEETING_PARTICIPANT_CONTRACTOR_ID foreign key (CONTRACTOR_ID) references DF_CONTRACTOR(CORRESPONDENT_ID);
create index IDX_DF_MEETING_PARTICIPANT_MEETING_DOC on DF_MEETING_PARTICIPANT (MEETING_DOC_ID);
create index IDX_DF_MEETING_PARTICIPANT_CONTACTOR on DF_MEETING_PARTICIPANT (CONTACT_PERSON_ID);
create index IDX_DF_MEETING_PARTICIPANT_USER on DF_MEETING_PARTICIPANT (USER_ID)^
create index IDX_DF_MEETING_PARTICIPANT_CONTRACTOR on DF_MEETING_PARTICIPANT (CONTRACTOR_ID)^

---------------------------------------------------------------------------------------------------