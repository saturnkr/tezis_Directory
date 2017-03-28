------------------------------------------------------------------------------------------------------------
alter table SEC_USER_SUBSTITUTION add NOTIFY_BY_CARD_INFO boolean^
alter table SEC_USER_SUBSTITUTION add NOTIFY_BY_EMAIL boolean^

------------------------------------------------------------------------------------------------------------
create table TM_TASK_TYPE (
    CATEGORY_ID uuid,
    CATEGORY_ATTRS_PLACE integer,
    CODE varchar(50),
    DESCRIPTION varchar(200),
    FIELDS_XML varchar(7000),
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    TAB_NAME varchar(30),
    primary key (CATEGORY_ID)
)^

alter table TM_TASK_TYPE add constraint TM_TASK_TYPE_CATEGORY_ID foreign key (CATEGORY_ID) references SYS_CATEGORY(ID)^

------------------------------------------------------------------------------------------------------------
create table TM_TASK_GROUP (
    ID uuid,
    NAME varchar,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    VERSION integer,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    DATE_MEET date,
    NUMBER varchar(50),
    THEME varchar(100),
    GOAL varchar(100),
    TEXT_PARTICIPANTS varchar(10000),
    PARENT_CARD_ID uuid,
    TASK_GROUP_TYPE varchar(50),
    CHAIRMAN_ID uuid,
    SECRETARY_ID uuid,
    INITIATOR_ID uuid,
    SUBSTITUTED_CREATOR_ID uuid,
    IS_TEMPLATE boolean,
    TEMPLATE_NAME varchar(200),
    DISCUSSED varchar(400),
    ORGANIZATION_ID uuid,
    GLOBAL boolean,
    primary key (ID)
)^

alter table TM_TASK_GROUP add constraint FK_TM_TASK_GROUP_CHAIRMAN foreign key (CHAIRMAN_ID) references SEC_USER(ID)^
alter table TM_TASK_GROUP add constraint FK_TM_TASK_GROUP_SECRETARY foreign key (SECRETARY_ID) references SEC_USER(ID)^
alter table TM_TASK_GROUP add constraint FK_TM_TASK_GROUP_INITIATOR foreign key (INITIATOR_ID) references SEC_USER(ID)^
alter table TM_TASK_GROUP add constraint FK_TM_TASK_GROUP_SUBSTITUTED_CREATOR foreign key (SUBSTITUTED_CREATOR_ID) references SEC_USER(ID)^
alter table TM_TASK_GROUP add constraint FK_TM_TASK_GROUP_PARENT_CARD foreign key (PARENT_CARD_ID) references WF_CARD(ID)^

------------------------------------------------------------------------------------------------------------

create table TM_PRIORITY (
    ID uuid,
    NAME varchar(50),
    ORDER_NO numeric(3),
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    primary key (ID)
)^

------------------------------------------------------------------------------------------------------------

create table TM_PROJECT_GROUP (
    ID uuid,
    NAME varchar(100),
    PARENT_PROJECT_GROUP_ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    ORGANIZATION_ID uuid,
    primary key (ID)
)^

alter table TM_PROJECT_GROUP add constraint FK_TM_PROJECT_GROUP_PROJECT_GROUP foreign key (PARENT_PROJECT_GROUP_ID) references TM_PROJECT_GROUP(ID)^

------------------------------------------------------------------------------------------------------------

create table TM_PROJECT (
    ID uuid,
    NAME varchar(100),
    PROJECT_GROUP_ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    TYPE varchar(1),
    ORGANIZATION_ID uuid,
    primary key (ID)
)^

alter table TM_PROJECT add constraint FK_TM_PROJECT_PROJECT_GROUP foreign key (PROJECT_GROUP_ID) references TM_PROJECT_GROUP(ID)^

------------------------------------------------------------------------------------------------------------

create table TM_TASK (
    CARD_ID uuid,
    CREATE_DATETIME timestamp,
    CREATE_DATE date,
    NUM varchar(50),
    TASK_NAME varchar(500),
    FULL_DESCR text,
    HIDDEN boolean,
    PERCENT_COMPLETION numeric(3),
    LABOUR_INTENSITY numeric(5,2),
    DURATION numeric(5,2),
    START_DATETIME_FACT timestamp,
    FINISH_DATE_PLAN date,
    FINISH_DATETIME_PLAN timestamp,
    FINISH_DATE_FACT date,
    FINISH_DATETIME_FACT timestamp,
    TIME_UNIT varchar(1),
    TASK_TYPE_ID uuid,
    PRIORITY_ID uuid,
    EXECUTOR_ID uuid,
    INITIATOR_ID uuid,
    START_TASK_TYPE integer,
    CONTROL_ENABLED boolean,
    REFUSE_ENABLED boolean,
    REASSIGN_ENABLED boolean,
    OVERDUE_NOTIFIED varchar(1),
    LABOUR_UNIT varchar(1),
    LABOUR_HOUR numeric(7,2),
    CONFIRM_REQUIRED boolean,
    PRIMARY_TASK_ID uuid,
    SCHEDULE_TASK_ID uuid,
    ORGANIZATION_ID uuid,
    PROJECT_ID uuid,
    primary key (CARD_ID),

    constraint FK_TM_TASK_PROJECT foreign key(PROJECT_ID) references TM_PROJECT(ID)
)^

alter table TM_TASK add constraint FK_TM_TASK_CARD foreign key (CARD_ID) references WF_CARD(ID)^
alter table TM_TASK add constraint FK_TM_TASK_TASK_TYPE foreign key (TASK_TYPE_ID) references TM_TASK_TYPE(CATEGORY_ID)^
alter table TM_TASK add constraint FK_TM_TASK_PRIORITY foreign key (PRIORITY_ID) references TM_PRIORITY(ID)^
alter table TM_TASK add constraint FK_TM_TASK_EXECUTOR_USER foreign key (EXECUTOR_ID) references SEC_USER(ID)^
alter table TM_TASK add constraint FK_TM_TASK_INITIATOR_USER foreign key (INITIATOR_ID) references SEC_USER(ID)^
alter table TM_TASK add constraint FK_TM_TASK_TASK foreign key (PRIMARY_TASK_ID) references TM_TASK(CARD_ID)^

create index IDX_TM_TASK_CREATE_DATE on TM_TASK (CREATE_DATE)^

------------------------------------------------------------------------------------------------------------

create table TM_TASK_PATTERN_GROUP (
    ID uuid,
    NAME varchar(50),
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    ORGANIZATION_ID uuid,
    primary key (ID)
)^
------------------------------------------------------------------------------------------------------------

create table TM_TASK_PATTERN (
    PATTERN_NAME varchar(255),
    CARD_ID uuid,
    CREATE_DATETIME timestamp,
    CREATE_DATE date,
    NUM varchar(50),
    TASK_NAME varchar(500),
    FULL_DESCR varchar(4000),
    HIDDEN boolean,
    PERCENT_COMPLETION numeric(3),
    LABOUR_INTENSITY numeric(5,2),
    DURATION numeric(5,2),
    TIME_UNIT varchar(1),
    LABOUR_UNIT varchar(1),
    START_DATETIME_FACT timestamp,
    FINISH_DATE_PLAN date,
    FINISH_DATETIME_PLAN timestamp,
    FINISH_DATE_FACT date,
    FINISH_DATETIME_FACT timestamp,
    CONTROL_ENABLED boolean,
    REFUSE_ENABLED boolean,
    REASSIGN_ENABLED boolean,
    CONFIRM_REQUIRED boolean,
    START_TASK_TYPE integer,
    TASK_TYPE_ID uuid,
    PRIORITY_ID uuid,
    GLOBAL boolean,
    ORGANIZATION_ID uuid,
    PROJECT_ID uuid,
    primary key (CARD_ID),

    constraint FK_TASK_PATTERN_PROJECT foreign key(PROJECT_ID) references TM_PROJECT(ID)
)^

alter table TM_TASK_PATTERN add constraint FK_TM_TASK_PATTERN_CARD foreign key (CARD_ID) references WF_CARD(ID)^
alter table TM_TASK_PATTERN add constraint FK_TM_TASK_PATTERN_TASK_TYPE foreign key (TASK_TYPE_ID) references TM_TASK_TYPE(CATEGORY_ID)^
alter table TM_TASK_PATTERN add constraint FK_TM_TASK_PATTERN_PRIORITY foreign key (PRIORITY_ID) references TM_PRIORITY(ID)^


------------------------------------------------------------------------------------------------------------

create table TM_TASK_PATTERN_GROUP_TASK_PATTERN (
    TASK_PATTERN_GROUP_ID uuid,
    TASK_PATTERN_ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50)
)^

alter table TM_TASK_PATTERN_GROUP_TASK_PATTERN add constraint FK_TM_TPG_TP_TASK_PATTERN_GROUP
foreign key (TASK_PATTERN_GROUP_ID) references TM_TASK_PATTERN_GROUP(ID)^
alter table TM_TASK_PATTERN_GROUP_TASK_PATTERN add constraint FK_TM_TPG_TP_TASK_PATTERN
foreign key (TASK_PATTERN_ID) references TM_TASK_PATTERN(CARD_ID)^

create unique index IDX_TM_TASK_PATTERN_GROUP_TASK_PATTERN_U
on TM_TASK_PATTERN_GROUP_TASK_PATTERN (TASK_PATTERN_GROUP_ID, TASK_PATTERN_ID, DELETE_TS)^

------------------------------------------------------------------------------------------------------------
create table TM_TASK_VERSION (
    CARD_ID uuid,
    CREATE_DATETIME timestamp,
    CREATE_DATE date,
    NUM varchar(50),
    TASK_NAME varchar(255),
    FULL_DESCR varchar(4000),
    HIDDEN boolean,
    PERCENT_COMPLETION numeric(3),
    LABOUR_INTENSITY numeric(5,2),
    DURATION numeric(5,2),
    TIME_UNIT varchar(1),
    LABOUR_UNIT varchar(1),
    START_DATETIME_FACT timestamp,
    FINISH_DATE_PLAN date,
    FINISH_DATETIME_PLAN timestamp,
    FINISH_DATE_FACT date,
    FINISH_DATETIME_FACT timestamp,
    CONTROL_ENABLED boolean,
    REFUSE_ENABLED boolean,
    REASSIGN_ENABLED boolean,
    CONFIRM_REQUIRED boolean,
    START_TASK_TYPE integer,
    TASK_TYPE_ID uuid,
    PRIORITY_ID uuid,
    TASK_ID uuid,
    ORGANIZATION_ID uuid,
    primary key (CARD_ID)
)^

alter table TM_TASK_VERSION add constraint FK_TM_TASK_VERSION_CARD foreign key (CARD_ID) references WF_CARD(ID)^
alter table TM_TASK_VERSION add constraint FK_TM_TASK_VERSION_TASK_TYPE foreign key (TASK_TYPE_ID) references TM_TASK_TYPE(CATEGORY_ID)^
alter table TM_TASK_VERSION add constraint FK_TM_TASK_VERSION_PRIORITY foreign key (PRIORITY_ID) references TM_PRIORITY(ID)^
alter table TM_TASK_VERSION add constraint FK_TM_TASK_VERSION_TASK foreign key (TASK_ID) references TM_TASK(CARD_ID)^

------------------------------------------------------------------------------------------------------------
create table TM_TASK_INFO (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    TASK_ID uuid,
    TYPE integer,
    USER_ID uuid,
    JBPM_EXECUTION_ID varchar(255),
    ACTIVITY varchar(255),
    primary key (ID)
)^

alter table TM_TASK_INFO add constraint FK_TM_TASK_INFO_TASK foreign key (TASK_ID) references TM_TASK(CARD_ID)^
alter table TM_TASK_INFO add constraint FK_TM_TASK_INFO_USER foreign key (USER_ID) references SEC_USER(ID)^

------------------------------------------------------------------------------------------------------------

create table TM_CARD_PROJECT (
    CARD_ID uuid,
    PROJECT_ID uuid
)^

alter table TM_CARD_PROJECT add constraint FK_TM_CP_CARD foreign key (CARD_ID) references WF_CARD(ID)^
alter table TM_CARD_PROJECT add constraint FK_TM_CP_PROJECT foreign key (PROJECT_ID) references TM_PROJECT(ID)^

------------------------------------------------------------------------------------------------------------

create sequence seq_un_task_num start with 1 increment by 1^

------------------------------------------------------------------------------------------------------------

create table TM_TASK_GROUP_USER (
    USER_ID uuid,
    TASK_GROUP_ID uuid
)^

alter table TM_TASK_GROUP_USER add constraint TM_TASK_GROUP_USER_PROFILE foreign key (TASK_GROUP_ID) references TM_TASK_GROUP(ID)^
alter table TM_TASK_GROUP_USER add constraint TM_TASK_GROUP_USER_USER foreign key (USER_ID) references SEC_USER(ID)^

-------------------------------------------------------------------------------------------------------------

create table TM_TASK_GROUP_TASK (
    ID uuid not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    DESCR varchar(500),
    FULL_DESCR text,
    TASK_TYPE_ID uuid,
    PRIORITY_ID uuid,
    CONTROLLER_ID uuid,
    OBSERVER_ID uuid,
    PROJECT_ID uuid,
    FINISH_DATE timestamp, 
    TASK_ID uuid,
    TASK_GROUP_ID uuid,
    USER_ID uuid,
    INITIATOR_ID uuid,
    DURATION numeric(5,2),
    TIME_UNIT varchar(1),
    CREATE_DATETIME timestamp,
    START_DATETIME_FACT timestamp,
    HAS_TASK boolean,
    IS_TASK_FINISHED boolean,
    primary key (ID)
)^

alter table TM_TASK_GROUP_TASK add constraint TM_TASK_GROUP_TASK_PROFILE foreign key (TASK_GROUP_ID) references TM_TASK_GROUP(ID)^
alter table TM_TASK_GROUP_TASK add constraint TM_TASK_GROUP_TASK_TASK foreign key (TASK_ID) references TM_TASK(CARD_ID)^
alter table TM_TASK_GROUP_TASK add constraint TM_TASK_GROUP_TASK_USER foreign key (USER_ID) references SEC_USER(ID)^
alter table TM_TASK_GROUP_TASK add constraint FK_DF_INITIATOR_USER foreign key (INITIATOR_ID) references SEC_USER(ID)^

-------------------------------------------------------------------------------------------------------------

create table TM_REMINDER(
    ID uuid,
    DURATION integer,
    TIME_UNIT varchar(1),
    REMINDER_DATE timestamp,
    NOTIFIED boolean,
    CARD_ID uuid,
    USER_ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    primary key (ID)
)^

alter table TM_REMINDER add constraint FK_TM_REMINDER_CARD foreign key (CARD_ID) references WF_CARD(ID)^
alter table TM_REMINDER add constraint FK_TM_REMINDER_USER foreign key (USER_ID) references SEC_USER(ID)^

------------------------------------------------------------------------------------------------------------

create table DF_NUMERATOR (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    NAME varchar(100),
    SCRIPT varchar(4000),
    SCRIPT_ENABLED boolean,
    NUMERATOR_FORMAT text,
    PERIODICITY varchar(1),
    NUMBER_INITIAL_VALUE integer default 1,
    primary key (ID)
)^

------------------------------------------------------------------------------------------------------------

create table DF_DOC_KIND (
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    DOC_TYPE_ID uuid,
    CODE varchar(50),
    DESCRIPTION varchar(200),
    FIELDS_XML text,
    NUMERATOR_ID uuid,
    NUMERATOR_TYPE integer,
    PREFIX varchar(100),
    CATEGORY_ATTRS_PLACE integer,
    CATEGORY_ID uuid,
    USE_ALL_PROCS boolean,
    ORGANIZATION_ID uuid,
    TAB_NAME varchar(30),
    CREATE_ONLY_BY_TEMPLATE boolean,
    DISABLE_ADD_PROCESS_ACTORS boolean,
    PORTAL_PUBLISH_ALLOWED boolean,
    primary key (CATEGORY_ID)
)^

alter table DF_DOC_KIND add constraint FK_DF_DOC_KIND_NUMERATOR foreign key (NUMERATOR_ID) references DF_NUMERATOR (ID)^
alter table DF_DOC_KIND add constraint DF_DOC_KIND_CATEGORY_ID foreign key (CATEGORY_ID) references SYS_CATEGORY(ID)^

------------------------------------------------------------------------------------------------------------
create table DF_DOC_KIND_WF_PROC (
    CATEGORY_ID uuid,
    PROC_ID uuid
)^

alter table DF_DOC_KIND_WF_PROC add constraint DF_DOC_KIND_WF_PROC_C foreign key (CATEGORY_ID) references DF_DOC_KIND(CATEGORY_ID)^
alter table DF_DOC_KIND_WF_PROC add constraint DF_DOC_KIND_WF_PROC_P foreign key (PROC_ID) references WF_PROC(ID)^

------------------------------------------------------------------------------------------------------------

create table DF_DOC_TYPE (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    NAME varchar(100),
    DISCRIMINATOR integer,
    DOC_KIND_ID uuid,
    DOC_TEMPLATE_ID uuid,
    FIELDS_XML text,
    primary key (ID)
)^

alter table DF_DOC_TYPE add constraint FK_DF_DOC_TYPE_KIND foreign key (DOC_KIND_ID) references DF_DOC_KIND (CATEGORY_ID)^
alter table DF_DOC_KIND add constraint FK_DF_DOC_KIND_TYPE foreign key (DOC_TYPE_ID) references DF_DOC_TYPE (ID)^

------------------------------------------------------------------------------------------------------------

create table DF_CATEGORY (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    DOC_TYPE_ID uuid,
    NAME varchar(100),
    CODE varchar(100),
    ORGANIZATION_ID uuid,
    primary key (ID)
)^

alter table DF_CATEGORY add constraint FK_DF_CATEGORY_DOC_TYPE foreign key (DOC_TYPE_ID) references DF_DOC_TYPE (ID)^

------------------------------------------------------------------------------------------------------------

create table DF_ORGANIZATION (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    NAME varchar(200),
    FULL_NAME varchar(200),
    INN varchar(12),
    OKPO varchar(10),
    KPP varchar(9),
    POSTAL_ADDRESS varchar(300),
    LEGAL_ADDRESS varchar(300),
    PHONE varchar(100),
    FAX varchar(100),
    EMAIL varchar(100),
    COMMENT varchar(1000),
    CODE varchar(20),
    SECRETARY_ID uuid,
    HAS_ATTACHMENTS boolean,
    primary key (ID)
)^

alter table DF_ORGANIZATION add constraint FK_DF_ORGANIZATION_SECRETARY foreign key (SECRETARY_ID) references SEC_USER(ID)^
alter table DF_DOC_KIND add constraint fk_DOC_KIND_organization foreign key (organization_id) references DF_ORGANIZATION (id)
    match SIMPLE on update no action on delete no action^

----------------------------------------------------------------
create table DF_DOC_RECEIVING_METHOD (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    NAME varchar(200),
    primary key (ID)
)^

----------------------------------------------------------------

create table DF_CORRESPONDENT (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    NAME varchar(255),
    TYPE varchar(1),
    ORGANIZATION_ID uuid,
    HAS_ATTACHMENTS boolean,
    primary key (ID)
)^

alter table DF_CORRESPONDENT add constraint FK_DF_CORRESPONDENT_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION(ID)^

------------------------------------------------------------------------------------------------------------

create table DF_CONTRACTOR (
    CORRESPONDENT_ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    NAME varchar(200),
    INN varchar(12),
    POSTAL_ADDRESS varchar(300),
    LEGAL_ADDRESS varchar(300),
    PHONE varchar(100),
    FAX varchar(100),
    EMAIL varchar(100),
    COMMENT varchar(1000),
    primary key (CORRESPONDENT_ID)
)^

alter table DF_CONTRACTOR add constraint FK_DF_CONTRACTOR_CORRESPONDENT foreign key (CORRESPONDENT_ID) references DF_CORRESPONDENT(ID)^

------------------------------------------------------------------------------------------------------------

create table DF_COMPANY (
    CONTRACTOR_ID uuid,
    FULL_NAME varchar(500),
    OKPO varchar(10),
    OGRN VARCHAR(13),
    KPP varchar(9),
    primary key (CONTRACTOR_ID)
)^

alter table DF_COMPANY add constraint FK_DF_COMPANY_CONTRACTOR foreign key (CONTRACTOR_ID) references DF_CONTRACTOR (CORRESPONDENT_ID)^

------------------------------------------------------------------------------------------------------------

create table DF_INDIVIDUAL (
    CONTRACTOR_ID uuid,
    FIRST_NAME varchar(100),
    LAST_NAME varchar(100),
    MIDDLE_NAME varchar(100),
    PASSPORT_NO varchar(20),
    PASSPORT_SERIES varchar(20),
    PASSPORT_GIVEN_BY varchar(200),
    PASSPORT_GIVEN_WHEN date,
    BIRTH_DATE date,
    EGRIP varchar(15),
    primary key (CONTRACTOR_ID)
)^

alter table DF_INDIVIDUAL add constraint FK_DF_INDIVIDUAL_CONTRACTOR foreign key (CONTRACTOR_ID) references DF_CONTRACTOR (CORRESPONDENT_ID)^

------------------------------------------------------------------------------------------------------------

create table DF_CONTACT_PERSON (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    NAME varchar(200),
    FIRST_NAME varchar(100),
    LAST_NAME varchar(100),
    MIDDLE_NAME varchar(100),
    POSITION varchar(100),
    PHONE varchar(100),
    FAX varchar(100),
    EMAIL varchar(100),
    COMMENT varchar(1000),
    COMPANY_ID uuid,
    primary key (ID)
)^

alter table DF_CONTACT_PERSON add constraint FK_DF_CONTACT_PERSON_COMPANY foreign key (COMPANY_ID) references DF_COMPANY (CONTRACTOR_ID)^

------------------------------------------------------------------------------------------------------------

create table DF_BANK_REGION (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    NAME varchar(200),
    CODE varchar(9),
    UPLOAD_FROM_CBR boolean,
    primary key (ID)
)^

------------------------------------------------------------------------------------------------------------

create table DF_BANK (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    NAME varchar(200),
    BIK varchar(9),
    COR_ACCOUNT varchar(20),
    BANK_REGION_ID uuid,
    TYPE varchar(2),
    ADDRESS varchar(300),
    SHORT_NAME varchar(200),
    UPLOAD_FROM_CBR boolean,
    primary key (ID)
)^

alter table DF_BANK add constraint FK_DF_BANK_BANK_REGION foreign key (BANK_REGION_ID) references DF_BANK_REGION (ID)^

------------------------------------------------------------------------------------------------------------

create table DF_CURRENCY (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    NAME varchar(100),
    CODE varchar(10),
    DIGITAL_CODE varchar(3),
    primary key (ID)
)^

------------------------------------------------------------------------------------------------------------

create table DF_CONTRACTOR_ACCOUNT (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    NO varchar(20),
    CORRESPONDENT_NO varchar(20),
    COMMENT varchar(1000),
    NAME varchar(200),
    CORRESPONDENT varchar(200),
    APPOINTMENT varchar(500),
    CONTRACTOR_ID uuid,
    CURRENCY_ID uuid,
    BANK_ID uuid,
    INDIRECT_CALC_BANK_ID uuid,
    TYPE varchar(1),
    primary key (ID)
)^

alter table DF_CONTRACTOR_ACCOUNT add constraint FK_DF_CONTRACTOR_ACCOUNT_CONTRACTOR foreign key (CONTRACTOR_ID) references DF_CONTRACTOR (CORRESPONDENT_ID)^
alter table DF_CONTRACTOR_ACCOUNT add constraint FK_DF_CONTRACTOR_ACCOUNT_CURRENCY foreign key (CURRENCY_ID) references DF_CURRENCY (ID)^
alter table DF_CONTRACTOR_ACCOUNT add constraint FK_DF_CONTRACTOR_ACCOUNT_BANK foreign key (BANK_ID) references DF_BANK (ID)^
alter table DF_CONTRACTOR_ACCOUNT add constraint FK_DF_CONTRACTOR_ACCOUNT_DF_BANK foreign key (INDIRECT_CALC_BANK_ID) references DF_BANK (ID)^

------------------------------------------------------------------------------------------------------------

create table DF_ORGANIZATION_ACCOUNT (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    NO varchar(20),
    CORRESPONDENT_NO varchar(20),
    COMMENT varchar(1000),
    NAME varchar(200),
    CORRESPONDENT varchar(200),
    APPOINTMENT varchar(500),
    ORGANIZATION_ID uuid,
    CURRENCY_ID uuid,
    BANK_ID uuid,
    INDIRECT_CALC_BANK_ID uuid,
    TYPE varchar(1),
    primary key (ID)
)^

alter table DF_ORGANIZATION_ACCOUNT add constraint FK_DF_ORGANIZATION_ACCOUNT_CONTRACTOR foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
alter table DF_ORGANIZATION_ACCOUNT add constraint FK_DF_ORGANIZATION_ACCOUNT_CURRENCY foreign key (CURRENCY_ID) references DF_CURRENCY (ID)^
alter table DF_ORGANIZATION_ACCOUNT add constraint DF_ORGANIZATION_ACCOUNT_BANK foreign key (BANK_ID) references DF_BANK (ID)^
alter table DF_ORGANIZATION_ACCOUNT add constraint FK_DF_ORGANIZATION_ACCOUNT_DF_BANK foreign key (INDIRECT_CALC_BANK_ID) references DF_BANK (ID)^

------------------------------------------------------------------------------------------------------------

create table DF_DEPARTMENT (
    CORRESPONDENT_ID uuid,
    CODE varchar(20),
    PARENT_DEPARTMENT_ID uuid,
    primary key (CORRESPONDENT_ID)
)^

alter table DF_DEPARTMENT add constraint FK_DF_DEPARTMENT_DEPARTMENT foreign key (PARENT_DEPARTMENT_ID) references DF_DEPARTMENT (CORRESPONDENT_ID)^
alter table DF_DEPARTMENT add constraint FK_DF_DEPARTMENT_CORRESPONDENT foreign key (CORRESPONDENT_ID) references DF_CORRESPONDENT(ID)^

create index IDX_DF_DEPARTMENT_PARENT on DF_DEPARTMENT(PARENT_DEPARTMENT_ID)^
------------------------------------------------------------------------------------------------------------

create table DF_OFFICE_FILE_NOMENCLATURE (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    NAME varchar(200),
    INDEX_N varchar(50),
    YEAR numeric(4),
    ARTICLES_LIST varchar(100),
    COMMENT varchar(2000),
    EC_MARK boolean,
    CATEGORY numeric(1),
    STORAGE_PERIOD numeric(3),
    ORGANIZATION_ID uuid,
    PARENT_NOMENCLATURE_ID uuid,
    DEPARTMENT_ID uuid,
    SUBSTITUTED_CREATOR_ID uuid,
    primary key (ID)
)^

alter table DF_OFFICE_FILE_NOMENCLATURE add constraint FK_DF_OFFICE_FILE_NOMENCLATURE_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION(ID)^
alter table DF_OFFICE_FILE_NOMENCLATURE add constraint FK_DF_OFFICE_FILE_NOMENCLATURE_NOMENCLATURE foreign key (PARENT_NOMENCLATURE_ID) references DF_OFFICE_FILE_NOMENCLATURE(ID)^
alter table DF_OFFICE_FILE_NOMENCLATURE add constraint FK_DF_OFFICE_FILE_NOMENCLATURE_DEPARTMENT foreign key (DEPARTMENT_ID) references DF_DEPARTMENT (CORRESPONDENT_ID)^
alter table DF_OFFICE_FILE_NOMENCLATURE add constraint FK_DF_OFFICE_FILE_NOMENCLATURE_TO_SEC_USER foreign key (SUBSTITUTED_CREATOR_ID) references SEC_USER(ID)^

----------------------------------------------------------------
create table DF_OFFICE_FILE (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    VOLUME_NO varchar(10),
    DATE_FROM date,
    DATE_TO date,
    SHEETS_QTY numeric(5),
    LOCATION varchar(200),
    COMMENT varchar(2000),
    DISPLAYED_NAME varchar(500),
    STATE integer,
    OFFICE_FILE_NOMENCLATURE_ID uuid,
    NUMERATOR_ID uuid,
    SUBSTITUTED_CREATOR_ID uuid,
    ORGANIZATION_ID uuid,
    primary key (ID)
)^

alter table DF_OFFICE_FILE add constraint FK_DF_OFFICE_FILE_NOMENCLATURE foreign key (OFFICE_FILE_NOMENCLATURE_ID) references DF_OFFICE_FILE_NOMENCLATURE(ID)^
alter table DF_OFFICE_FILE add constraint FK_DF_OFFICE_FILE_NUMERATOR foreign key (NUMERATOR_ID) references DF_NUMERATOR(ID)^
alter table DF_OFFICE_FILE add constraint FK_DF_OFFICE_FILE_NOMENCLATURE_TO_SEC_USER foreign key (SUBSTITUTED_CREATOR_ID) references SEC_USER(ID);

create unique index IDX_DF_OFFICE_FILE_UNIQ on DF_OFFICE_FILE (VOLUME_NO, OFFICE_FILE_NOMENCLATURE_ID) where DELETE_TS is null;
create index IDX_OFFICE_FILE_STATE on DF_OFFICE_FILE(state);
----------------------------------------------------------------
create table DF_OFFICE_FILE_NOMENCLATURE_RELATION (
    ID uuid not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),

    DF_OFFICE_FILE_ID uuid,
    DF_OFFICE_FILE_NOMENCLATURE_ID uuid
)^

alter table DF_OFFICE_FILE_NOMENCLATURE_RELATION add constraint DF_OFFICE_FILE_NOMENCLATURE_RELATION_OFFICE_FILE foreign key (DF_OFFICE_FILE_ID) references DF_OFFICE_FILE(ID)^
alter table DF_OFFICE_FILE_NOMENCLATURE_RELATION add constraint DF_OFFICE_FILE_NOMENCLATURE_RELATION_NOMENCLATURE foreign key (DF_OFFICE_FILE_NOMENCLATURE_ID) references DF_OFFICE_FILE_NOMENCLATURE(ID)^
----------------------------------------------------------------

create table DF_POSITION (
     ID uuid,
     CREATE_TS timestamp,
     CREATED_BY varchar(50),
     VERSION integer,
     UPDATE_TS timestamp,
     UPDATED_BY varchar(50),
     DELETE_TS timestamp,
     DELETED_BY varchar(50),
     NAME varchar(400),

     primary key (ID)
)^

create unique index IDX_DF_POSITION_UNIQUENESS on DF_POSITION (upper(NAME)) where DELETE_TS IS NULL;
---------------------------------------------------------------------------------------------------

create table DF_EMPLOYEE (
    CORRESPONDENT_ID uuid,
    NAME varchar(255),
    FIRST_NAME varchar(255),
    LAST_NAME varchar(255),
    MIDDLE_NAME varchar(255),
    POSITION_ID uuid,
    PHONE varchar(100),
    FAX varchar(100),
    EMAIL varchar(100),
    COMMENT varchar(1000),
    DEPARTMENT_ID uuid,
    SEX varchar(1),
    USER_ID uuid,
    NUMBER varchar(50),
    MOBILE_PHONE varchar(100),
    PHOTO_FILE_ID uuid,
    AVATAR_FILE_ID uuid,
    BIRTHDAY date,
    primary key (CORRESPONDENT_ID)
)^

alter table DF_EMPLOYEE add constraint FK_DF_EMPLOYEE_AVATAR_FILE_ID foreign key (AVATAR_FILE_ID) references SYS_FILE(ID)^
alter table DF_EMPLOYEE add constraint FK_DF_EMPLOYEE_DEPARTMENT foreign key (DEPARTMENT_ID) references DF_DEPARTMENT (CORRESPONDENT_ID)^
alter table DF_EMPLOYEE add constraint FK_DF_EMPLOYEE_USER foreign key (USER_ID) references SEC_USER (ID)^
alter table DF_EMPLOYEE add constraint FK_DF_EMPLOYEE_CORRESPONDENT foreign key (CORRESPONDENT_ID) references DF_CORRESPONDENT(ID)^
alter table DF_EMPLOYEE add constraint FK_DF_EMPLOYEE_SYS_FILE foreign key (PHOTO_FILE_ID) references SYS_FILE (ID);
alter table DF_EMPLOYEE add constraint FK_DF_EMPLOYEE_DF_POSITION foreign key (POSITION_ID) references DF_POSITION(ID)^

------------------------------------------------------------------------------------------------------------

create table DF_DOC (
    CARD_ID uuid,
    IS_TEMPLATE boolean,
    CREATE_DATE date,
    TEMPLATE_NAME varchar(200),
    VERSION_OF_ID uuid,
    DOC_KIND_ID uuid,
    CATEGORY_ID uuid,
    ORGANIZATION_ID uuid,
    NUMBER varchar(50),
    DATETIME timestamp,
    DATE date,
    OWNER_ID uuid,
    DEPARTMENT_ID uuid,
    COMMENT text,
    INCOME_DATE date,
    INCOME_NO varchar(50),
    OUTCOME_DATE date,
    OUTCOME_NO varchar(50),
    DOC_OFFICE_DOC_KIND varchar(1),
    RESOLUTION text,
    REGISTERED boolean,
    DOUBLE_REGISTERED boolean,
    FINISH_DATE_PLAN date,
    SIGNATURES text,
    OVERDUE boolean,
    GLOBAL boolean,
    REG_NO varchar(50),
    REG_DATE date,
    ENDORSEMENT_START_DATE timestamp,
    ENDORSEMENT_END_DATE timestamp,
    APPROVAL_DATE timestamp,
    ENDORSED boolean,
    AVAILABLE_FOR_ALL boolean,
    THEME varchar(650),
    ARCHIVED boolean,
    PROJECT_ID uuid,
    POST_TRACKING_NUMBER varchar(20),
    primary key (CARD_ID),

    constraint FK_DF_DOC_PROJECT foreign key(PROJECT_ID) references TM_PROJECT(ID)
)^

alter table DF_DOC add constraint FK_DF_DOC_CARD foreign key (CARD_ID) references WF_CARD (ID)^

alter table DF_DOC add constraint FK_DF_DOC_VERSION_OF foreign key (VERSION_OF_ID) references WF_CARD (ID)^

alter table DF_DOC add constraint FK_DF_DOC_DOC_KIND foreign key (DOC_KIND_ID) references DF_DOC_KIND (CATEGORY_ID)^

alter table DF_DOC add constraint FK_DF_DOC_CATEGORY foreign key (CATEGORY_ID) references DF_CATEGORY (ID)^

alter table DF_DOC add constraint FK_DF_DOC_EMPLOYEE foreign key (OWNER_ID) references DF_EMPLOYEE (CORRESPONDENT_ID)^

alter table DF_DOC add constraint FK_DF_DOC_DEPARTMENT foreign key (DEPARTMENT_ID) references DF_DEPARTMENT (CORRESPONDENT_ID)^

alter table DF_DOC_TYPE add constraint FK_DF_DOC_TYPE_TEMPLATE foreign key (DOC_TEMPLATE_ID) references DF_DOC(CARD_ID)^

alter table DF_DOC add constraint FK_DF_DOC_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION(ID)^

create index IDX_DF_DOC_DATE on DF_DOC(DATE)^

create index IDX_DF_DOC_DATETIME on DF_DOC(DATETIME)^

create index IDX_DF_DOC_REG_DATE on DF_DOC(REG_DATE)^

create index IDX_DF_DOC_REG_NO on DF_DOC(REG_NO)^

create index IDX_DF_DOC_NUMBER on DF_DOC(NUMBER)^

create index IDX_DF_DOC_OUTCOME_NO on DF_DOC(OUTCOME_NO)^

create index IDX_DF_DOC_INCOME_NO on DF_DOC(INCOME_NO)^

create index IDX_WF_CARD_PARENT_CARD_DELETE_TS on WF_CARD(PARENT_CARD_ID, DELETE_TS)^

create index IDX_DF_DOC_TEMPLATE_VERSION on DF_DOC(IS_TEMPLATE, VERSION_OF_ID)^

create index IDX_DF_DOC_TEMPLATE_VERSION_DATE on DF_DOC(IS_TEMPLATE, VERSION_OF_ID, DATE)^

create index IDX_DF_DOC_TEMPLATE_VERSION_NUMBER on DF_DOC(IS_TEMPLATE, VERSION_OF_ID, NUMBER)^

create index idx_doc_archived on DF_DOC(archived) ^
------------------------------------------------------------------------------------------------------------

create table DF_SIMPLE_DOC (
    CARD_ID uuid,
    ORDER_TEXT text,
    DOC_SENDER_ID uuid,
    DOC_RECEIVER_ID uuid,
    DOC_COPY_RECEIVER_ID uuid,
    PORTAL_AUTHOR_NAME varchar(500),
    PORTAL_AUTHOR_EMAIL varchar(500),
    PORTAL_PUBLISH_STATE varchar(5),
    PORTAL_PUBLISH_ERROR_DESCRIPTION varchar(2000),
    FROM_PORTAL boolean,
    ORDER_CAUSE varchar(1000),
    primary key (CARD_ID)
)^

alter table DF_SIMPLE_DOC add constraint FK_DF_SIMPLE_DOC_DOC foreign key (CARD_ID) references DF_DOC (CARD_ID)^
alter table DF_SIMPLE_DOC add constraint FK_DF_SIMPLE_DOC_EMPLOYEE_1 foreign key (DOC_SENDER_ID) references DF_EMPLOYEE (CORRESPONDENT_ID)^
alter table DF_SIMPLE_DOC add constraint FK_DF_SIMPLE_DOC_EMPLOYEE_2 foreign key (DOC_RECEIVER_ID) references DF_EMPLOYEE (CORRESPONDENT_ID)^
alter table DF_SIMPLE_DOC add constraint FK_DF_SIMPLE_DOC_EMPLOYEE_3 foreign key (DOC_COPY_RECEIVER_ID) references DF_EMPLOYEE (CORRESPONDENT_ID)^

------------------------------------------------------------------------------------------------------------

create table DF_DOC_EXTRA_FIELD (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    CARD_ID uuid,
    FIELD_NAME varchar(50),
    FIELD_VALUE varchar(1000),
    primary key (ID)
)^

alter table DF_DOC_EXTRA_FIELD add constraint FK_DF_DOC_EXTRA_FIELD_DOC foreign key (CARD_ID) references DF_DOC (CARD_ID)^
alter table DF_DOC_EXTRA_FIELD ADD CONSTRAINT df_doc_extra_field_card_id_extra_field_id_key UNIQUE(CARD_ID, FIELD_NAME)^
------------------------------------------------------------------------------------------------------------

create table DF_CONTRACT (
    CARD_ID uuid,
    IS_ACTIVE boolean,
    AMOUNT numeric(19,4),
    VAT_INCLUSIVE boolean,
    VAT_RATE numeric(19,4),
    VAT_AMOUNT numeric(19,4),
    CURRENCY_ID uuid,
    PAYMENT_CONDITIONS text,
    LIABILITY_START date,
    LIABILITY_END date,
    NOTIFIED_CREATOR boolean,
    NOTIFIED_OWNER boolean,
    CONTRACTOR_ID uuid,
    CONTACT_PERSON_ID uuid,
    primary key (CARD_ID)
)^

alter table DF_CONTRACT add constraint FK_DF_CONTRACT_DOC foreign key (CARD_ID) references DF_DOC (CARD_ID)^

alter table DF_CONTRACT add constraint FK_DF_CONTRACT_CONTRACTOR foreign key (CONTRACTOR_ID) references DF_CONTRACTOR(CORRESPONDENT_ID)^

alter table DF_CONTRACT add constraint FK_DF_CONTRACT_CONTACT_PERSON foreign key (CONTACT_PERSON_ID) references DF_CONTACT_PERSON(ID)^

alter table DF_CONTRACT add constraint FK_DF_CONTRACT_CURRENCY foreign key (CURRENCY_ID) references DF_CURRENCY(ID)^

-------------------------------------------------------------------------------------------------------------------------------------

create table DF_DOC_OFFICE_DATA (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    DOC_ID uuid,
    RESPONSE_TO_DOC_ID uuid,
    SENDER_ID uuid,
    OFFICE_FILE_ID uuid,
    DOC_RECEIVING_METHOD_ID uuid,
    OFFICE_EXECUTOR_ID uuid,
    OFFICE_SIGNED_BY_ID uuid,
    EMPLOYEE_EXECUTOR_ID uuid,
    EMPLOYEE_SIGNED_BY_ID uuid,
    RESPONSE_PLAN_DATE date,
    RESPONSE_DATE date,
    primary key (ID)
)^

alter table DF_DOC_OFFICE_DATA add constraint FK_DF_DOC_OFFICE_DATA_DOC foreign key (DOC_ID) references DF_DOC(CARD_ID)^

alter table DF_DOC_OFFICE_DATA add constraint FK_DF_DOC_OFFICE_DATA_DOC_RECEIVING_METHOD foreign key (DOC_RECEIVING_METHOD_ID) references DF_DOC_RECEIVING_METHOD(ID)^

alter table DF_DOC_OFFICE_DATA add constraint FK_DF_DOC_OFFICE_DATA_RESPONSE_TO_DOC foreign key (RESPONSE_TO_DOC_ID) references DF_DOC(CARD_ID)^

alter table DF_DOC_OFFICE_DATA add constraint FK_DF_DOC_OFFICE_DATA_SENDER foreign key (SENDER_ID) references DF_CORRESPONDENT(ID)^

alter table DF_DOC_OFFICE_DATA add constraint FK_DF_DOC_OFFICE_DATA_OFFICE_FILE foreign key (OFFICE_FILE_ID) references DF_OFFICE_FILE(ID)^

alter table DF_DOC_OFFICE_DATA add constraint FK_DF_DOC_OFFICE_DATA_OFFICE_EXECUTOR foreign key (OFFICE_EXECUTOR_ID) references DF_CONTACT_PERSON (ID)^

alter table DF_DOC_OFFICE_DATA add constraint FK_DF_DOC_OFFICE_DATA_OFFICE_SIGNED_BY foreign key (OFFICE_SIGNED_BY_ID) references DF_CONTACT_PERSON (ID)^

alter table DF_DOC_OFFICE_DATA add constraint DF_DOC_OFFICE_DATA_EMPLOYEE_EXECUTOR foreign key (EMPLOYEE_EXECUTOR_ID) references DF_EMPLOYEE(CORRESPONDENT_ID)^

alter table DF_DOC_OFFICE_DATA add constraint FK_DF_DOC_OFFICE_DATA_EMPLOYEE_SIGNED_BY foreign key (EMPLOYEE_SIGNED_BY_ID) references DF_EMPLOYEE (CORRESPONDENT_ID)^

------------------------------------------------------------------------------------------------------------

create table DF_DOC_TRANSFER_LOG (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    TYPE integer,
    DOC_OFFICE_DATA_ID uuid,
    EMPLOYEE_ID uuid,
    TRANSFER_DATE timestamp,
    RETURN_DATE timestamp,
    RETURNED boolean,
    COMMENT varchar(2000),
    primary key (ID)
)^

alter table DF_DOC_TRANSFER_LOG add constraint FK_DF_DTL_DOC_OFFICE_DATA foreign key (DOC_OFFICE_DATA_ID) references DF_DOC_OFFICE_DATA (ID)^
alter table DF_DOC_TRANSFER_LOG add constraint FK_DF_DTL_EMPLOYEE foreign key (EMPLOYEE_ID) references DF_EMPLOYEE (CORRESPONDENT_ID)^

------------------------------------------------------------------------------------------------------------

create table DF_APP_INTEGRATION_LOG (
      ID uuid not null,
      CREATE_TS timestamp,
      CREATED_BY varchar(50),
      VERSION integer,
      UPDATE_TS timestamp,
      UPDATED_BY varchar(50),
      DELETE_TS timestamp,
      DELETED_BY varchar(50),
      CHANGE_TYPE varchar(10),
      ENTITY_NAME varchar(100),
      ENTITY_ID uuid,
      CHANGES_SET_ID varchar(100),
      INTEGRATION_STATE integer,
      INTEGRATION_STATE_DATE timestamp,
      primary key (ID)
)^

create index IDX_DF_ACCOUNTING_APP_INTEGRATION_LOG on DF_APP_INTEGRATION_LOG (ENTITY_NAME, ENTITY_ID)^
create index IDX_DF_ACCOUNTING_APP_INTEGRATION_LOG_CHANGES_SET_ID_INTEGRATION_STATE on DF_APP_INTEGRATION_LOG (CHANGES_SET_ID, INTEGRATION_STATE)^

------------------------------------------------------------------------------------------------------------

create table DF_APP_INTEGRATION_LINK_ENTITY (
      ID uuid not null,
      CREATE_TS timestamp,
      CREATED_BY varchar(50),
      VERSION integer,
      UPDATE_TS timestamp,
      UPDATED_BY varchar(50),
      DELETE_TS timestamp,
      DELETED_BY varchar(50),
      ENTITY_NAME varchar(100),
      ENTITY_ID uuid,
      EXTERNAL_ID varchar(100),
      primary key (ID)
);

create index IDX_DF_APP_INTEGRATION_LINK_ENTITY_ENTITY_NAME_ENTITY_ID on DF_APP_INTEGRATION_LINK_ENTITY (ENTITY_NAME, ENTITY_ID);

create index IDX_DF_APP_INTEGRATION_LINK_ENTITY_ENTITY_NAME_EXTERNAL_ID on DF_APP_INTEGRATION_LINK_ENTITY (ENTITY_NAME, EXTERNAL_ID)^

------------------------------------------------------------------------------------------------------------

alter table WF_ATTACHMENT add TASK_GROUP_ID uuid^
alter table WF_ATTACHMENT add constraint FK_WF_ATTACHMENT_TASK_GROUP foreign key (TASK_GROUP_ID) references TM_TASK_GROUP (ID)^

alter table wf_card_role add column readonly boolean;

------------------------------------------------------------------------------------------------------------

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
    SUBSTITUTED_CREATOR_ID uuid,
    ORGANIZATION_ID uuid,
    primary key (ID)
)^

alter table TM_SCHEDULE_TASK add constraint FK_TM_SCHEDULE_TASK_TO_SEC_USER foreign key (SUBSTITUTED_CREATOR_ID) references SEC_USER(ID)^
alter table TM_TASK add constraint FK_TM_TASK_SCHEDULE_TASK_ID foreign key (SCHEDULE_TASK_ID) references TM_SCHEDULE_TASK(ID)^
alter table TM_SCHEDULE_TASK add constraint FK_TM_SCHEDULE_TASK_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION(ID)^

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
    START_DATE timestamp,
    TIME_UNIT varchar(1),
    TYPE varchar(2),
    SCHEDULE_TASK_ID uuid,
    USE_WORK_CALENDAR boolean,
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
    ACTION_NAME varchar(500),
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
    ORGANIZATION_ID uuid,
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
    MESSAGE text,
    SCHEDULE_ACTION_ID uuid,
    IS_ERROR boolean,
    primary key (ID)
);

alter table TM_SCHEDULE_ACTION_LOG add constraint FK_TM_TM_SCHEDULE_ACTION_LOG_SCHEDULE_ACTION foreign key (SCHEDULE_ACTION_ID) references TM_SCHEDULE_ACTION(ID);

---------------------------------------------------------------------------------------------------

create table DF_TYPICAL_RESOLUTION (
    ID uuid not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    NAME varchar(500),
    TEXT text,
    GLOBAL boolean,
    CREATOR_ID uuid,
    SUBSTITUTED_CREATOR_ID uuid,
    ORGANIZATION_ID uuid,
    primary key (ID)
)^

alter table DF_TYPICAL_RESOLUTION add constraint FK_DF_TYPICAL_RESOLUTION_CREATOR 
foreign key (CREATOR_ID) references SEC_USER(ID)^
alter table DF_TYPICAL_RESOLUTION add constraint FK_DF_TYPICAL_RESOLUTION_SUBSTITUTED_CREATOR
foreign key (SUBSTITUTED_CREATOR_ID) references SEC_USER(ID)^

---------------------------------------------------------------------------------------------------

create table WF_CARD_USER_INFO (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    CARD_ID uuid,
    USER_ID uuid,
    IS_IMPORTANT boolean,
    primary key (ID)
)^

alter table WF_CARD_USER_INFO add constraint FK_WF_CARD_USER_INFO_CARD foreign key (CARD_ID) references WF_CARD(ID)^
alter table WF_CARD_USER_INFO add constraint FK_WF_CARD_USER_INFO_USER foreign key (USER_ID) references SEC_USER(ID)^

create table DF_DOC_OFFICE_DATA_ADDRESSEE (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    VERSION integer,
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    DOC_OFFICE_DATA_ID uuid,
    CORRESPONDENT_ID uuid,
    CONTACT_PERSON_ID uuid,
    primary key (ID)
)^

alter table DF_DOC_OFFICE_DATA_ADDRESSEE add constraint FK_DF_DOC_OFFICE_DATA foreign key (DOC_OFFICE_DATA_ID) references DF_DOC_OFFICE_DATA(ID)^

alter table DF_DOC_OFFICE_DATA_ADDRESSEE add constraint FK_DF_CORRESPONDENT foreign key (CORRESPONDENT_ID) references DF_CORRESPONDENT(ID)^

alter table DF_DOC_OFFICE_DATA_ADDRESSEE add constraint FK_DF_CONTACT_PERSON foreign key (CONTACT_PERSON_ID) references DF_CONTACT_PERSON(ID)^

create index IDX_DF_DOC_OFFICE_DATA_ADDRESSEE_DOD on DF_DOC_OFFICE_DATA_ADDRESSEE(DOC_OFFICE_DATA_ID)^

create index IDX_WF_CARD_USER_INFO_CARD on WF_CARD_USER_INFO(card_id)^
create index IDX_WF_CARD_USER_INFO_USER on WF_CARD_USER_INFO(user_id, delete_ts)^

---------------------------------------------------------------------------------------------------
create table TS_CARD_ACL (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    CARD_ID uuid,
    ENTITY varchar(100),
    USER_ID uuid,
    CARD_ROLE_ID uuid,
    ORGANIZATION_ID uuid,
    GLOBAL boolean,
    DESCRIPTION varchar(1000),
    DEPARTMENT_ID uuid,
    CODE integer,
    BASE_ACL_ID uuid,
    primary key (ID)
);

alter table TS_CARD_ACL add constraint FK_TS_CARD_ACL_WF_CARD foreign key (CARD_ID) references WF_CARD(ID);
alter table TS_CARD_ACL add constraint FK_TS_CARD_ACL_SEC_USER foreign key (USER_ID) references SEC_USER(ID);
alter table TS_CARD_ACL add constraint FK_TS_CARD_ACL_WF_CARD_ROLE foreign key (CARD_ROLE_ID) references WF_CARD_ROLE(ID);
alter table TS_CARD_ACL add constraint FK_TS_CARD_ACL_DF_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION(ID);
alter table TS_CARD_ACL add constraint FK_TS_CARD_ACL_DF_DEPARTMENT foreign key (DEPARTMENT_ID) references DF_CORRESPONDENT(ID);
alter table TS_CARD_ACL add constraint FK_TS_CARD_ACL_BASE_CARD_ACL foreign key (BASE_ACL_ID) references TS_CARD_ACL(ID);


create index IDX_TS_CARD_ACL_WF_CARD on TS_CARD_ACL(CARD_ID);
create index IDX_TS_CARD_ACL_SEC_USER on TS_CARD_ACL(USER_ID);
create index IDX_TS_CARD_ACL_WF_CARD_ROLE on TS_CARD_ACL(CARD_ROLE_ID);
create index IDX_TS_CARD_ACL_DF_ORGANIZATION on TS_CARD_ACL(ORGANIZATION_ID);
create index IDX_TS_CARD_ACL_DF_DEPARTMENT on TS_CARD_ACL(DEPARTMENT_ID);
create index IDX_TS_CARD_ACL_GLOBAL on TS_CARD_ACL(GLOBAL) where GLOBAL = true;

---------------------------------------------------------------------------------------------------
create table DF_SHORT_URL (
       ID uuid,
       CREATE_TS timestamp,
       CREATED_BY varchar(50),
       VERSION integer,
       UPDATE_TS timestamp,
       UPDATED_BY varchar(50),
       DELETE_TS timestamp,
       DELETED_BY varchar(50),

       LONG_URL varchar(1000),
       SHORT_URL varchar(100),

       primary key (ID)
 )^

 create index IDX_DF_SHORT_URL_LONG_URL_DELETE_TS on DF_SHORT_URL(LONG_URL, DELETE_TS)^
 create index IDX_DF_SHORT_URL_SHORT_URL_DELETE_TS on DF_SHORT_URL(SHORT_URL, DELETE_TS)^
---------------------------------------------------------------------------------------------------
create table TM_MPP_RESOURCE_USER (
       ID uuid,
       CREATE_TS timestamp,
       CREATED_BY varchar(50),
       VERSION integer,
       UPDATE_TS timestamp,
       UPDATED_BY varchar(50),
       DELETE_TS timestamp,
       DELETED_BY varchar(50),
       RESOURCE_NAME varchar(256),
       USER_ID uuid,
       primary key(ID)
)^

alter table TM_MPP_RESOURCE_USER add constraint FK_TM_MPP_RESOURCE_USER_USER foreign key (USER_ID) references SEC_USER (ID)^
---------------------------------------------------------------------------------------------------

create table DF_EMPLOYEE_DEPARTMENT_POSITION_RELATION(
  ID uuid not null,
  CREATE_TS timestamp,
  CREATED_BY varchar(50),
  UPDATE_TS timestamp,
  UPDATED_BY varchar(50),
  DELETE_TS timestamp,
  DELETED_BY varchar(50),

  EMPLOYEE_ID uuid,
  DEPARTMENT_ID uuid,
  POSITION_ID uuid,
  IS_MAIN boolean,

  primary key (ID)
)^

alter table DF_EMPLOYEE_DEPARTMENT_POSITION_RELATION add constraint FK_DF_EMPLOYEE_DEPARTMENT_RELATION_ACCOUNT_DF_EMPLOYEE foreign key (EMPLOYEE_ID) references DF_EMPLOYEE(correspondent_id)^
alter table DF_EMPLOYEE_DEPARTMENT_POSITION_RELATION add constraint FK_DF_EMPLOYEE_DEPARTMENT_RELATION_DF_DEPARTMENT foreign key (DEPARTMENT_ID) references DF_DEPARTMENT(CORRESPONDENT_ID)^
alter table DF_EMPLOYEE_DEPARTMENT_POSITION_RELATION add constraint FK_DF_EMPLOYEE_DEPARTMENT_RELATION_ACCOUNT_DF_POSITION foreign key (POSITION_ID) references DF_POSITION(ID)^

create index IDX_DF_EDP_RELATION_EMPLOYEE on DF_EMPLOYEE_DEPARTMENT_POSITION_RELATION(EMPLOYEE_ID)^
create index IDX_DF_EDP_RELATION_DEPARTMENT_DELETE_TS on DF_EMPLOYEE_DEPARTMENT_POSITION_RELATION(DEPARTMENT_ID, DELETE_TS)^
---------------------------------------------------------------------------------------------------

create table DF_IMPORT_DATA_TYPE(
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    NAME varchar(100),
    META_CLASS_NAME varchar(50),
    SCRIPT_FILE_ID uuid,
    PATTERN_FILE_ID uuid,
    primary key (ID)
);

alter table DF_IMPORT_DATA_TYPE add constraint FK_DF_IMPORT_DATA_TYPE_SCRIPT_FILE foreign key (SCRIPT_FILE_ID) references SYS_FILE (ID);
alter table DF_IMPORT_DATA_TYPE add constraint FK_DF_IMPORT_DATA_TYPE_PATTERN_FILE foreign key (PATTERN_FILE_ID) references SYS_FILE (ID);

---------------------------------------------------------------------------------------------------

create table DF_IMPORT_DATA_ATTR(
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    IMPORT_DATA_TYPE_ID uuid,
    CELL_NAME varchar(100),
    PROPERTY_NAME varchar(100),
    FIELD_TYPE varchar(100),
    primary key (ID)
);

alter table DF_IMPORT_DATA_ATTR add constraint FK_DF_IMPORT_DATA_ATTR_DATA_TYPE foreign key (IMPORT_DATA_TYPE_ID) references DF_IMPORT_DATA_TYPE(ID)^

---------------------------------------------------------------------------------------------------

create table TS_IMPORT_ENTITY_INFO (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    IMPORT_ID uuid,
    ENTITY_NAME varchar(100),
    ENTITY_ID uuid,
    primary key (ID)
)^

create index IDX_TS_IMPORT_ENTITY_INFO_IMPORT_ID on TS_IMPORT_ENTITY_INFO (IMPORT_ID)^

---------------------------------------------------------------------------------------------------

create table TM_LAZY_LOAD_ATTACHMENT (
    ID uuid,
    FILE_ID uuid,
    HAS_FILE boolean,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    primary key (ID)
)^

alter table TM_LAZY_LOAD_ATTACHMENT add constraint TM_LAZY_LOAD_ATTACHMENT_FILE_ID foreign key (FILE_ID) references SYS_FILE (ID)^

---------------------------------------------------------------------------------------------------

create table DF_SUB_CARD_INFO (
      ID uuid not null,
      CREATE_TS timestamp,
      CREATED_BY varchar(50),
      SUB_CARD_ID uuid not null,
      PARENT_CARD_ID uuid not null,
      SUB_CARD_CREATED_ASSIGNMENT_ID uuid,
      RESOLUTION_ASSIGNMENT_ID uuid,
      ACTIVE boolean,
      TYPE varchar(1),
      primary key (ID)
);

alter table DF_SUB_CARD_INFO add constraint FK_DF_SUB_CARD_INFO_SUB_CARD foreign key (SUB_CARD_ID) references WF_CARD(ID);
alter table DF_SUB_CARD_INFO add constraint FK_DF_SUB_CARD_INFO_PARENT_CARD foreign key (PARENT_CARD_ID) references WF_CARD(ID);
alter table DF_SUB_CARD_INFO add constraint FK_DF_SUB_CARD_INFO_RESOLUTION_ASSIGNMENT foreign key (RESOLUTION_ASSIGNMENT_ID) references WF_ASSIGNMENT(ID);
alter table DF_SUB_CARD_INFO add constraint FK_DF_SUB_CARD_INFO_SUB_CARD_CREATED_ASSIGNMENT foreign key (SUB_CARD_CREATED_ASSIGNMENT_ID) references WF_ASSIGNMENT(ID);

---------------------------------------------------------------------------------------------------

alter table SEC_USER add ORGANIZATION_ID uuid^
alter table SEC_USER add IS_MOBILE boolean^
alter table SEC_USER add DEPARTMENT_CODE varchar(20)^
alter table SEC_USER add ACTIVE_DIRECTORY_ID varchar(255)^

UPDATE SEC_USER SET IS_MOBILE=false^
alter table WF_USER_GROUP add ORGANIZATION_ID uuid^

---------------------------------------------------------------------------------------------------

create table DF_RESERVATION_NUMBER (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    ------------------
    OFFICE_FILE_ID uuid,
    NUMERATOR_ID uuid,
    DOC_ID uuid,
    SHORT_URL_ID uuid,
    ATTACHMENT_ID uuid,
    ORGANIZATION_ID uuid,
    NUMBER varchar(50),
    DATE_RESERV date,
    DATE_REGISTR date,
    STATE integer,
    COMMENT text,
    primary key (ID)
);

alter table DF_RESERVATION_NUMBER add constraint FK_DF_RESERVATION_NUMBER_OFFICE_FILE foreign key (OFFICE_FILE_ID) references DF_OFFICE_FILE(ID);
alter table DF_RESERVATION_NUMBER add constraint FK_DF_RESERVATION_NUMBER_NUMERATOR foreign key (NUMERATOR_ID) references DF_NUMERATOR(ID);
alter table DF_RESERVATION_NUMBER add constraint FK_DF_RESERVATION_NUMBER_DOC foreign key (DOC_ID) references DF_DOC(CARD_ID);
alter table DF_RESERVATION_NUMBER add constraint FK_DF_RESERVATION_NUMBER_ATTACH foreign key (ATTACHMENT_ID) references WF_ATTACHMENT(ID);
alter table DF_RESERVATION_NUMBER add constraint FK_DF_RESERVATION_NUMBER_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION(ID)^

create table TS_OFFICE_FILE_TRANSFER_LOG (
     ID uuid,
     CREATE_TS timestamp,
     CREATED_BY varchar(50),
     VERSION integer,
     UPDATE_TS timestamp,
     UPDATED_BY varchar(50),
     DELETE_TS timestamp,
     DELETED_BY varchar(50),

     ISSUED_BY uuid not null,
     RECEIVER_ID uuid not null,
     OFFICE_FILE_ID uuid not null,
     TRANSFER_DATE date,
     DUE_DATE date,
     RETURN_DATE date,
     COMMENT varchar(1000),
     OVERDUE_NOTIFIED boolean,

     primary key(ID),
     constraint FK_OFTL_RECEIVER foreign key (RECEIVER_ID) references DF_CORRESPONDENT(ID),
     constraint FK_OFTL_OFFICE_FILE foreign key (OFFICE_FILE_ID) references DF_OFFICE_FILE(ID),
     constraint FK_OFTL_ISSUED_BY foreign key (ISSUED_BY) references SEC_USER(ID)
);

---------------------------------------------------------------------------------------------------

create table DF_DOC_KIND_REPORT_REPORT (
    CATEGORY_ID uuid,
    REPORT_ID uuid
);

alter table DF_DOC_KIND_REPORT_REPORT add constraint FK_DOC_KIND_REPORT_DOC_KIND foreign key (CATEGORY_ID) references DF_DOC_KIND(CATEGORY_ID);
alter table DF_DOC_KIND_REPORT_REPORT add constraint FK_DOC_KIND_REPORT_REPORT foreign key (REPORT_ID) references REPORT_REPORT(ID);

---------------------------------------------------------------------------------------------------
create INDEX IDX_SEC_SCREEN_HISTORY_CREATE_TS_USER_ID ON SEC_SCREEN_HISTORY (CREATE_TS, USER_ID)^
---------------------------------------------------------------------------------------------------

create table DF_MEETING_DOC (
    CARD_ID uuid,
    --
    TARGET varchar(500),
    PLACE varchar(500),
    CHAIRMAN_ID uuid,
    SECRETARY_ID uuid,
    INITIATOR_ID uuid,
    DURATION integer,
    STATUS integer,
    TIME_UNIT varchar(1),
    MEETING_COMMENT varchar (1000),
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
    OUTER_ varchar(10000),
    EMAIL varchar(255),
    CONTACT_PERSON_ID uuid,
    MEETING_DOC_ID uuid,
    CONTRACTOR_ID uuid,
    --
    primary key (ID)
);

alter table DF_MEETING_PARTICIPANT add constraint FK_DF_MEETING_PARTICIPANT_USER_ID foreign key (USER_ID) references SEC_USER(ID);
alter table DF_MEETING_PARTICIPANT add constraint FK_DF_MEETING_PARTICIPANT_CONTACT_PERSON_ID foreign key (CONTACT_PERSON_ID) references DF_CONTACT_PERSON(ID);
alter table DF_MEETING_PARTICIPANT add constraint FK_DF_MEETING_PARTICIPANT_MEETING_DOC_ID foreign key (MEETING_DOC_ID) references DF_MEETING_DOC(CARD_ID);
alter table DF_MEETING_PARTICIPANT add constraint FK_DF_MEETING_PARTICIPANT_CONTRACTOR_ID foreign key (CONTRACTOR_ID) references DF_CONTRACTOR(CORRESPONDENT_ID);
create index IDX_DF_MEETING_PARTICIPANT_MEETING_DOC on DF_MEETING_PARTICIPANT (MEETING_DOC_ID);
create index IDX_DF_MEETING_PARTICIPANT_CONTACTOR on DF_MEETING_PARTICIPANT (CONTACT_PERSON_ID);
create index IDX_DF_MEETING_PARTICIPANT_USER on DF_MEETING_PARTICIPANT (USER_ID)^
create index IDX_DF_MEETING_PARTICIPANT_CONTRACTOR on DF_MEETING_PARTICIPANT (CONTRACTOR_ID)^

---------------------------------------------------------------------------------------------------

INSERT INTO "public"."sec_group" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,parent_id) VALUES ('8e6306e2-9e10-414a-b437-24c91ffef804',{ts '2010-02-12 09:47:08.650'},'admin',1,{ts '2010-02-12 09:47:08.650'},null,null,null,'Ограниченный доступ','0fa2b1a5-1d68-4d69-9fbd-dff348347f93')^
INSERT INTO "public"."sec_group" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,parent_id) VALUES ('7dfe5c72-073f-4e1e-9cf4-1b1bad9c0093',{ts '2010-06-10 17:08:08.920'},'admin',2,{ts '2010-06-10 17:09:22.520'},'admin',null,null,'Делопроизводители','0fa2b1a5-1d68-4d69-9fbd-dff348347f93');
INSERT INTO SEC_GROUP (id, create_ts, created_by, version, name, parent_id) VALUES ('8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb', now(), USER, 1, 'Руководитель подразделения', '0fa2b1a5-1d68-4d69-9fbd-dff348347f93');
INSERT INTO SEC_GROUP (id, create_ts, created_by, version, name, parent_id) VALUES ('9fa89a54-9ffa-11e1-b13e-9f4a54bff17e', now(), USER, 1, 'Руководитель департамента', '0fa2b1a5-1d68-4d69-9fbd-dff348347f93');
INSERT INTO "public"."sec_group" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,parent_id) VALUES ('9e44a053-a31f-4edd-b19b-39e942161dd2',{ts '2013-04-03 09:47:08.650'},'admin',1,{ts '2013-04-03 09:47:08.650'},null,null,null,'Ограниченный доступ + все договоры','0fa2b1a5-1d68-4d69-9fbd-dff348347f93')^
INSERT INTO "public"."sec_group" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,parent_id) VALUES ('b3dc60f5-65b2-47ab-8802-9e8929bf8b29',{ts '2013-04-03 09:47:08.650'},'admin',1,{ts '2013-04-03 09:47:08.650'},null,null,null,'Ограниченный доступ + все документы','0fa2b1a5-1d68-4d69-9fbd-dff348347f93')^

INSERT INTO SEC_CONSTRAINT (id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id)
VALUES (newid(), now(), USER, 1, 'tm$Task', ', ts$CardAcl acl', '{E}.id = acl.card.id and (acl.department.id in (:session$departmentIds) or acl.user.id = :session$userId)',
'8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb');
INSERT INTO SEC_CONSTRAINT (id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id)
VALUES (newid(), now(), USER, 1, 'tm$Task', ', ts$CardAcl acl', '{E}.id = acl.card.id and (acl.department.id in (:session$departmentIds) or acl.user.id = :session$userId)',
'9fa89a54-9ffa-11e1-b13e-9f4a54bff17e');
INSERT INTO SEC_CONSTRAINT (id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id)
VALUES (newid(), now(), USER, 1, 'df$Doc', ', ts$CardAcl acl', '{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.department.id in (:session$departmentIds) or acl.global = true)',
'8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb');

INSERT INTO SEC_CONSTRAINT (id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id)
VALUES (newid(), now(), USER, 1, 'df$Doc', ', ts$CardAcl acl', '{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.department.id in (:session$departmentIds) or acl.global = true)',
'9fa89a54-9ffa-11e1-b13e-9f4a54bff17e');

INSERT INTO SEC_CONSTRAINT (id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id)
VALUES (newid(), now(), USER, 1, 'df$SimpleDoc', ', ts$CardAcl acl', '{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.department.id in (:session$departmentIds) or acl.global = true)',
'8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb');
INSERT INTO SEC_CONSTRAINT (id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id)
VALUES (newid(), now(), USER, 1, 'df$SimpleDoc', ', ts$CardAcl acl', '{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.department.id in (:session$departmentIds) or acl.global = true)',
'9fa89a54-9ffa-11e1-b13e-9f4a54bff17e');
INSERT INTO SEC_CONSTRAINT (id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id)
VALUES (newid(), now(), USER, 1, 'df$Contract', ', ts$CardAcl acl', '{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.department.id in (:session$departmentIds) or acl.global = true)',
'8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb');
INSERT INTO SEC_CONSTRAINT (id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id)
VALUES (newid(), now(), USER, 1, 'df$Contract', ', ts$CardAcl acl', '{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.department.id in (:session$departmentIds) or acl.global = true)',
'9fa89a54-9ffa-11e1-b13e-9f4a54bff17e');
INSERT INTO SEC_CONSTRAINT (id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id)
VALUES (newid(), now(), USER, 1, 'df$MeetingDoc', ', ts$CardAcl acl', '{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.department.id in (:session$departmentIds) or acl.global = true)',
'8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb');
INSERT INTO SEC_CONSTRAINT (id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id)
VALUES (newid(), now(), USER, 1, 'df$MeetingDoc', ', ts$CardAcl acl', '{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.department.id in (:session$departmentIds) or acl.global = true)',
'9fa89a54-9ffa-11e1-b13e-9f4a54bff17e');
^
INSERT INTO SEC_CONSTRAINT (id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id)
VALUES (newid(), now(), USER, 1, 'tm$TaskGroup', 'left join {E}.taskGroupTasks tgt', '({E}.subCreator.id=:session$userId OR ({E}.global = true AND {E}.template=true)
OR tgt.task.id in (select t.id from tm$Task t left join t.roles r  where t.substitutedCreator.id =
:session$userId OR r.user.id in (:session$departmentMembersIds)))',
'8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb');

INSERT INTO SEC_CONSTRAINT (id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id)
VALUES (newid(), now(), USER, 1, 'tm$TaskGroup', 'left join {E}.taskGroupTasks tgt', '({E}.subCreator.id=:session$userId OR ({E}.global = true AND {E}.template=true)
OR tgt.task.id in (select t.id from tm$Task t left join t.roles r  where t.substitutedCreator.id =
:session$userId OR r.user.id in (:session$departmentMembersIds)))',
'9fa89a54-9ffa-11e1-b13e-9f4a54bff17e');

INSERT INTO SEC_CONSTRAINT (id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id)
VALUES (newid(), now(), USER, 1, 'tm$TaskPattern',', ts$CardAcl acl','{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)',
'9fa89a54-9ffa-11e1-b13e-9f4a54bff17e');

INSERT INTO SEC_CONSTRAINT (id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id)
VALUES (newid(), now(), USER, 1, 'tm$TaskPattern',', ts$CardAcl acl','{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)',
'8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb');

UPDATE SEC_GROUP SET NAME='Полный доступ' where id = '0fa2b1a5-1d68-4d69-9fbd-dff348347f93'^

INSERT INTO "public"."sec_group_hierarchy" (id,create_ts,created_by,group_id,parent_id,hierarchy_level) VALUES ('4d37ce8d-09fe-419b-9c25-228240750c90',{ts '2010-02-12 09:47:08.650'},'admin','8e6306e2-9e10-414a-b437-24c91ffef804','0fa2b1a5-1d68-4d69-9fbd-dff348347f93',0)^
INSERT INTO "public"."sec_group_hierarchy" (id,create_ts,created_by,group_id,parent_id,hierarchy_level) VALUES ('f1bd8b8b-92d8-4bb1-9e6e-0187ae57f60c',{ts '2010-06-10 17:08:09.160'},'admin','7dfe5c72-073f-4e1e-9cf4-1b1bad9c0093','0fa2b1a5-1d68-4d69-9fbd-dff348347f93',0);

INSERT INTO sec_group_hierarchy (id,create_ts,created_by,group_id,parent_id,hierarchy_level)
VALUES (newid(), {ts '2010-02-12 09:47:08.650'}, 'admin', '9fa89a54-9ffa-11e1-b13e-9f4a54bff17e','0fa2b1a5-1d68-4d69-9fbd-dff348347f93',0);

INSERT INTO sec_group_hierarchy (id,create_ts,created_by,group_id,parent_id,hierarchy_level)
VALUES (newid(), {ts '2010-02-12 09:47:08.650'}, 'admin', '8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb', '0fa2b1a5-1d68-4d69-9fbd-dff348347f93',0);

INSERT INTO sec_group_hierarchy (id,create_ts,created_by,group_id,parent_id,hierarchy_level)
VALUES ('4d37ce8d-09fe-419b-9c25-228240750c91',{ts '2013-04-03 09:47:08.650'},'admin','b3dc60f5-65b2-47ab-8802-9e8929bf8b29','0fa2b1a5-1d68-4d69-9fbd-dff348347f93',0)^

INSERT INTO sec_group_hierarchy (id,create_ts,created_by,group_id,parent_id,hierarchy_level)
VALUES ('4d37ce8d-09fe-419b-9c25-228240750c92',{ts '2013-04-03 09:47:08.650'},'admin','9e44a053-a31f-4edd-b19b-39e942161dd2','0fa2b1a5-1d68-4d69-9fbd-dff348347f93',0)^


INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('18190d06-fc17-482a-8f73-a47df9b97263',{ts '2010-06-08 16:22:33.800'},'admin',3,{ts '2010-06-10 18:42:01.850'},'admin',null,null,'df$SimpleDoc',', ts$CardAcl acl','{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)','8e6306e2-9e10-414a-b437-24c91ffef804');
INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('589212af-c2cb-ee71-6029-e742d0935ed8',{ts '2010-06-08 16:22:33.800'},'admin',3,{ts '2010-06-10 18:42:01.850'},'admin',null,null,'df$MeetingDoc',', ts$CardAcl acl','{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)','8e6306e2-9e10-414a-b437-24c91ffef804');
INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('22581acc-acff-4d58-bc8d-ffaea3dd01fa',{ts '2010-06-08 17:53:02.610'},'admin',2,{ts '2010-06-10 18:41:27.100'},'admin',null,null,'df$Doc',', ts$CardAcl acl','{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)','8e6306e2-9e10-414a-b437-24c91ffef804');
INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('433c5a9a-991f-454c-a064-861a74a66c88',{ts '2010-06-10 17:08:50.220'},'admin',4,{ts '2010-06-10 18:47:20.500'},'admin',null,null,'tm$Task',', ts$CardAcl acl','{E}.id = acl.card.id and acl.user.id = :session$userId','7dfe5c72-073f-4e1e-9cf4-1b1bad9c0093');
INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('7231c87a-2872-4d9a-8167-2f075055f37c',{ts '2010-06-08 16:19:38.700'},'admin',3,{ts '2010-06-10 18:41:49.210'},'admin',null,null,'df$Contract',', ts$CardAcl acl','{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)','8e6306e2-9e10-414a-b437-24c91ffef804');
INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('bcb90482-e02a-42f3-b936-a40b28b5963a',{ts '2010-02-12 09:49:51.740'},'admin',5,{ts '2010-06-10 18:41:40.300'},'admin',null,null,'tm$Task',', ts$CardAcl acl','{E}.id = acl.card.id and acl.user.id = :session$userId','8e6306e2-9e10-414a-b437-24c91ffef804');
INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('cbd897a2-5c4d-4b84-a613-6393c435cbcc',null,'admin',2,{ts '2010-06-10 18:42:09.970'},'admin',null,null,'sec$User',null,'{E}.createdBy is not null','0fa2b1a5-1d68-4d69-9fbd-dff348347f93');
INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id)
SELECT 'edda0d21-3aa0-40df-8100-19444d75535c', now(),'admin', 1,now(), 'admin',null,null, 'tm$TaskPattern',', ts$CardAcl acl','{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)', '7dfe5c72-073f-4e1e-9cf4-1b1bad9c0093'
FROM "public"."sec_group" where id = '7dfe5c72-073f-4e1e-9cf4-1b1bad9c0093';
INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('cb37a982-a1fe-4082-b0ea-440f4211af8d', now(),'admin', 1,now(), 'admin',null,null, 'tm$TaskPattern',', ts$CardAcl acl','{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)', '8e6306e2-9e10-414a-b437-24c91ffef804');

INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('7b87c520-5c2e-11e0-a770-b3d23ae5dd33',now(),'admin',1,now(),'admin',null,null,'tm$TaskGroup','left join {E}.taskGroupTasks tgt left join {E}.participants p',
'({E}.subCreator.id = :session$userId
or p.id = :session$userId
or {E}.chairman.id = :session$userId
or {E}.secretary.id = :session$userId
or {E}.initiator.id = :session$userId
or exists (select c from wf$CardRole c where c.card = tgt.task and c.user.id = :session$userId and c.deleteTs is null) or  ({E}.template = true AND {E}.global = true  ))',
'8e6306e2-9e10-414a-b437-24c91ffef804');


INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id)
SELECT '86c0ba0a-5c2e-11e0-b52d-0f8fb8df9d93', now(),'admin', 1,now(), 'admin',null,null, 'tm$TaskGroup','left join {E}.taskGroupTasks tgt left join {E}.participants p',
'({E}.subCreator.id = :session$userId
or p.id = :session$userId
or {E}.chairman.id = :session$userId
or {E}.secretary.id = :session$userId
or {E}.initiator.id = :session$userId
or exists (select c from wf$CardRole c where c.card = tgt.task and c.user.id = :session$userId and c.deleteTs is null) or  ({E}.global = true  ))',
'7dfe5c72-073f-4e1e-9cf4-1b1bad9c0093'
FROM "public"."sec_group" where id = '7dfe5c72-073f-4e1e-9cf4-1b1bad9c0093';


INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('51dd3fc6-ba93-467c-807b-ea5120721baf',{ts '2013-04-03 16:19:38.700'},'admin',3,{ts '2013-04-03 18:41:49.210'},'admin',null,null,'df$Contract',', ts$CardAcl acl','{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)','b3dc60f5-65b2-47ab-8802-9e8929bf8b29');
INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('9466d7c9-66a2-412b-5579-2be06a97b136',{ts '2010-06-08 16:22:33.800'},'admin',3,{ts '2010-06-10 18:42:01.850'},'admin',null,null,'df$MeetingDoc',', ts$CardAcl acl','{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)','b3dc60f5-65b2-47ab-8802-9e8929bf8b29');
INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('3f520104-d798-479c-9b93-04b16a99ff62',{ts'2013-04-03 17:53:02.610'},'admin',2,{ts'2013-04-03 18:41:27.100','admin'},null,null,'df$Doc',', ts$CardAcl acl','(({E}.id = acl.card.id and (TYPE({E}) in (:session$simpleDocEffectiveClass) or TYPE({E}) in (:session$meetingDocEffectiveClass))) or ({E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true) and TYPE({E}) in (:session$contractEffectiveClass)))','b3dc60f5-65b2-47ab-8802-9e8929bf8b29');
INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('3f520104-c1d0-4877-a331-522a53a372b3',{ts '2013-04-03 09:49:51.740'},'admin',5,{ts '2013-04-03 18:41:40.300'},'admin',null,null,'tm$Task',', ts$CardAcl acl','{E}.id = acl.card.id and acl.user.id = :session$userId','b3dc60f5-65b2-47ab-8802-9e8929bf8b29');

insert into SEC_CONSTRAINT (ID,CREATE_TS,CREATED_BY,VERSION, ENTITY_NAME,JOIN_CLAUSE,WHERE_CLAUSE,GROUP_ID) values ('0550da4d-de10-4d36-9d5e-a57f043e83c3', CURRENT_TIMESTAMP, USER, 1, 'df$TypicalResolution', null, '({E}.global = true OR {E}.substitutedCreator.id = :session$userId)', 'b3dc60f5-65b2-47ab-8802-9e8929bf8b29')^

INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('c3096def-c3eb-4580-b9e6-da6a71407f50', now(),'admin', 1,now(), 'admin',null,null, 'tm$TaskPattern',', ts$CardAcl acl','{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)', 'b3dc60f5-65b2-47ab-8802-9e8929bf8b29');

INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('8c876c9a-d973-43ed-8837-b01a8219146d',now(),'admin',1,now(),'admin',null,null,'tm$TaskGroup','left join {E}.taskGroupTasks tgt left join {E}.participants p',
'({E}.subCreator.id = :session$userId
or p.id = :session$userId
or {E}.chairman.id = :session$userId
or {E}.secretary.id = :session$userId
or {E}.initiator.id = :session$userId
or exists (select c from wf$CardRole c where c.card = tgt.task and c.user.id = :session$userId and c.deleteTs is null) or  ({E}.template = true AND {E}.global = true  ))',
'b3dc60f5-65b2-47ab-8802-9e8929bf8b29');


INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('f79f52d4-d71b-4270-9c3d-72cbc37a32fb',{ts '2013-04-03 16:22:33.800'},'admin',3,{ts '2013-04-03 18:42:01.850'},'admin',null,null,'df$SimpleDoc',', ts$CardAcl acl','{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)','9e44a053-a31f-4edd-b19b-39e942161dd2');
INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('9efe6868-855e-e9f0-eca6-6f6c6931633e',{ts '2013-04-03 16:22:33.800'},'admin',3,{ts '2013-04-03 18:42:01.850'},'admin',null,null,'df$MeetingDoc',', ts$CardAcl acl','{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)','9e44a053-a31f-4edd-b19b-39e942161dd2');
INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('99961b6f-d798-479c-9b93-04b16a99ff62',{ts '2013-04-03 17:53:02.610'},'admin',2,{ts '2013-04-03 18:41:27.100'},'admin',null,null,'df$Doc',', ts$CardAcl acl','(({E}.id = acl.card.id and TYPE({E}) in (:session$contractEffectiveClass)) or ({E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true) and (TYPE({E}) in (:session$simpleDocEffectiveClass) or TYPE({E}) in (:session$meetingDocEffectiveClass))))','9e44a053-a31f-4edd-b19b-39e942161dd2');
INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('a4fd0af5-9884-4076-97fd-aa291cdaba13',{ts '2013-04-03 09:49:51.740'},'admin',5,{ts '2013-04-03 18:41:40.300'},'admin',null,null,'tm$Task',', ts$CardAcl acl','{E}.id = acl.card.id and acl.user.id = :session$userId','9e44a053-a31f-4edd-b19b-39e942161dd2');
insert into SEC_CONSTRAINT (ID,CREATE_TS,CREATED_BY,VERSION, ENTITY_NAME,JOIN_CLAUSE,WHERE_CLAUSE,GROUP_ID) values ('66676c34-c087-448f-999e-9962b291982b', CURRENT_TIMESTAMP, USER, 1, 'df$TypicalResolution', null, '({E}.global = true OR {E}.substitutedCreator.id = :session$userId)', '9e44a053-a31f-4edd-b19b-39e942161dd2')^

INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('70170bc4-1b83-4829-b51c-17c19cf7c6db', now(),'admin', 1,now(), 'admin',null,null, 'tm$TaskPattern',', ts$CardAcl acl','{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)', '9e44a053-a31f-4edd-b19b-39e942161dd2');

INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('b9647fb6-33a6-4240-a07d-c63eb19e5e1d',now(),'admin',1,now(),'admin',null,null,'tm$TaskGroup','left join {E}.taskGroupTasks tgt left join {E}.participants p',
'({E}.subCreator.id = :session$userId
or p.id = :session$userId
or {E}.chairman.id = :session$userId
or {E}.secretary.id = :session$userId
or {E}.initiator.id = :session$userId
or exists (select c from wf$CardRole c where c.card = tgt.task and c.user.id = :session$userId and c.deleteTs is null) or  ({E}.template = true AND {E}.global = true  ))',
'9e44a053-a31f-4edd-b19b-39e942161dd2');

--insert into SEC_USER (ID, CREATE_TS, VERSION, LOGIN, LOGIN_LC, PASSWORD, NAME, GROUP_ID, ACTIVE)
--values ('0bc7263e-e4a2-4137-a4d8-a9e225e8ac84', current_timestamp, 0, 'SchedulerUser', 'scheduleruser', '7e0ffe513f4e8c8f1376da12fe9c5561', '', '0fa2b1a5-1d68-4d69-9fbd-dff348347f93', true)^

update sec_user set created_by='admin', language_='ru' where login='admin'^

INSERT INTO "public"."sec_role" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('0038f3db-ac9c-4323-83e7-356996cc63ae',{ts '2010-02-12 14:19:19.810'},'admin',2,{ts '2010-03-09 09:56:21.940'},'admin',null,null,'ReferenceEditor','Редактирование справочников','Роль, предоставляющая доступ к редактированию справочников',null);
INSERT INTO "public"."sec_role" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('3c9abffb-2fae-484e-990c-343b3c1197ca',{ts '2010-04-15 13:01:51.520'},'admin',2,{ts '2010-05-05 16:11:31.440'},'admin',null,null,'doc_initiator','Инициатор документов','Роль, предоставляющая права создания документов/договоров и запуска процессов',null);
INSERT INTO "public"."sec_role" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('47135f12-071b-43d8-bc21-2ff77cd08fb6',{ts '2010-04-15 13:02:03.350'},'admin',1,{ts '2010-04-15 13:02:03.350'},null,null,null,'doc_endorsement','Согласующий','Роль дает возможность согласования документов/договоров',null);
INSERT INTO "public"."sec_role" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('64fec164-5408-4e48-9e72-5a1d214c533e',{ts '2010-01-26 10:17:40.740'},'admin',2,{ts '2010-03-09 09:55:59.500'},'admin',null,null,'task_observer','Наблюдатель','Роль дает возможность получать уведомления по текущему состоянию задачи',null);
INSERT INTO "public"."sec_role" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('7091f5ef-a77a-450a-834a-39406885676e',{ts '2010-05-04 15:52:31.430'},'admin',1,{ts '2010-05-04 15:52:31.430'},null,null,null,'doc_secretary','Делопроизводитель','Роль дает возможность работы с канцелярией, позволяет регистрировать документы',null);
INSERT INTO "public"."sec_role" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('7a35c6f8-6a2d-4347-a8c2-3bc887e23c83',{ts '2010-01-26 10:17:16.500'},'admin',3,{ts '2010-03-09 09:55:45.410'},'admin',null,null,'task_initiator','Инициатор задач','Выступает инициатором процесса выполнения задачи, а также осуществляет отправку ее на выполнение',null);
INSERT INTO "public"."sec_role" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('96fa7fe9-397d-4bac-b14a-eec2d94de68c',{ts '2010-02-12 14:17:14.630'},'admin',3,{ts '2010-03-09 09:56:55.120'},'admin',null,null,'SimpleUser','Запрещающая роль','Эта роль должна быть назначена всем пользователям кроме администраторов',true);
INSERT INTO "public"."sec_role" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('af439810-0f11-4a21-b239-7df2df83bbc6',{ts '2010-01-26 10:17:29.300'},'admin',2,{ts '2010-03-09 09:55:52.660'},'admin',null,null,'task_controller','Контролёр','Осуществляет контроль выполнения задачи и, при необходимости, отправку задачи на доработку',null);
INSERT INTO "public"."sec_role" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('c06c0cee-2f21-4241-8d6f-76b4cd462f96',{ts '2010-04-15 13:02:15.970'},'admin',1,{ts '2010-04-15 13:02:15.970'},null,null,null,'doc_approver','Утверждающий','Роль дает возможность утверждения документов/договоров в завершении процесса согласования',null);
INSERT INTO "public"."sec_role" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('c0e15ca3-1791-4e52-9882-c88fd72fbac1',{ts '2010-01-26 10:17:22.890'},'admin',2,{ts '2010-03-09 09:55:37.610'},'admin',null,null,'task_executor','Исполнитель','Осуществляет выполнение задачи',null);
INSERT INTO "public"."sec_role" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('f7ff1ec7-802d-4a42-a7db-1a97e17f893f',{ts '2010-02-12 14:30:21.0'},'admin',2,{ts '2010-03-09 09:57:02.200'},'admin',null,null,'task_creator','Создание задач','Роль дает возможность создания задач',null);
INSERT INTO "public"."sec_role" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('e41f5aa2-3296-4fdc-906e-af2f8660f806',{ts '2010-05-06 11:33:14.520'},'admin',1,{ts '2010-05-06 11:33:14.520'},null,null,null,'doc_acquaintance','Ознакомление с документами','Роль дает возможность ознакомления с документами/договорами',null);
insert into SEC_ROLE (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('5115e833-4146-4c98-a119-1c06053adb92',now(),'admin',1,now(),null,null,null,'schedule_task_creator','Создание периодических задач','Роль, позволяющая создавать периодические задания',null);
INSERT INTO SEC_ROLE (ID, CREATE_TS, CREATED_BY, VERSION, NAME, LOC_NAME,DESCRIPTION) VALUES ('5cd3839e-781b-487f-8810-4091943da63b', now(), USER, 1, 'DepartmentChief', 'Руководитель департамента','Эта роль выдается только совместно с группой доступа «Руководитель департамента». У пользователя с этой ролью в карточке сотрудника должно быть заполнено подразделение');
INSERT INTO SEC_ROLE (ID, CREATE_TS, CREATED_BY, VERSION, NAME, LOC_NAME,DESCRIPTION) VALUES ('2ba2e5ca-a00d-11e1-82a7-832770c8a361', now(), USER, 1, 'SubdivisionChief', 'Руководитель подразделения','Эта роль выдается только совместно с группой доступа «Руководитель подразделения». У пользователя с этой ролью в карточке сотрудника должно быть заполнено подразделение');
INSERT INTO "public"."sec_role" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('b6a03cd4-0479-11e1-b6c9-77dd813b99ee',now(),'admin',1,now(),null,null,null,'UserSubstitutionEditor','Редактирование замещений пользователей','Роль предоставляет возможность редактирования справочника «Замещение пользователей»',null);
INSERT INTO "public"."sec_role" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('e8b73444-cb05-11e2-b014-d7054a634646',now(),'admin',1,now(),null,null,null,'AppIntegrationRole','Доступ к функциям модуля интеграции с учётными системами','Позволяет отмечать справочники и данные к выгрузке в сторонние учётные системы',null);
insert into SEC_ROLE (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('ae883bce-0a34-11e3-a7e0-a702ae87dd8a',current_timestamp,'admin',1,current_timestamp,null,null,null,'doc_publisher','Публикация документов на портале','Роль, позволяющая публиковать документы на портале',null);
insert into SEC_ROLE (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('80145594-f020-e85c-d259-7a293c035495',current_timestamp,'admin',1,current_timestamp,null,null,null,'meetingdoc_creator','Работа с совещаниями','Роль, предоставляющая права для работы с совещаниями',null);
insert into SEC_ROLE (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES (newId(),current_timestamp,'admin',1,current_timestamp,null,null,null,'PortalIntegrationRole','Интеграция с порталом','Пользователь с данной ролью может быть авторизован в Тезис через веб-сервис интеграции с порталом',null);
update sec_role set description='Роль, предоставляющая права администрирования системы', loc_name='' where name='Administrators';

update SEC_ROLE set ROLE_TYPE = 0 where ROLE_TYPE = 10;

insert into SEC_PERMISSION (id, PERMISSION_TYPE, target, value, role_id) values (newid(), 10, 'tm$TaskGroupPattern.browse', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c');
insert into SEC_PERMISSION (id, PERMISSION_TYPE, target, value, role_id) values (newid(), 10, 'tm$TaskGroupPattern.browse', 1, 'f7ff1ec7-802d-4a42-a7db-1a97e17f893f');

INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('03d2edc0-f719-46c8-ad23-2733972ae7eb',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$Organization:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('040080dd-de10-4da6-94fb-abe9b1904354',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$ContactPerson:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('04c8b296-23aa-46f4-b7cc-95057c50d9e5',{ts '2010-04-22 15:51:05.480'},'admin',1,{ts '2010-04-22 15:51:05.480'},null,null,null,20,'tm$Project:update',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('0524e14c-6de0-40cf-821a-98d940dc5f15',{ts '2010-02-12 14:26:07.790'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'sec$EntityLogAttr:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('063d155d-b4dd-4546-9fad-821e8e7adf59',{ts '2010-02-12 14:26:07.790'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.330'},'admin',20,'sec$Filter:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('06581140-32e6-4160-a7ef-8c2891d71f60',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$SimpleDoc:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('0c403de9-e5a7-45eb-9972-039e3ec61b46',{ts '2010-04-22 15:49:22.100'},'admin',1,{ts '2010-04-22 15:49:22.100'},null,null,null,20,'df$ContactPerson:create',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('0c704a9b-e639-4f2c-a1b2-41e1aab84efa',{ts '2010-02-12 14:28:46.970'},'admin',1,{ts '2010-02-12 14:28:46.970'},null,null,null,20,'wf$Proc:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('0cc259eb-9947-4ece-960a-eb6f3035e8bf',{ts '2010-02-12 14:26:07.790'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.330'},'admin',20,'sec$Filter:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('0e28713c-dfd0-4aa8-be3e-83b75ec209bc',{ts '2010-04-22 15:49:22.100'},'admin',1,{ts '2010-04-22 15:49:22.100'},null,null,null,20,'df$BankRegion:delete',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('0e52d28c-c8fe-4f19-80a1-ae6fa72f6c55',{ts '2010-02-12 14:26:07.790'},'admin',1,{ts '2010-02-12 14:26:07.790'},null,null,null,20,'sec$Group:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('0f899f19-b28b-4099-b9ec-0d163d7c298d',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$Organization:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('0fdf8f69-6f8b-4d08-b798-aa4b4a59140e',{ts '2010-02-12 14:29:39.800'},'admin',1,{ts '2010-02-12 14:29:39.800'},null,null,null,20,'tm$TaskPatternGroup:delete',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('12c573f2-59eb-4080-a5cf-2e41d20525b3',{ts '2010-02-12 14:29:39.800'},'admin',1,{ts '2010-02-12 14:29:39.800'},null,null,null,20,'tm$TaskPattern:create',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('146861c6-e399-4c3c-bb5f-8bf13aa36cff',{ts '2010-02-12 14:29:39.800'},'admin',1,{ts '2010-02-12 14:29:39.800'},null,null,null,20,'tm$TaskPatternGroup:create',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('14bd9af2-0874-447d-9b83-01eaae43372d',{ts '2010-04-22 15:44:40.800'},'admin',1,{ts '2010-04-22 15:44:40.800'},null,null,null,20,'df$SimpleDoc:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('160fd260-8f48-42bb-b9cd-d8c0f25313c5',{ts '2010-02-12 14:28:46.970'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'wf$CardRole:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('17052036-8455-48e0-912d-0078314ae2cb',{ts '2010-02-12 14:26:07.790'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.330'},'admin',20,'sec$Filter:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('184c689b-2247-4a75-8d2d-f481497924ea',{ts '2010-02-12 14:28:46.970'},'admin',1,{ts '2010-02-12 14:28:46.970'},null,null,null,20,'tm$TaskType:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('18c4f80f-430d-407d-bf20-4815dd106a5a',{ts '2010-02-12 14:28:46.950'},'admin',2,{ts '2010-02-12 14:42:33.550'},'admin',{ts '2010-02-12 14:42:33.550'},'admin',20,'tm$Task:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('18f46248-125d-41f2-bae5-ea360590aaf5',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$Department:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('19c92720-ef9e-4509-a46a-d9d8da4da445',{ts '2010-04-22 15:49:22.100'},'admin',1,{ts '2010-04-22 15:49:22.100'},null,null,null,20,'df$Currency:update',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('1a4310a2-aee7-43ee-b480-bb89c773e45d',{ts '2010-02-12 14:26:07.790'},'admin',1,{ts '2010-02-12 14:26:07.790'},null,null,null,20,'tm$TaskPatternGroup:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('1a5bd675-6992-462c-8c1b-fcf6ee1557fe',{ts '2010-02-12 14:28:46.950'},'admin',1,{ts '2010-02-12 14:28:46.950'},null,null,null,20,'tm$TaskGroup:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('1aa5b567-a1d1-4e32-916e-6144d8d33287',{ts '2010-04-22 15:44:40.800'},'admin',1,{ts '2010-04-22 15:44:40.800'},null,null,null,20,'df$Doc:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('1b3f5620-9e0f-490e-b30e-bef4baa667d1',{ts '2010-02-12 14:26:07.790'},'admin',1,{ts '2010-02-12 14:26:07.790'},null,null,null,20,'sec$Constraint:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('1b588fb3-3e52-43ae-a290-228985faf49d',{ts '2010-02-12 14:26:07.780'},'admin',1,{ts '2010-02-12 14:26:07.780'},null,null,null,20,'tm$Priority:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('1b738995-c1e4-4e61-9c13-937a24b3d184',{ts '2010-04-22 15:49:22.100'},'admin',1,{ts '2010-04-22 15:49:22.100'},null,null,null,20,'df$OrganizationAccount:create',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('1c0f37da-185b-4e5e-9095-b1043edea663',{ts '2010-02-12 14:26:07.790'},'admin',1,{ts '2010-02-12 14:26:07.790'},null,null,null,20,'sec$UserRole:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('1c8ab95f-a208-4e2e-bb43-16c2c1445cfc',{ts '2010-02-12 14:28:46.970'},'admin',1,{ts '2010-02-12 14:28:46.970'},null,null,null,20,'wf$Card:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('1d7e666e-9977-42d5-a1a1-b80619e8dbb9',{ts '2010-02-12 14:28:46.950'},'admin',1,{ts '2010-02-12 14:28:46.950'},null,null,null,20,'tm$Task:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('1e1be93b-dcd6-43b2-b486-7bddd18e3fcb',{ts '2010-04-22 14:16:30.170'},'admin',1,{ts '2010-04-22 14:16:30.170'},null,null,null,20,'tm$ProjectGroup:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('1f683059-d1b7-4af9-b6e4-ada57850173f',{ts '2010-02-12 14:30:21.0'},'admin',1,{ts '2010-02-12 14:30:21.0'},null,null,null,20,'tm$TaskGroup:delete',1,'f7ff1ec7-802d-4a42-a7db-1a97e17f893f');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('20009a84-71da-4e75-b773-ee2753b01499',{ts '2010-02-12 14:28:46.970'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'wf$Attachment:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('21399623-68d9-480c-8bd8-4978622f4c1a',{ts '2010-02-12 14:26:07.780'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'core$FileDescriptor:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('214b52bf-9ef9-4953-ba28-e9341a13876b',{ts '2010-04-22 15:44:40.800'},'admin',1,{ts '2010-04-22 15:44:40.800'},null,null,null,20,'df$DocType:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('219317fc-5d65-4c48-b0a2-5b698287b095',{ts '2010-04-22 15:54:00.350'},'admin',1,{ts '2010-04-22 15:54:00.350'},null,null,null,20,'df$DocType:delete',1,'0c018061-b26f-4de2-a5be-dff348347f93');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('2252ac9b-5694-45f3-9cbc-98e524178e94',{ts '2010-04-22 15:49:22.100'},'admin',1,{ts '2010-04-22 15:49:22.100'},null,null,null,20,'df$OrganizationAccount:delete',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('22df48be-c993-4c62-8359-cc2da3474e2e',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$Employee:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('236dd34d-dbb7-4dc9-b86c-ce8caebb8dcb',{ts '2010-02-12 14:30:21.0'},'admin',1,{ts '2010-02-12 14:30:21.0'},null,null,null,20,'tm$TaskGroup:create',1,'f7ff1ec7-802d-4a42-a7db-1a97e17f893f');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('24586f05-1768-4cf1-89ad-9c999fdfa0dd',{ts '2010-02-12 14:26:07.790'},'admin',1,{ts '2010-02-12 14:26:07.790'},null,null,null,20,'sec$UserSubstitution:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('259b30c1-40fa-40ca-992b-58d9d34c1d1d',{ts '2010-02-12 14:28:46.970'},'admin',1,{ts '2010-02-12 14:28:46.970'},null,null,null,20,'tm$TaskPattern:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('2827fd41-b4ee-4180-a580-0da4833be689',{ts '2010-02-12 14:28:46.970'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'wf$CardAttachment:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('28f7632a-9cc8-4bd3-ad44-4fb97f3c3e48',{ts '2010-04-22 15:39:04.800'},'admin',1,{ts '2010-04-22 15:39:04.800'},null,null,null,20,'tm$Project:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('294576ea-8588-438b-8578-bde2da5b18a1',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$OrganizationAccount:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('295784cb-0b54-4695-84de-07d14626d141',{ts '2010-04-22 15:44:40.800'},'admin',1,{ts '2010-04-22 15:44:40.800'},null,null,null,20,'df$BankRegion:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('29b71b91-4a26-4279-b9b7-3a0b9e41415b',{ts '2010-04-22 15:39:04.800'},'admin',1,{ts '2010-04-22 15:39:04.800'},null,null,null,20,'tm$Project:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('2a655b28-1123-4339-8bc7-e0441a396ad0',{ts '2010-04-22 16:00:04.550'},'admin',1,{ts '2010-04-22 16:00:04.550'},null,null,null,20,'df$Contract:update',1,'3c9abffb-2fae-484e-990c-343b3c1197ca');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('2aa14a32-ef94-4cf3-bbd3-18b6b468c9d2',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$Currency:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('2aa3bf91-60f3-4156-a2d2-f04d04f3851c',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$BankRegion:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('2b83d8af-8658-46f9-8577-3fa7d7ba7ab3',{ts '2010-04-22 15:49:22.900'},'admin',1,{ts '2010-04-22 15:49:22.900'},null,null,null,20,'df$Bank:delete',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('2b9d20e6-15f5-4136-8547-30b87b8d0f6d',{ts '2010-02-12 14:26:07.790'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'sec$LoggedEntity:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('2beceea5-4739-4239-afa2-42ef7b4f1d32',{ts '2010-04-22 15:44:40.800'},'admin',1,{ts '2010-04-22 15:44:40.800'},null,null,null,20,'df$Employee:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('2d7ebeda-c726-4612-adc6-17057358954e',{ts '2010-04-22 14:17:14.490'},'admin',1,{ts '2010-04-22 14:17:14.490'},null,null,null,20,'tm$ProjectGroup:create',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('2e1c79ed-f4e8-43fe-97cf-bd58737e845e',{ts '2010-04-22 15:49:22.100'},'admin',1,{ts '2010-04-22 15:49:22.100'},null,null,null,20,'df$Company:update',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('30225f86-cef1-441c-918c-895e46fdb00e',{ts '2010-02-12 14:26:07.790'},'admin',1,{ts '2010-02-12 14:26:07.790'},null,null,null,20,'sys$Server:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('310cdc11-56bd-4833-a525-acfa23cbcafb',{ts '2010-02-12 14:28:46.950'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'wf$Attachment:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('34947b96-0107-4b45-9352-a1e9bd0dbe86',{ts '2010-02-12 14:26:07.790'},'admin',1,{ts '2010-02-12 14:26:07.790'},null,null,null,20,'sec$User:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('34e55894-9244-4382-80d3-29cef3e5af06',{ts '2010-02-12 14:17:14.630'},'admin',1,{ts '2010-02-12 14:17:14.630'},null,null,null,10,'core$FileDescriptor.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('35270635-f34c-4c84-9eb2-e23ab550a82a',{ts '2010-02-12 14:28:46.970'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'wf$AssignmentAttachment:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('357a4c32-dbd2-4ac6-a56c-d95736735f40',{ts '2010-04-22 16:00:04.550'},'admin',1,{ts '2010-04-22 16:00:04.550'},null,null,null,20,'df$Contract:delete',1,'3c9abffb-2fae-484e-990c-343b3c1197ca');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('371e9f06-be54-4bae-a6b7-398a55bfffb0',{ts '2010-02-12 14:28:46.970'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'tm$TaskVersion:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('38ae98c1-c3c6-440c-bb16-ff47980beee1',{ts '2010-02-12 14:28:46.950'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'wf$Attachment:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('3a268169-8e24-4050-bba2-57be5a6da52d',{ts '2010-02-12 14:26:07.790'},'admin',1,{ts '2010-02-12 14:26:07.790'},null,null,null,20,'sys$Server:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('3cba8b80-5e64-4726-9f04-1157a11baa3c',{ts '2010-02-12 14:26:07.780'},'admin',1,{ts '2010-02-12 14:26:07.780'},null,null,null,20,'tm$Priority:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('3dea826c-8bd8-4cd0-b139-83dae3f86a2e',{ts '2010-02-12 14:26:07.790'},'admin',1,{ts '2010-02-12 14:26:07.790'},null,null,null,20,'sys$Server:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('3e5424e1-ff17-4935-b524-059542815b31',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$OrganizationAccount:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('3ef9cadc-67e5-4129-9168-2f0c9542c93d',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$OrganizationAccount:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('3f3acc24-636b-4f11-8507-664516371369',{ts '2010-02-12 14:26:07.790'},'admin',1,{ts '2010-02-12 14:26:07.790'},null,null,null,20,'sec$User:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');

INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('40603f8b-eeba-44ac-9370-360b7ab5e6d0',{ts '2010-04-22 15:54:00.350'},'admin',1,{ts '2010-04-22 15:54:00.350'},null,null,null,20,'df$DocKind:update',1,'0c018061-b26f-4de2-a5be-dff348347f93');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('40686888-182e-417b-b66b-c1305dff252e',{ts '2010-02-12 14:26:07.790'},'admin',1,{ts '2010-02-12 14:26:07.790'},null,null,null,20,'sec$Role:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('419964d5-6a41-4e36-bfd8-949f4bb048ad',{ts '2010-04-22 15:54:00.350'},'admin',1,{ts '2010-04-22 15:54:00.350'},null,null,null,20,'df$DocKind:delete',1,'0c018061-b26f-4de2-a5be-dff348347f93');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('44211e79-4f15-4828-a10c-6fd4c1f0b9f3',{ts '2010-02-12 14:28:46.950'},'admin',1,{ts '2010-02-12 14:28:46.950'},null,null,null,20,'wf$DefaultProcActor:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('44ccfb20-a6b1-42f2-9d2c-8a5994ae4ba2',{ts '2010-02-12 14:28:46.970'},'admin',1,{ts '2010-02-12 14:28:46.970'},null,null,null,20,'tm$TaskType:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('46971016-3573-4a59-9e8b-f1ed70c76f35',{ts '2010-02-12 14:28:46.950'},'admin',1,{ts '2010-02-12 14:28:46.950'},null,null,null,20,'wf$ProcRole:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('46a3147d-7c7e-4fd3-9d7c-7563996b4dc3',{ts '2010-02-12 14:26:07.790'},'admin',1,{ts '2010-02-12 14:26:07.790'},null,null,null,20,'sec$Role:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('46b51bb8-d06b-4cea-8b0c-b299d1bf1764',{ts '2010-04-22 15:49:22.900'},'admin',1,{ts '2010-04-22 15:49:22.900'},null,null,null,20,'df$Organization:update',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('485d31b9-1127-44f6-a148-701787b39427',{ts '2010-04-22 16:00:04.550'},'admin',1,{ts '2010-04-22 16:00:04.550'},null,null,null,20,'df$Contract:create',1,'3c9abffb-2fae-484e-990c-343b3c1197ca');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('498df478-960c-4683-b3eb-aba8a5108412',{ts '2010-02-12 14:26:07.780'},'admin',1,{ts '2010-02-12 14:26:07.780'},null,null,null,20,'tm$Priority:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('4a3e9c99-e490-4a64-a32c-defbaf326063',{ts '2010-04-22 15:49:22.900'},'admin',1,{ts '2010-04-22 15:49:22.900'},null,null,null,20,'df$Employee:update',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('4af89dd3-9cb4-478f-a609-980818c8b9b0',{ts '2010-04-22 15:44:40.800'},'admin',1,{ts '2010-04-22 15:44:40.800'},null,null,null,20,'df$Category:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('4de8d0a6-aad9-4ec5-8f7f-cfaf059289fe',{ts '2010-04-22 15:49:22.100'},'admin',1,{ts '2010-04-22 15:49:22.100'},null,null,null,20,'df$Category:delete',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('4f60093c-c3fd-4e45-a049-88a68534c666',{ts '2010-02-12 14:26:07.790'},'admin',1,{ts '2010-02-12 14:26:07.790'},null,null,null,20,'sec$Constraint:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('50025b21-a8d0-40a8-9b15-1f196a5b5038',{ts '2010-02-12 14:19:19.810'},'admin',1,{ts '2010-02-12 14:19:19.810'},null,null,null,10,'tm$TaskType.browse',0,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('5283a06c-ec28-40d4-8c24-a23b32200310',{ts '2010-02-12 14:17:14.650'},'admin',1,{ts '2010-02-12 14:17:14.650'},null,null,null,10,'wf$Proc.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('53a0c10d-a6e0-4e59-8eb7-c85b769adaf6',{ts '2010-02-12 14:26:07.790'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'core$FileDescriptor:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('56239519-602d-409f-b87f-efa8cca4bc81',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$Contract:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('563bf564-47ef-4f84-8d18-8eb43caffdcf',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$Contract:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('56760255-d451-4afa-8173-2f86c4bb7164',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$Currency:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('576c5cd5-88d6-4a33-8045-4012673270d2',{ts '2010-02-12 14:28:46.970'},'admin',1,{ts '2010-02-12 14:28:46.970'},null,null,null,20,'tm$TaskPattern:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('5893537e-6745-40a8-9c6c-f8232b2c50f1',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$Contractor:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('5991619c-4c56-4a12-bc4e-220b041211bf',{ts '2010-02-12 14:26:07.790'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.330'},'admin',20,'sec$EntityLogAttr:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('5db35a2f-7e48-4fb5-aa0a-170dd2f12c2e',{ts '2010-04-22 15:51:05.480'},'admin',1,{ts '2010-04-22 15:51:05.480'},null,null,null,20,'tm$Project:delete',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('5f64d661-cf26-4dba-aed6-c96192efdc03',{ts '2010-04-22 15:49:22.100'},'admin',1,{ts '2010-04-22 15:49:22.100'},null,null,null,20,'df$ContactPerson:update',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('6007a44e-31af-406c-985b-51ceaacf5636',{ts '2010-02-12 14:28:46.970'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'wf$CardAttachment:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('6081a3e3-133c-4667-a7a0-565f1c94fceb',{ts '2010-02-12 14:29:39.800'},'admin',1,{ts '2010-02-12 14:29:39.800'},null,null,null,20,'tm$TaskType:update',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('60d97a5b-b3ec-4e23-82c6-415d07033c75',{ts '2010-02-12 14:26:07.790'},'admin',1,{ts '2010-02-12 14:26:07.790'},null,null,null,20,'sec$Permission:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('651d05a9-3083-4ea0-8160-60c3130ca54a',{ts '2010-02-12 14:26:07.790'},'admin',1,{ts '2010-02-12 14:26:07.790'},null,null,null,20,'sec$Permission:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('66d91139-d5c2-48be-b874-6b109a0f1795',{ts '2010-04-22 14:17:14.470'},'admin',1,{ts '2010-04-22 14:17:14.470'},null,null,null,20,'tm$ProjectGroup:delete',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('6872c149-fa6b-4bc5-9104-97c7f61861bc',{ts '2010-02-12 14:26:07.780'},'admin',1,{ts '2010-02-12 14:26:07.780'},null,null,null,20,'sec$User:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('6a585f8e-b675-47a0-bedc-5ba5adf5313d',{ts '2010-04-22 15:49:22.100'},'admin',1,{ts '2010-04-22 15:49:22.100'},null,null,null,20,'df$Employee:create',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('6ae4ed42-522b-4a09-a2b1-f15a5e23452f',{ts '2010-02-12 14:29:39.800'},'admin',1,{ts '2010-02-12 14:29:39.800'},null,null,null,20,'tm$TaskType:create',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('6aec0915-eb06-4aa4-8475-504e88a4112b',{ts '2010-04-22 15:49:22.100'},'admin',1,{ts '2010-04-22 15:49:22.100'},null,null,null,20,'df$Contractor:delete',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('6d32068e-964d-4e3d-99e8-f4a45d21f644',{ts '2010-04-22 15:49:22.900'},'admin',1,{ts '2010-04-22 15:49:22.900'},null,null,null,20,'df$ContractorAccount:delete',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('6d576b4c-bf8f-475a-ad3d-f7f85d0cd87b',{ts '2010-02-12 14:28:46.950'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'wf$Timer:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('6dc11252-3c32-41ad-b041-bc59577d8668',{ts '2010-02-12 14:26:07.790'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'sec$UserSessionEntity:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('6e1b6c70-c6ab-4de8-bb6a-b8ea0b1856b7',{ts '2010-03-04 12:30:30.980'},'admin',1,{ts '2010-03-04 12:30:30.980'},null,null,null,40,'cuba.gui.filter.global',1,'0c018061-b26f-4de2-a5be-dff348347f93');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('704726c1-a1a6-4bc9-b83d-adfe1073b1e0',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$ContractorAccount:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('71871afa-261b-4f81-a637-36910a44f969',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$Contractor:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('71913ccf-bd53-47de-9e45-295504f438d9',{ts '2010-02-12 14:28:46.950'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'wf$Calendar:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('754aa636-b33e-4bdc-9742-5eac4d078ddf',{ts '2010-04-08 16:29:37.700'},'admin',1,{ts '2010-04-08 16:29:37.700'},null,null,null,10,'wf$Assignment.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('76273670-4ece-423a-abbb-e804ae8bf6f1',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$Category:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('77f9bb6a-4e13-48c8-b2a3-3578fc12c4e8',{ts '2010-04-22 15:44:40.800'},'admin',1,{ts '2010-04-22 15:44:40.800'},null,null,null,20,'df$Department:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('780e9a94-d60f-42f2-8d86-014d8a0c33b2',{ts '2010-02-12 14:26:07.790'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'sys$Folder:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('79e03acd-e686-4e05-b465-a6ef16d323c6',{ts '2010-04-22 14:16:30.180'},'admin',1,{ts '2010-04-22 14:16:30.180'},null,null,null,20,'tm$ProjectGroup:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('7a41689a-aa54-42a2-9af8-00a9dffe0b6c',{ts '2010-04-22 15:49:22.100'},'admin',1,{ts '2010-04-22 15:49:22.100'},null,null,null,20,'df$Company:create',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('7d037cb4-4078-40f7-872b-bd1eb7784970',{ts '2010-02-12 14:26:07.790'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'sys$Folder:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('7d93c8fb-8f2e-4d6e-9b86-ee9bb93e8cb3',{ts '2010-02-12 14:30:21.0'},'admin',1,{ts '2010-02-12 14:30:21.0'},null,null,null,20,'tm$Task:update',1,'f7ff1ec7-802d-4a42-a7db-1a97e17f893f');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('7f680940-20b4-4863-8b42-08356156858b',{ts '2010-02-12 14:28:46.950'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'wf$CardRole:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('8079425a-ea32-4088-9ceb-418228f0b08a',{ts '2010-02-12 14:26:07.790'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.330'},'admin',20,'sys$AppFolder:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('8140f871-a475-4d72-ad78-8c8c8b2b4d65',{ts '2010-02-12 14:28:46.970'},'admin',1,{ts '2010-02-12 14:28:46.970'},null,null,null,20,'tm$TaskGroup:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('8168609f-c61d-423c-82d8-e8de16efbe1d',{ts '2010-04-22 15:49:22.100'},'admin',1,{ts '2010-04-22 15:49:22.100'},null,null,null,20,'df$Contractor:update',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('82e627ab-fa7d-43dd-a557-b5d55bbf7469',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$Bank:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('839f9594-717e-4f19-9c22-54d8a10b6764',{ts '2010-02-12 14:28:46.970'},'admin',1,{ts '2010-02-12 14:28:46.970'},null,null,null,20,'wf$Proc:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('83bf25d1-5ec2-4af1-9b8d-6cd532630c84',{ts '2010-02-12 14:26:07.790'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'sys$AppFolder:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('84128e25-e739-401c-aad2-3863231f481d',{ts '2010-02-12 14:28:46.970'},'admin',1,{ts '2010-02-12 14:28:46.970'},null,null,null,20,'tm$TaskType:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('84828d0c-1e3d-4c0d-8956-97bbe205c2bb',{ts '2010-04-22 15:39:04.800'},'admin',1,{ts '2010-04-22 15:39:04.800'},null,null,null,20,'tm$Project:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('85689872-ed88-40aa-b569-08c70b17ad1f',{ts '2010-04-22 15:49:22.100'},'admin',1,{ts '2010-04-22 15:49:22.100'},null,null,null,20,'df$Bank:update',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('85d0a01f-e0d7-40e3-b893-602eed6b271a',{ts '2010-04-22 15:49:22.100'},'admin',1,{ts '2010-04-22 15:49:22.100'},null,null,null,20,'df$Individual:create',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('86fb29ef-9e97-4b5e-9c13-b218675338b1',{ts '2010-04-22 15:49:22.900'},'admin',1,{ts '2010-04-22 15:49:22.900'},null,null,null,20,'df$Department:delete',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('8907333c-8171-423e-9bc0-4a642780aab3',{ts '2010-04-22 15:49:22.100'},'admin',1,{ts '2010-04-22 15:49:22.100'},null,null,null,20,'df$Company:delete',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('89356e7f-a313-42a4-af7e-ed8e0260c79f',{ts '2010-02-12 14:30:21.0'},'admin',1,{ts '2010-02-12 14:30:21.0'},null,null,null,20,'tm$TaskGroup:update',1,'f7ff1ec7-802d-4a42-a7db-1a97e17f893f');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('8acff923-eea1-4164-bcc2-3d5eacb39ad0',{ts '2010-02-12 14:17:14.650'},'admin',1,{ts '2010-02-12 14:17:14.650'},null,null,null,10,'sec$Group.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('8b4e7db2-ca83-45b7-aaf0-523efa953bb7',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$BankRegion:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('8b741fa2-c6d3-4e49-a634-ed6d29fddef5',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$ContactPerson:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('8c85ae3d-ee03-48c1-8f8e-812842ee9b50',{ts '2010-02-12 14:26:07.780'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'sys$AppFolder:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('8ce0f193-e033-44e3-9635-fbd2521fcebd',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$Contractor:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('8d1af2b9-5d6d-459c-874c-cc7faf311c71',{ts '2010-04-22 15:49:22.100'},'admin',1,{ts '2010-04-22 15:49:22.100'},null,null,null,20,'df$BankRegion:create',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('8dfa8fe3-2516-4f96-a633-1d67bc7f5e1a',{ts '2010-02-12 14:28:46.950'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'wf$Calendar:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('8e6ce018-18aa-4743-91f4-c7aec6f45161',{ts '2010-02-24 19:12:13.390'},'admin',1,{ts '2010-02-24 19:12:13.390'},null,null,null,10,'wf$WorkCalendar.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('8ed9a43a-cb49-4083-a64d-eaa90aa116ec',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$Department:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('90965701-eed5-489b-8aa1-dfa56ffb193b',{ts '2010-04-08 16:29:37.700'},'admin',1,{ts '2010-04-08 16:29:37.700'},null,null,null,10,'core$LockInfo.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('9265e038-96cf-45ab-ae2d-331407bc3f31',{ts '2010-04-22 15:49:22.100'},'admin',1,{ts '2010-04-22 15:49:22.100'},null,null,null,20,'df$Organization:delete',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('973a79bb-c8ee-468d-833e-057b5587040b',{ts '2010-02-12 14:28:46.950'},'admin',1,{ts '2010-02-12 14:28:46.950'},null,null,null,20,'tm$TaskGroup:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('979ae3a5-fe07-4a58-95c4-497afb8bbb6b',{ts '2010-02-12 14:28:46.950'},'admin',1,{ts '2010-02-12 14:28:46.950'},null,null,null,20,'wf$ProcRole:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('97c24cfc-6f46-417b-a210-245953b7bd67',{ts '2010-02-12 14:26:07.790'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.330'},'admin',20,'sec$LoggedEntity:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('99b23ff9-00da-4dc1-81cb-c76a3fc0bf56',{ts '2010-04-22 15:49:22.100'},'admin',1,{ts '2010-04-22 15:49:22.100'},null,null,null,20,'df$Individual:delete',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('9a2873f1-e15a-4b5e-b945-2c5729740ad5',{ts '2010-02-12 14:26:07.790'},'admin',1,{ts '2010-02-12 14:26:07.790'},null,null,null,20,'sec$UserSubstitution:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('9c04af74-c3de-4de7-821d-d984776c68cd',{ts '2010-04-22 15:44:40.800'},'admin',1,{ts '2010-04-22 15:44:40.800'},null,null,null,20,'df$Numerator:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('9c3de77a-b92d-4c2d-aa19-9d46d3e3b070',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$Employee:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('9e1244e3-aa0d-4c75-bffd-2c0446736ab4',{ts '2010-02-12 14:28:46.970'},'admin',1,{ts '2010-02-12 14:28:46.970'},null,null,null,20,'tm$Task:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('9eb960df-efe3-4da9-91ea-ef0205910f0b',{ts '2010-02-12 14:28:46.950'},'admin',1,{ts '2010-02-12 14:28:46.950'},null,null,null,20,'tm$TaskPattern:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('9f2c860d-b323-472f-b6fa-9f7ab4f752d3',{ts '2010-04-22 14:16:30.170'},'admin',1,{ts '2010-04-22 14:16:30.170'},null,null,null,20,'tm$ProjectGroup:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('9fafdb38-6826-40f7-93fc-23caf6a60a8a',{ts '2010-02-12 14:28:46.970'},'admin',1,{ts '2010-02-12 14:28:46.970'},null,null,null,20,'wf$DefaultProcActor:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('9fd03eb0-61f9-403d-82cb-88de9ec03378',{ts '2010-02-12 14:29:39.800'},'admin',1,{ts '2010-02-12 14:29:39.800'},null,null,null,20,'tm$TaskPattern:delete',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('a2e3e6cc-fc04-4e4e-a4e1-4c67c6b3bb94',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$Individual:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('a3db63f8-5ed3-44d9-ad88-fe99ffca7995',{ts '2010-02-12 14:26:07.790'},'admin',1,{ts '2010-02-12 14:26:07.790'},null,null,null,20,'sec$Constraint:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('a483509e-a464-444e-b07b-ace1b2017ce7',{ts '2010-04-22 14:26:37.270'},'admin',1,{ts '2010-04-22 14:26:37.270'},null,null,null,10,'df$Numerator.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('a4bb6b84-c077-4f38-a4e9-d98295cac886',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$Bank:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('a4ef2859-22ce-42f0-a068-fd2de84850c2',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$ContractorAccount:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('a59604b6-88b3-4ae9-b1cd-2ae0e4edf1f5',{ts '2010-04-22 15:44:40.800'},'admin',1,{ts '2010-04-22 15:44:40.800'},null,null,null,20,'df$Company:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('a6ea90d9-7761-49c2-a269-f7253e7e9a73',{ts '2010-02-12 14:17:14.630'},'admin',1,{ts '2010-02-12 14:17:14.630'},null,null,null,10,'tm$TaskPatternGroup.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('a8400c8d-1912-4f26-8d6a-eaef6c42cff5',{ts '2010-02-12 14:30:21.0'},'admin',1,{ts '2010-02-12 14:30:21.0'},null,null,null,20,'tm$Task:delete',1,'f7ff1ec7-802d-4a42-a7db-1a97e17f893f');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('aa64f2a7-345e-4945-9bee-f37e78d2448d',{ts '2010-02-12 14:26:07.790'},'admin',1,{ts '2010-02-12 14:26:07.790'},null,null,null,20,'sec$UserRole:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('ab7b4c6d-f534-4b43-a9c0-5ff2d51679fa',{ts '2010-02-12 14:26:07.790'},'admin',1,{ts '2010-02-12 14:26:07.790'},null,null,null,20,'tm$TaskPatternGroup:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('ab8a1995-2501-470d-9377-aa3d1c91af2d',{ts '2010-02-12 14:29:39.800'},'admin',1,{ts '2010-02-12 14:29:39.800'},null,null,null,20,'tm$Priority:create',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('ac63a5b4-aca3-4b97-98b6-2fb4e78d1d4e',{ts '2010-04-22 15:49:22.100'},'admin',1,{ts '2010-04-22 15:49:22.100'},null,null,null,20,'df$Organization:create',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('ac6e1ef4-b02a-4652-867f-bf70cc766069',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$Individual:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('acbf87e8-5f4a-4f25-8e63-2471ad991d45',{ts '2010-02-12 14:29:39.800'},'admin',1,{ts '2010-02-12 14:29:39.800'},null,null,null,20,'tm$Priority:update',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('ae5e727d-1f7c-41dd-b49f-38906f8498bc',{ts '2010-02-12 14:28:46.970'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.330'},'admin',20,'tm$TaskVersion:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('b0593443-ae1f-410c-95b4-f2c5e72835e1',{ts '2010-04-22 15:49:22.100'},'admin',1,{ts '2010-04-22 15:49:22.100'},null,null,null,20,'df$ContactPerson:delete',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('b0dd01ff-230b-448d-a4d3-3348845e2052',{ts '2010-02-12 14:26:07.790'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.330'},'admin',20,'sec$UserSessionEntity:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('b121f760-087b-4ebf-80cf-cf8a549299d6',{ts '2010-02-12 14:26:07.790'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'sec$LoggedAttribute:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('b3358545-285b-4c53-a9e5-9a2b30a1213a',{ts '2010-02-12 14:19:19.830'},'admin',1,{ts '2010-02-12 14:19:19.830'},null,null,null,10,'tm$TaskPattern.browse',0,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('b442aa6e-29c5-404a-8def-03eee5a1afc4',{ts '2010-04-22 14:17:14.470'},'admin',1,{ts '2010-04-22 14:17:14.470'},null,null,null,20,'tm$ProjectGroup:update',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('b4621bff-aa6c-41ae-8c8f-9a77d20f18e2',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$Category:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('b5af903c-f93e-472b-90a0-32c1e6be1583',{ts '2010-04-22 15:49:22.900'},'admin',1,{ts '2010-04-22 15:49:22.900'},null,null,null,20,'df$Bank:create',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('b5f1481e-7a7f-4fcb-9670-5729255dadab',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$Currency:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('b662dd30-75b9-4b76-aabc-30413f3ac650',{ts '2010-02-12 14:30:21.0'},'admin',1,{ts '2010-02-12 14:30:21.0'},null,null,null,20,'tm$Task:create',1,'f7ff1ec7-802d-4a42-a7db-1a97e17f893f');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('e21cae80-bd55-40eb-9dac-0a144b691df2',{ts '2010-02-12 14:30:21.0'},'admin',1,{ts '2010-02-12 14:30:21.0'},null,null,null,20,'tm$TaskPattern:update',1,'f7ff1ec7-802d-4a42-a7db-1a97e17f893f');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('987656e2-6f1b-4b3b-bad0-7bae40e95185',{ts '2010-02-12 14:30:21.0'},'admin',1,{ts '2010-02-12 14:30:21.0'},null,null,null,20,'tm$TaskPattern:create',1,'f7ff1ec7-802d-4a42-a7db-1a97e17f893f');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('822ab006-db10-428d-b264-2cb9a623d8c6',{ts '2010-02-12 14:30:21.0'},'admin',1,{ts '2010-02-12 14:30:21.0'},null,null,null,20,'tm$TaskPattern:delete',1,'f7ff1ec7-802d-4a42-a7db-1a97e17f893f');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('b694ed7c-11f7-4190-a4bd-beecf31c8f9e',{ts '2010-04-22 15:39:04.800'},'admin',1,{ts '2010-04-22 15:39:04.800'},null,null,null,10,'df$DocKind.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('b82372f9-1ebb-4aba-86a2-256a203fc464',{ts '2010-02-12 14:28:46.970'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.330'},'admin',20,'wf$AssignmentAttachment:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('ba1bbb9e-061d-4e7b-8b16-cab0b76a4c74',{ts '2010-02-12 14:28:46.970'},'admin',1,{ts '2010-02-12 14:28:46.970'},null,null,null,20,'wf$Card:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('bbc3c85d-6af8-4252-922e-810753dc5781',{ts '2010-02-12 14:29:39.800'},'admin',1,{ts '2010-02-12 14:29:39.800'},null,null,null,20,'tm$TaskType:delete',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('bcbb0057-14c4-4b85-9861-6d58439e8353',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$Doc:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('bcd2229a-6bed-4c7a-b4a2-72c2a4f4c51d',{ts '2010-04-22 15:49:22.100'},'admin',1,{ts '2010-04-22 15:49:22.100'},null,null,null,20,'df$Department:create',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('bcde06f7-557e-4882-94c4-43e4d12f65c9',{ts '2010-02-12 14:28:46.950'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'wf$Assignment:read',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('bfae0838-effc-4698-a1cf-0d423e8272aa',{ts '2010-02-12 14:26:07.790'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'tm$TaskInfo:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('c2224c2b-a5c0-40a1-84c4-aaf6f4f1e95a',{ts '2010-04-22 15:49:22.100'},'admin',1,{ts '2010-04-22 15:49:22.100'},null,null,null,20,'df$BankRegion:update',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('c2675c85-0eb3-49ce-8e38-d7af129f6ec3',{ts '2010-02-12 14:28:46.970'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'wf$CardRole:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('c3211445-5742-4bec-a025-2060ea012dd7',{ts '2010-02-12 14:28:46.950'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'wf$Assignment:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('c39864a7-da13-400a-8955-673024dcc7b0',{ts '2010-02-12 14:28:46.970'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'wf$Timer:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('c3e88a89-35ce-4733-91c9-940f276caf44',{ts '2010-04-22 15:49:22.100'},'admin',1,{ts '2010-04-22 15:49:22.100'},null,null,null,20,'df$Category:create',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('c55fc32e-d287-4a61-ba5d-ed8716dd3b62',{ts '2010-02-12 14:29:39.780'},'admin',1,{ts '2010-02-12 14:29:39.780'},null,null,null,20,'tm$Priority:delete',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('c571e59e-8595-48da-84e0-0123532167cb',{ts '2010-02-12 14:17:14.630'},'admin',1,{ts '2010-02-12 14:17:14.630'},null,null,null,10,'sec$Role.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('c6294ec3-bee5-45ee-96ce-b6e16d476d03',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$Individual:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('c63921a9-113e-4a2e-a4dc-6433eddb32f2',{ts '2010-02-12 14:28:46.950'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'wf$Assignment:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('c7f9c0d2-06e3-4463-960e-a74c9dc60b86',{ts '2010-02-12 14:28:46.970'},'admin',1,{ts '2010-02-12 14:28:46.970'},null,null,null,20,'wf$Proc:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('c8a48b92-31a4-46e7-998d-47ed0e1ff052',{ts '2010-03-04 12:30:47.850'},'admin',1,{ts '2010-03-04 12:30:47.850'},null,null,null,40,'cuba.gui.filter.global',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('c928ad10-ea5d-4889-9811-519333de51d2',{ts '2010-02-12 14:26:07.790'},'admin',1,{ts '2010-02-12 14:26:07.790'},null,null,null,20,'sec$UserSubstitution:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('cbb5051a-eba9-45c4-a8a2-d0864e063f3b',{ts '2010-02-12 14:19:19.830'},'admin',1,{ts '2010-02-12 14:19:19.830'},null,null,null,10,'tm$Priority.browse',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('cd6fa393-45cd-4b76-a4e7-6f9779898d47',{ts '2010-02-12 14:26:07.790'},'admin',1,{ts '2010-02-12 14:26:07.790'},null,null,null,20,'sec$UserRole:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('ce03a7fa-6cd2-4908-a8d3-b29751b57b22',{ts '2010-02-12 14:29:39.800'},'admin',1,{ts '2010-02-12 14:29:39.800'},null,null,null,20,'tm$TaskPatternGroup:update',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('cf0de3d7-5dbd-4a2f-a194-84f1deb4bb82',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$Numerator:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('cf3ae1c0-61ac-45e8-9a3c-50568e84b81a',{ts '2010-02-12 14:26:07.790'},'admin',1,{ts '2010-02-12 14:26:07.790'},null,null,null,20,'sec$Group:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('cf47f15a-b8bc-4062-9755-dae57130f9d5',{ts '2010-02-12 14:26:07.790'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'core$FileDescriptor:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('d03d151f-7b22-4d61-a283-18828baceeef',{ts '2010-02-12 14:28:46.970'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'wf$AssignmentAttachment:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('d37f03bd-8080-4d54-b03a-569cd300e5da',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$ContactPerson:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('d4838121-1704-47ac-ab8b-590164402bb4',{ts '2010-02-12 14:17:14.630'},'admin',1,{ts '2010-02-12 14:17:14.630'},null,null,null,10,'tm$TaskPattern.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('d4e1f450-e836-4811-8f7e-3e1ca1084719',{ts '2010-02-12 14:17:14.630'},'admin',1,{ts '2010-02-12 14:17:14.630'},null,null,null,10,'tm$TaskType.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('d5a7919c-bf08-4157-969a-91796562e540',{ts '2010-04-22 15:54:00.350'},'admin',1,{ts '2010-04-22 15:54:00.350'},null,null,null,20,'df$DocType:create',1,'0c018061-b26f-4de2-a5be-dff348347f93');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('d6a21b25-2139-4ef6-9cfd-092f3411c66d',{ts '2010-02-12 14:26:07.790'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'sec$EntityLog:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('d76198e4-a913-43cf-b0dd-7855183db864',{ts '2010-02-12 14:28:46.970'},'admin',1,{ts '2010-02-12 14:28:46.970'},null,null,null,20,'wf$DefaultProcActor:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('d7d66af9-0e5a-465e-8b5d-532466f9c417',{ts '2010-04-22 15:49:22.900'},'admin',1,{ts '2010-04-22 15:49:22.900'},null,null,null,20,'df$Currency:delete',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('d9ef2451-4b23-4323-8abc-253aff864fe5',{ts '2010-02-12 14:26:07.780'},'admin',2,{ts '2010-02-12 14:40:34.330'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'sec$LoggedAttribute:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('da9134ed-cfec-4110-a758-07ca6e706aa2',{ts '2010-04-22 15:49:22.100'},'admin',1,{ts '2010-04-22 15:49:22.100'},null,null,null,20,'df$ContractorAccount:update',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('dac4c282-0dc1-4e32-9fe0-d9e0501bcbc5',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$Company:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('db7964f3-5fa3-4ce7-9540-e40ba90c1e31',{ts '2010-02-12 14:17:14.630'},'admin',1,{ts '2010-02-12 14:17:14.630'},null,null,null,10,'sec$UserSessionEntity.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('db8458a8-63d4-4a68-97f4-7966ff66eaac',{ts '2010-02-12 14:26:07.790'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'tm$TaskInfo:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('dbc7bb33-283c-468e-92e3-3838a689fda6',{ts '2010-04-22 15:39:04.800'},'admin',1,{ts '2010-04-22 15:39:04.800'},null,null,null,10,'df$DocType.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('dbe83af7-b8d2-48f9-aa5f-4e7c8990983e',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$Company:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('e05216cd-28be-4a89-9d09-55f7b8adf829',{ts '2010-02-12 14:26:07.790'},'admin',1,{ts '2010-02-12 14:26:07.790'},null,null,null,20,'tm$TaskPatternGroup:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('e1b000b2-6310-4922-b089-472913f89822',{ts '2010-02-12 14:26:07.790'},'admin',1,{ts '2010-02-12 14:26:07.790'},null,null,null,20,'sec$Group:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('e3555d5c-43c4-4703-b9a3-2802ba264536',{ts '2010-04-22 15:49:22.900'},'admin',1,{ts '2010-04-22 15:49:22.900'},null,null,null,20,'df$ContractorAccount:create',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('e5db8f74-a995-4fec-b47d-991f1163490e',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$DocType:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('e768da0d-a9ae-4db5-940d-e72588e18072',{ts '2010-02-12 14:28:46.970'},'admin',1,{ts '2010-02-12 14:28:46.970'},null,null,null,20,'wf$Card:update',1,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('e803d4b1-153c-4aa1-afe2-cf7e50915687',{ts '2010-04-22 15:49:22.100'},'admin',1,{ts '2010-04-22 15:49:22.100'},null,null,null,20,'df$Contractor:create',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('e8380e24-70e5-46e4-88cd-6ce8b08836ec',{ts '2010-04-22 15:44:40.900'},'admin',1,{ts '2010-04-22 15:44:40.900'},null,null,null,20,'df$ContractorAccount:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('e9b6ad9a-f6f4-4515-8bf4-ba0d57613d85',{ts '2010-04-22 15:44:40.800'},'admin',1,{ts '2010-04-22 15:44:40.800'},null,null,null,20,'df$Numerator:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('e9d7bff4-8a73-4838-aad9-957affda2f92',{ts '2010-02-12 14:28:46.970'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.330'},'admin',20,'wf$CardAttachment:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('e9e6ada0-cff9-4bcc-9b5d-2e94211d8372',{ts '2010-04-22 15:49:22.900'},'admin',1,{ts '2010-04-22 15:49:22.900'},null,null,null,20,'df$Currency:create',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('ea64c27d-f713-49c3-8a0c-3eeac2fc81b2',{ts '2010-04-22 15:49:22.900'},'admin',1,{ts '2010-04-22 15:49:22.900'},null,null,null,20,'df$Individual:update',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('ea947c75-fb9c-4752-b867-e4f22b2c2d05',{ts '2010-02-12 14:19:19.830'},'admin',1,{ts '2010-02-12 14:19:19.830'},null,null,null,10,'tm$TaskPatternGroup.browse',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('eaefb879-5b06-44cd-977a-a85a21dd2275',{ts '2010-04-22 15:49:22.100'},'admin',1,{ts '2010-04-22 15:49:22.100'},null,null,null,20,'df$Employee:delete',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('eb4f9c85-a5fd-4028-8af7-39178976ecab',{ts '2010-02-12 14:17:14.630'},'admin',1,{ts '2010-02-12 14:17:14.630'},null,null,null,10,'tm$Priority.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('ec81d364-5965-4b6f-8bd6-4f2a2b441138',{ts '2010-02-12 14:26:07.780'},'admin',1,{ts '2010-02-12 14:26:07.780'},null,null,null,20,'sec$GroupHierarchy:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('ef73203a-fa75-449b-a99e-619132f462e5',{ts '2010-04-22 15:54:00.350'},'admin',1,{ts '2010-04-22 15:54:00.350'},null,null,null,20,'df$DocKind:create',1,'0c018061-b26f-4de2-a5be-dff348347f93');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('f11d44b7-8874-4bf1-88d1-b98dba9c9516',{ts '2010-02-12 14:26:07.790'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'sys$Folder:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('f26e6729-9c46-4960-ab6d-d47b97bb8156',{ts '2010-02-12 14:28:46.970'},'admin',1,{ts '2010-02-12 14:28:46.970'},null,null,null,20,'wf$ProcRole:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('f2b77bf4-7d03-4c74-9288-155e997ab917',{ts '2010-04-22 15:49:22.100'},'admin',1,{ts '2010-04-22 15:49:22.100'},null,null,null,20,'df$Category:update',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('f2e05fcc-0174-4269-8d07-3d5a8edc2906',{ts '2010-02-12 14:26:07.790'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'sec$EntityLog:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('f43428db-5edc-42eb-9a46-40664f3f8efe',{ts '2010-04-22 15:51:05.480'},'admin',1,{ts '2010-04-22 15:51:05.480'},null,null,null,20,'tm$Project:create',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
--INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('f4ab8e51-0e66-42c9-b77d-072a0e3e38d4',{ts '2010-02-12 14:29:39.800'},'admin',1,{ts '2010-02-12 14:29:39.800'},null,null,null,20,'tm$TaskPattern:update',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('f4b26615-7692-4bf2-bd31-1c46d76af6e4',{ts '2010-04-22 15:44:40.800'},'admin',1,{ts '2010-04-22 15:44:40.800'},null,null,null,20,'df$Organization:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('f754d3aa-5698-4123-8f30-cfbdc31c7499',{ts '2010-02-12 14:26:07.780'},'admin',1,{ts '2010-02-12 14:26:07.780'},null,null,null,20,'sec$Role:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('f89336ae-74aa-405f-a0bd-178ab68b9a22',{ts '2010-02-12 14:28:46.950'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.310'},'admin',20,'tm$TaskVersion:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('f946cc79-6e94-43db-a3aa-fed979d7b7ae',{ts '2010-02-12 14:26:07.790'},'admin',1,{ts '2010-02-12 14:26:07.790'},null,null,null,20,'sec$GroupHierarchy:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('f9e7549b-f586-4208-b87f-3ff075e272d1',{ts '2010-02-12 14:28:46.970'},'admin',2,{ts '2010-02-12 14:40:34.480'},'admin',{ts '2010-02-12 14:40:34.330'},'admin',20,'wf$Calendar:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('fcad94a8-39dd-4573-86a9-c5d410c44e5d',{ts '2010-04-22 15:49:22.900'},'admin',1,{ts '2010-04-22 15:49:22.900'},null,null,null,20,'df$OrganizationAccount:update',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('fe3bb69a-5192-46d7-adcd-da9049a82605',{ts '2010-02-12 14:26:07.780'},'admin',1,{ts '2010-02-12 14:26:07.780'},null,null,null,20,'sec$Permission:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('fe848eea-516f-4adc-b2a2-65e1ca5f34b8',{ts '2010-02-12 14:17:14.630'},'admin',1,{ts '2010-02-12 14:17:14.630'},null,null,null,10,'sec$User.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('ff4e3a95-ddc1-4e83-9dd1-1339bb1dafa4',{ts '2010-04-22 15:44:40.800'},'admin',1,{ts '2010-04-22 15:44:40.800'},null,null,null,20,'df$Bank:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('62c68f85-985a-49f7-9d84-87d555dd33a6',{ts '2010-05-05 16:06:06.680'},'admin',1,{ts '2010-05-05 16:06:06.680'},null,null,null,20,'df$SimpleDoc:delete',1,'3c9abffb-2fae-484e-990c-343b3c1197ca');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('9177a0e5-c416-4124-b7df-20bf6cbc23b4',{ts '2010-05-05 16:06:06.680'},'admin',1,{ts '2010-05-05 16:06:06.680'},null,null,null,20,'df$SimpleDoc:create',1,'3c9abffb-2fae-484e-990c-343b3c1197ca');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('c4e42857-eea6-4330-8797-bccb6a97de10',{ts '2010-05-05 16:06:06.680'},'admin',1,{ts '2010-05-05 16:06:06.680'},null,null,null,20,'df$SimpleDoc:update',1,'3c9abffb-2fae-484e-990c-343b3c1197ca');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('504be533-434f-4914-b7a8-b27f5e1b3299',{ts '2010-05-05 16:06:06.680'},'admin',1,{ts '2010-05-05 16:06:06.680'},null,null,null,10,'tm$TaskPattern.browse',1,'f7ff1ec7-802d-4a42-a7db-1a97e17f893f');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('6460d13d-e220-4e88-b0ae-c705216a0a57',{ts '2010-02-12 14:17:14.650'},'admin',1,{ts '2010-02-12 14:17:14.650'},null,null,null,10,'feedback',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');


INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value, role_id) VALUES ('9e75c7eb-a430-44f7-8b51-b9f6db4dd90f', '2010-05-20 13:04:11.42', 'admin', 1, '2010-05-20 13:04:11.42', NULL, NULL, NULL, 10, 'df$DocIncome.browse', 1, '7091f5ef-a77a-450a-834a-39406885676e');
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value, role_id) VALUES ('6ed2a5df-8d7c-42ac-8eef-e1bf0edc95a9', '2010-05-20 13:04:11.42', 'admin', 1, '2010-05-20 13:04:11.42', NULL, NULL, NULL, 10, 'df$DocInternal.browse', 1, '7091f5ef-a77a-450a-834a-39406885676e');
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value, role_id) VALUES ('33dd26ac-a1d8-4894-a7b1-5afe0a069773', '2010-05-20 13:04:11.42', 'admin', 1, '2010-05-20 13:04:11.42', NULL, NULL, NULL, 10, 'df$OfficeFileNomenclature.browse', 1, '7091f5ef-a77a-450a-834a-39406885676e');
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value, role_id) VALUES ('0db798c7-98ab-41ce-82ce-7eb116953554', '2010-05-20 13:04:11.42', 'admin', 1, '2010-05-20 13:04:11.42', NULL, NULL, NULL, 10, 'df$DocReceivingMethod.browse', 1, '7091f5ef-a77a-450a-834a-39406885676e');
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value, role_id) VALUES ('88d0aa5c-3b84-42c5-b715-ccd24bcf59d8', '2010-05-20 13:04:11.42', 'admin', 1, '2010-05-20 13:04:11.42', NULL, NULL, NULL, 10, 'df$DocOutcome.browse', 1, '7091f5ef-a77a-450a-834a-39406885676e');
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value, role_id) VALUES ('e76d68f8-4e4a-4972-b1e5-6e19e0381e1d', '2010-05-20 13:04:11.42', 'admin', 1, '2010-05-20 13:04:11.42', NULL, NULL, NULL, 10, 'df$OfficeFile.browse', 1, '7091f5ef-a77a-450a-834a-39406885676e');
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value, role_id) VALUES ('b525fcc6-2963-4c95-ab53-736d513d2e87', '2010-05-20 13:04:47.47', 'admin', 1, '2010-05-20 13:04:47.47', NULL, NULL, NULL, 10, 'df$OfficeFile.browse', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value, role_id) VALUES ('ce5eea18-6112-4e8c-9354-31f70f557151', '2010-05-20 13:04:47.47', 'admin', 1, '2010-05-20 13:04:47.47', NULL, NULL, NULL, 10, 'df$DocReceivingMethod.browse', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value, role_id) VALUES ('76eaa12b-4d9c-45e6-8265-4e88241d6c8d', '2010-05-20 13:04:47.48', 'admin', 1, '2010-05-20 13:04:47.48', NULL, NULL, NULL, 10, 'df$OfficeFileNomenclature.browse', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value, role_id) VALUES ('a275efde-db56-483d-8d44-675336311faa', '2010-05-20 13:04:47.48', 'admin', 1, '2010-05-20 13:04:47.48', NULL, NULL, NULL, 10, 'df$DocIncome.browse', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value, role_id) VALUES ('deddf997-f5d2-4512-96ef-49b41be754af', '2010-05-20 13:04:47.48', 'admin', 1, '2010-05-20 13:04:47.48', NULL, NULL, NULL, 10, 'df$DocOutcome.browse', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value, role_id) VALUES ('5a8d93b9-c2ac-454d-b88b-16967973a54e', '2010-05-20 13:04:47.49', 'admin', 1, '2010-05-20 13:04:47.49', NULL, NULL, NULL, 10, 'df$DocInternal.browse', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value, role_id) VALUES ('3ccc3e08-6c9a-11df-b69f-abdb42ff7f18', '2010-05-20 13:04:47.49', 'admin', 1, '2010-05-20 13:04:47.49', NULL, NULL, NULL, 10, 'sec$User.edit', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value, role_id) VALUES ('2dc3ec4c-b733-11df-932a-2b8e44e58220', '2010-05-20 13:04:47.49', 'admin', 1, '2010-05-20 13:04:47.49', NULL, NULL, NULL, 10, 'jmxConsole', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value, role_id) VALUES ('76a6977a-b733-11df-b52a-fb44c9d29968', '2010-05-20 13:04:47.49', 'admin', 1, '2010-05-20 13:04:47.49', NULL, NULL, NULL, 10, 'core$Entity.restore', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value, role_id) VALUES ('e75f3112-aa0c-4bac-8025-e5af579595f8', '2010-05-05 16:06:06.68', 'admin', 1, '2010-05-05 16:06:06.68', null, null, null, 20, 'df$Doc:delete', 1, '3c9abffb-2fae-484e-990c-343b3c1197ca');
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value, role_id) VALUES ('e889f226-ddeb-4f7a-80fa-5f368ab6aa34', '2010-05-05 16:06:06.68', 'admin', 1, '2010-05-05 16:06:06.68', null, null, null, 20, 'df$Doc:create', 1, '3c9abffb-2fae-484e-990c-343b3c1197ca');
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value, role_id) VALUES ('5b503fe4-aec9-4186-9271-bdc077315eb0', '2010-05-05 16:06:06.68', 'admin', 1, '2010-05-05 16:06:06.68', null, null, null, 20, 'df$Doc:update', 1, '3c9abffb-2fae-484e-990c-343b3c1197ca');

INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value, role_id) VALUES ('b9bf7d7f-8242-4fde-b550-e33d8c0c0545', '2010-05-20 14:12:48.65', 'admin', 1, '2010-05-20 14:12:48.65', NULL, NULL, NULL, 10, 'systemSettings', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, PERMISSION_TYPE, target, value, role_id) VALUES ('d9212fa1-a02d-48e3-896c-81c741fb2c5b', '2010-05-20 14:15:26.38', 'admin', 1, '2010-05-20 14:15:26.38', NULL, NULL, NULL, 10, 'systemSettings', 1, '0c018061-b26f-4de2-a5be-dff348347f93');

INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('826c59e4-593d-11e0-afdc-87a3d5cee637',null,'admin',1,null,null,null,null,40,'cuba.gui.showInfo',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
---------------------------------------------------------------------------------------------------

INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),'admin',1,20,'tm$Project:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');

---------------------------------------------------------------------------------------------------

INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),'admin',1,20,'df$DocKind:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),'admin',1,20,'df$DocKind:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),'admin',1,20,'df$DocKind:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');

INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),'admin',1,10,'sys$Category.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c')^

-----------------------------------------------------------------------------------------------------

INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),'admin',1,20,'df$OfficeFile:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),'admin',1,20,'df$OfficeFile:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),'admin',1,20,'df$OfficeFile:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');

INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),'admin',1,20,'df$OfficeFileNomenclature:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),'admin',1,20,'df$OfficeFileNomenclature:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),'admin',1,20,'df$OfficeFileNomenclature:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');

INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),USER,1,20,'df$OfficeFileNomenclature:create',1,'7091f5ef-a77a-450a-834a-39406885676e');
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),USER,1,20,'df$OfficeFileNomenclature:update',1,'7091f5ef-a77a-450a-834a-39406885676e');
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),USER,1,20,'df$OfficeFileNomenclature:delete',1,'7091f5ef-a77a-450a-834a-39406885676e');
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),USER,1,20,'df$OfficeFile:create',1,'7091f5ef-a77a-450a-834a-39406885676e');
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),USER,1,20,'df$OfficeFile:update',1,'7091f5ef-a77a-450a-834a-39406885676e');
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),USER,1,20,'df$OfficeFile:delete',1,'7091f5ef-a77a-450a-834a-39406885676e');

----------------------------------------------------------------------------------------------------
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),USER,1,20,'wf$AttachmentType:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),USER,1,20,'wf$AttachmentType:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),USER,1,20,'wf$AttachmentType:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');

INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),USER,1,20,'df$TypicalResolution:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),USER,1,20,'df$TypicalResolution:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),USER,1,20,'df$TypicalResolution:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');

INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),USER,1,20,'df$TypicalResolution:create',1,'c06c0cee-2f21-4241-8d6f-76b4cd462f96');
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),USER,1,20,'df$TypicalResolution:update',1,'c06c0cee-2f21-4241-8d6f-76b4cd462f96');
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),USER,1,20,'df$TypicalResolution:delete',1,'c06c0cee-2f21-4241-8d6f-76b4cd462f96');

INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),USER,1,20,'df$TypicalResolution:create',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),USER,1,20,'df$TypicalResolution:update',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),USER,1,20,'df$TypicalResolution:delete',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');

INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),USER,1,20,'wf$AttachmentType:create',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),USER,1,20,'wf$AttachmentType:update',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),USER,1,20,'wf$AttachmentType:delete',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');

INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),USER,1,10,'df$TypicalResolution.browse',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
----------------------------------------------------------------------------------------------------

INSERT INTO SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('0c0110cf-75fc-4588-98ab-9b0ea7427f60',now(),'admin',1,now(),null,null,null,10,'tm$ScheduleTask.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('4b498d47-05ce-4bdc-a598-163799386316',now(),'admin',1,now(),null,null,null,10,'tm$ScheduleActionType.browse',1,'0c018061-b26f-4de2-a5be-dff348347f93');
INSERT INTO SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('8be19e1d-973d-4491-9df9-ed30ff785ba9',now(),'admin',1,now(),null,null,null,10,'tm$ScheduleActionType.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('8f402cc1-2540-47cb-9807-2fd56abedee5',now(),'admin',1,now(),null,null,null,10,'tm$ScheduleTask.browse',1,'5115e833-4146-4c98-a119-1c06053adb92');
-------------------------------------------------------------------------------------------------------
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('9019aa96-60dc-11e0-bc0b-17274be9dbd9',current_timestamp,null,1,null,null,null,null,10,'wf$Design.browse',1,'0c018061-b26f-4de2-a5be-dff348347f93');
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('96a6d56e-60dc-11e0-b398-1748ee18874b',current_timestamp,null,1,null,null,null,null,10,'wf$Design.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');

----------------------------------------------------------------------------------------------------
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('9949bcba-593d-11e0-9c42-9b7369fed5db',current_timestamp,null,1,null,null,null,null,10,'wf$ProcStageType.browse',1,'0c018061-b26f-4de2-a5be-dff348347f93');
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('749504a6-593d-11e0-8e4e-9fd908e1e0e2',current_timestamp,null,1,null,null,null,null,10,'wf$ProcStageType.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');

----------------------------------------------------------------------------------------------------
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('41fd6ef4-047b-11e1-9dae-b795ca9a4604',now(),'admin',1,now(),null,null,null,10,'df$UserSubstitution.browse',1,'b6a03cd4-0479-11e1-b6c9-77dd813b99ee');
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('757377c4-0480-11e1-a7ae-df74fc362788',now(),'admin',1,now(),null,null,null,10,'df$UserSubstitution.edit',1,'b6a03cd4-0479-11e1-b6c9-77dd813b99ee');
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('7a7b4f44-0480-11e1-8d1d-7ff443e73f88',now(),'admin',1,now(),null,null,null,20,'sec$UserSubstitution:create',1,'b6a03cd4-0479-11e1-b6c9-77dd813b99ee');
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('7f168244-0480-11e1-87ca-b77b6e8c1e4b',now(),'admin',1,now(),null,null,null,20,'sec$UserSubstitution:update',1,'b6a03cd4-0479-11e1-b6c9-77dd813b99ee');
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('83b055b4-0480-11e1-8afd-978c96b5602f',now(),'admin',1,now(),null,null,null,20,'sec$UserSubstitution:delete',1,'b6a03cd4-0479-11e1-b6c9-77dd813b99ee');

INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('8b17059e-045a-11e1-9ff0-5b3f364a9175',now(),'admin',1,now(),null,null,null,10,'df$UserSubstitution.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('567d2324-0480-11e1-8725-13795b5a61a9',now(),'admin',1,now(),null,null,null,10,'df$UserSubstitution.edit',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');

INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('aa940db2-348e-11e2-8367-d3d3737e10e1',current_timestamp,'admin',1,current_timestamp,null,null,null,10,'core$ScheduledTask.browse',1,'0c018061-b26f-4de2-a5be-dff348347f93');
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('afeff4b0-348e-11e2-810a-07a133526258',current_timestamp,'admin',1,current_timestamp,null,null,null,10,'core$ScheduledTask.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');

----------------------------------------------------------------------------------------------------
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('a6935664-885e-11e1-9248-83ef391ff91f',{ts '2010-04-08 16:29:37.700'},'admin',1,{ts '2010-04-08 16:29:37.700'},null,null,null,10,'printDomain',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('83140af2-885f-11e1-9aa3-876f4796e54c',{ts '2010-04-08 16:29:37.700'},'admin',1,{ts '2010-04-08 16:29:37.700'},null,null,null,10,'printDomain',1,'0c018061-b26f-4de2-a5be-dff348347f93');

INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES ('94de95ef-0490-441e-beb3-81b0ae0541d3',{ts '2013-04-19 15:35:05.93'},'admin',1,{ts '2013-04-19 15:35:05.93'},null,null,null,10,'reassignment.form',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');

insert into SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,permission_type,target,value,role_id) VALUES (newid(),current_timestamp,'admin',1,current_timestamp,null,null,null,10,'entityRestore',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');

----------------------------------------------------------------------------------------------------
insert into SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,permission_type,target,value,role_id) VALUES (newid(),current_timestamp,'admin',1,current_timestamp,null,null,null, 20,'df$ReservationNumber:create',1,'7091f5ef-a77a-450a-834a-39406885676e');
insert into SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,permission_type,target,value,role_id) VALUES (newid(),current_timestamp,'admin',1,current_timestamp,null,null,null, 20,'df$ReservationNumber:update',1,'7091f5ef-a77a-450a-834a-39406885676e');
insert into SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,permission_type,target,value,role_id) VALUES (newid(),current_timestamp,'admin',1,current_timestamp,null,null,null, 20,'df$ReservationNumber:delete',1,'7091f5ef-a77a-450a-834a-39406885676e');
insert into SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,permission_type,target,value,role_id) VALUES (newid(),current_timestamp,'admin',1,current_timestamp,null,null,null, 10,'df$ReservationNumber.browse',1,'7091f5ef-a77a-450a-834a-39406885676e');

insert into SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,permission_type,target,value,role_id) VALUES (newid(),current_timestamp,'admin',1,current_timestamp,null,null,null, 20,'df$ReservationNumber:create',1,'0c018061-b26f-4de2-a5be-dff348347f93');
insert into SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,permission_type,target,value,role_id) VALUES (newid(),current_timestamp,'admin',1,current_timestamp,null,null,null, 20,'df$ReservationNumber:update',1,'0c018061-b26f-4de2-a5be-dff348347f93');
insert into SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,permission_type,target,value,role_id) VALUES (newid(),current_timestamp,'admin',1,current_timestamp,null,null,null, 20,'df$ReservationNumber:delete',1,'0c018061-b26f-4de2-a5be-dff348347f93');
insert into SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,permission_type,target,value,role_id) VALUES (newid(),current_timestamp,'admin',1,current_timestamp,null,null,null, 10,'df$ReservationNumber.browse',1,'0c018061-b26f-4de2-a5be-dff348347f93');

insert into SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,permission_type,target,value,role_id) VALUES (newid(),current_timestamp,'admin',1,current_timestamp,null,null,null, 20,'df$ReservationNumber:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
insert into SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,permission_type,target,value,role_id) VALUES (newid(),current_timestamp,'admin',1,current_timestamp,null,null,null, 20,'df$ReservationNumber:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
insert into SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,permission_type,target,value,role_id) VALUES (newid(),current_timestamp,'admin',1,current_timestamp,null,null,null, 20,'df$ReservationNumber:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
insert into SEC_PERMISSION (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,permission_type,target,value,role_id) VALUES (newid(),current_timestamp,'admin',1,current_timestamp,null,null,null, 10,'df$ReservationNumber.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');

----------------------------------------------------------------------------------------------------
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),{ts '2010-04-22 16:00:04.550'},'admin',1,{ts '2010-04-22 16:00:04.550'},null,null,null,20,'df$MeetingDoc:create',1,'80145594-f020-e85c-d259-7a293c035495');
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),{ts '2010-04-22 16:00:04.550'},'admin',1,{ts '2010-04-22 16:00:04.550'},null,null,null,20,'df$MeetingDoc:update',1,'80145594-f020-e85c-d259-7a293c035495');
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),{ts '2010-04-22 16:00:04.550'},'admin',1,{ts '2010-04-22 16:00:04.550'},null,null,null,20,'df$MeetingDoc:delete',1,'80145594-f020-e85c-d259-7a293c035495');
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),{ts '2010-04-22 16:00:04.550'},'admin',1,{ts '2010-04-22 16:00:04.550'},null,null,null,20,'df$MeetingDoc:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),{ts '2010-04-22 16:00:04.550'},'admin',1,{ts '2010-04-22 16:00:04.550'},null,null,null,20,'df$MeetingDoc:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),{ts '2010-04-22 16:00:04.550'},'admin',1,{ts '2010-04-22 16:00:04.550'},null,null,null,20,'df$MeetingDoc:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');

----------------------------------------------------------------------------------------------------
INSERT INTO "public"."wf_calendar" (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) VALUES ('161b69cf-ec53-43b7-bdfb-b60ec8815cb4',{ts '2010-03-03 18:32:26.790'},'admin',{ts '2010-03-03 18:33:12.160'},'admin',null,2,'09:00','13:00');
INSERT INTO "public"."wf_calendar" (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) VALUES ('17c2861e-b578-425d-8579-02f6dea3f87b',{ts '2010-03-03 18:32:26.790'},'admin',{ts '2010-03-03 18:32:26.790'},null,null,5,'14:00','18:00');
--INSERT INTO "public"."wf_calendar" (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) VALUES ('1d7dbfcf-4a23-4232-b90e-e76555639eb5',{ts '2010-03-03 18:32:26.790'},'admin',{ts '2010-03-03 18:32:26.790'},null,{d '2010-01-05'},null,null,null);
--INSERT INTO "public"."wf_calendar" (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) VALUES ('2f1080c0-fc30-48e6-8468-0af1d8246937',{ts '2010-03-03 18:32:26.790'},'admin',{ts '2010-03-03 18:32:26.790'},null,{d '2010-01-01'},null,null,null);
--INSERT INTO "public"."wf_calendar" (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) VALUES ('4716e18e-7b64-4797-8023-d2442be2bff7',{ts '2010-03-03 18:32:26.790'},'admin',{ts '2010-03-03 18:32:26.790'},null,{d '2010-06-12'},null,null,null);
--INSERT INTO "public"."wf_calendar" (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) VALUES ('4df68ff9-cd5a-463b-a9fd-3ae3323ae460',{ts '2010-03-03 18:32:26.790'},'admin',{ts '2010-03-03 18:32:26.790'},null,{d '2010-02-23'},null,null,null);
INSERT INTO "public"."wf_calendar" (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) VALUES ('7726565f-daf6-4dfe-858c-f8cf71aef0ce',{ts '2010-03-03 18:32:26.790'},'admin',{ts '2010-03-03 18:32:26.790'},null,null,5,'09:00','13:00');
INSERT INTO "public"."wf_calendar" (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) VALUES ('8368e326-689c-4c61-b234-5d35b88a9270',{ts '2010-03-03 18:32:26.790'},'admin',{ts '2010-03-03 18:32:26.790'},null,null,4,'14:00','18:00');
INSERT INTO "public"."wf_calendar" (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) VALUES ('868958ec-2b0c-487f-b192-3a2b086d73e3',{ts '2010-03-03 18:32:26.790'},'admin',{ts '2010-03-03 18:32:26.790'},null,null,4,'09:00','13:00');
--INSERT INTO "public"."wf_calendar" (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) VALUES ('8d7e8cef-261f-4db7-9522-866eb4e25dcd',{ts '2010-03-03 18:32:26.790'},'admin',{ts '2010-03-03 18:32:26.790'},null,{d '2010-01-03'},null,null,null);
INSERT INTO "public"."wf_calendar" (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) VALUES ('91ac3881-fd81-4e54-a0a5-165d795ccd73',{ts '2010-03-03 18:32:26.790'},'admin',{ts '2010-03-03 18:32:26.790'},null,null,1,null,null);
INSERT INTO "public"."wf_calendar" (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) VALUES ('950e60d9-9f1a-42a3-91e9-5392fa1f8ef9',{ts '2010-03-03 18:32:26.790'},'admin',{ts '2010-03-03 18:32:26.790'},null,null,6,'09:00','13:00');
--INSERT INTO "public"."wf_calendar" (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) VALUES ('9b5365e9-4be9-438a-9461-b94be52696a2',{ts '2010-03-03 18:32:26.790'},'admin',{ts '2010-03-03 18:32:26.790'},null,{d '2010-11-05'},null,null,null);
INSERT INTO "public"."wf_calendar" (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) VALUES ('9b64d3ab-1132-4f40-ac2b-bb8df7ec25c6',{ts '2010-03-03 18:32:26.790'},'admin',{ts '2010-03-03 18:32:26.790'},null,null,3,'09:00','13:00');
--INSERT INTO "public"."wf_calendar" (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) VALUES ('b90ae806-3e83-477a-a356-211f3307a24e',{ts '2010-03-03 18:32:26.790'},'admin',{ts '2010-03-03 18:32:26.790'},null,{d '2010-01-07'},null,null,null);
INSERT INTO "public"."wf_calendar" (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) VALUES ('bb8b0b04-fc16-45c3-a377-36044a371014',{ts '2010-03-03 18:32:26.790'},'admin',{ts '2010-03-03 18:32:26.790'},null,null,6,'14:00','18:00');
--INSERT INTO "public"."wf_calendar" (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) VALUES ('bc68da78-c0fc-479d-b39c-a8e4172f7968',{ts '2010-03-03 18:32:26.790'},'admin',{ts '2010-03-03 18:32:26.790'},null,{d '2010-05-09'},null,null,null);
--INSERT INTO "public"."wf_calendar" (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) VALUES ('bd8fb6c9-6fb0-4c3b-b256-1a65e7f65ecd',{ts '2010-03-03 18:32:26.790'},'admin',{ts '2010-03-03 18:32:26.790'},null,{d '2010-02-22'},null,null,null);
--INSERT INTO "public"."wf_calendar" (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) VALUES ('c2c7c0ab-e27b-44f9-9415-a86b27cc96cf',{ts '2010-03-03 18:32:26.790'},'admin',{ts '2010-03-03 18:32:26.790'},null,{d '2010-11-04'},null,null,null);
--INSERT INTO "public"."wf_calendar" (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) VALUES ('c3f16a43-f808-4ef0-8da9-e88c68e1cb6e',{ts '2010-03-03 18:32:26.790'},'admin',{ts '2010-03-03 18:32:26.790'},null,{d '2010-01-04'},null,null,null);
INSERT INTO "public"."wf_calendar" (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) VALUES ('d06a8ef6-8324-4c1f-a022-eb939d048cb3',{ts '2010-03-03 18:32:26.790'},'admin',{ts '2010-03-03 18:32:26.790'},null,null,7,null,null);
INSERT INTO "public"."wf_calendar" (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) VALUES ('d31a2aec-cc9f-464a-8302-e43f8b92a8c5',{ts '2010-03-03 18:32:26.790'},'admin',{ts '2010-03-03 18:32:26.790'},null,null,3,'14:00','18:00');
--INSERT INTO "public"."wf_calendar" (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) VALUES ('d3c9f967-c2ab-4872-945d-f0e4b1b16888',{ts '2010-03-03 18:32:26.790'},'admin',{ts '2010-03-03 18:32:26.790'},null,{d '2010-05-01'},null,null,null);
INSERT INTO "public"."wf_calendar" (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) VALUES ('e87c4db4-eb7a-4a35-ace0-29b6bb63095f',{ts '2010-03-03 18:32:26.790'},'admin',{ts '2010-03-03 18:32:26.790'},null,null,2,'14:00','18:00');
--INSERT INTO "public"."wf_calendar" (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) VALUES ('f14cfb3b-274c-4501-b971-76a2f25c8bb2',{ts '2010-03-03 18:32:26.790'},'admin',{ts '2010-03-03 18:32:26.790'},null,{d '2010-03-08'},null,null,null);
--INSERT INTO "public"."wf_calendar" (id,create_ts,created_by,update_ts,updated_by,work_day,work_day_of_week,work_start_time,work_end_time) VALUES ('fc7f5b5a-7af0-4684-814e-1d66014725ac',{ts '2010-03-03 18:32:26.790'},'admin',{ts '2010-03-03 18:32:26.790'},null,{d '2010-01-02'},null,null,null);
--delete from WF_CALENDAR where work_day is not null;

INSERT INTO WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) VALUES (newid(), now(), 'admin', {d '2016-01-01'})^
INSERT INTO WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) VALUES (newid(), now(), 'admin', {d '2016-01-04'})^
INSERT INTO WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) VALUES (newid(), now(), 'admin', {d '2016-01-05'})^
INSERT INTO WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) VALUES (newid(), now(), 'admin', {d '2016-01-06'})^
INSERT INTO WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) VALUES (newid(), now(), 'admin', {d '2016-01-07'})^
INSERT INTO WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) VALUES (newid(), now(), 'admin', {d '2016-01-08'})^

INSERT INTO WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY, WORK_START_TIME, WORK_END_TIME) VALUES (newid(), now(), 'admin', {d '2016-02-20'},{t '09:00:00'},{t '13:00:00'})^
INSERT INTO WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY, WORK_START_TIME, WORK_END_TIME) VALUES (newid(), now(), 'admin', {d '2016-02-20'},{t '14:00:00'},{t '18:00:00'})^
INSERT INTO WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) VALUES (newid(), now(), 'admin', {d '2016-02-22'})^
INSERT INTO WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) VALUES (newid(), now(), 'admin', {d '2016-02-23'})^
INSERT INTO WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) VALUES (newid(), now(), 'admin', {d '2016-03-07'})^
INSERT INTO WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) VALUES (newid(), now(), 'admin', {d '2016-03-08'})^

INSERT INTO WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) VALUES (newid(), now(), 'admin', {d '2016-05-02'})^
INSERT INTO WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) VALUES (newid(), now(), 'admin', {d '2016-05-03'})^
INSERT INTO WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) VALUES (newid(), now(), 'admin', {d '2016-05-09'})^
INSERT INTO WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) VALUES (newid(), now(), 'admin', {d '2016-06-13'})^
INSERT INTO WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) VALUES (newid(), now(), 'admin', {d '2016-11-04'})^

INSERT INTO "public"."tm_priority" (id,name,order_no,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by) VALUES ('2562cb31-0ebc-477b-a124-1cc618108be3','Нормальный',3,{ts '2010-01-26 10:22:08.280'},'admin',2,{ts '2010-01-26 14:39:36.920'},'admin',null,null);
INSERT INTO "public"."tm_priority" (id,name,order_no,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by) VALUES ('36518fcf-6fe9-42a9-ada2-e45b7e545cfa','Высокий',2,{ts '2010-01-26 10:22:12.300'},'admin',2,{ts '2010-01-26 14:39:39.520'},'admin',null,null);
INSERT INTO "public"."tm_priority" (id,name,order_no,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by) VALUES ('6d40219c-b258-45f0-96ef-2d3da048e76f','Низкий',4,{ts '2010-01-26 10:22:18.690'},'admin',2,{ts '2010-01-26 14:39:41.880'},'admin',null,null)^
INSERT INTO "public"."tm_priority" (id,name,order_no,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by) VALUES ('9567d315-1880-46ac-94ee-65de44e7e3e4','Критический',1,{ts '2010-03-04 10:16:43.750'},'admin',2,{ts '2010-03-04 10:17:31.560'},'admin',null,null)^

------------------------------------------------------------------------------------------------------------

insert into DF_DOC_TYPE (ID, CREATE_TS, CREATED_BY, NAME, DISCRIMINATOR)
values ('1665ef30-2b44-11df-b1c6-bf8783a93da6', current_timestamp, 'admin', 'df$SimpleDoc', 110)^

insert into DF_DOC_TYPE (ID, CREATE_TS, CREATED_BY, NAME, DISCRIMINATOR,FIELDS_XML)
values ('ae67f5f6-35aa-11df-a04a-3345dd531def', current_timestamp, 'admin', 'df$Contract', 120,
'<?xml version="1.0" encoding="UTF-8"?>
<fields>
    <field name="finishDatePlan" visible="false" required="false"/>
    <field name="resolution" visible="false" required="false"/>
</fields>
')^

insert into DF_DOC_TYPE (ID, CREATE_TS, CREATED_BY, NAME, DISCRIMINATOR)
values ('5aa5ef34-af44-11df-b1c6-af3783a11da6', current_timestamp, 'admin', 'df$MeetingDoc', 130)^

------------------------------------------------------------------------------------------------------------

insert into DF_CURRENCY (ID, NAME, CODE, DIGITAL_CODE) values ('409bd4d2-cfa2-11e0-84b0-13f6ef08af82', 'Рубль', 'RUB', '643');

------------------------------------------------------------------------------------------------------------

alter table WF_ATTACHMENT add PORTAL_PUBLISH_STATE varchar(5)^
alter table WF_ATTACHMENT add MAIN boolean;

ALTER TABLE WF_ATTACHMENT add ORGANIZATION_ID uuid^
alter table WF_ATTACHMENT add constraint FK_WF_ATTACHMENT_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^

ALTER TABLE WF_ATTACHMENT add CORRESPONDENT_ID uuid^
alter table WF_ATTACHMENT add constraint FK_WF_ATTACHMENT_CORRESPONDENT foreign key (CORRESPONDENT_ID) references DF_CORRESPONDENT (ID)^

------------------------------------------------------------------------------------------------------------

insert into TM_SCHEDULE_ACTION_TYPE (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,screen_id,entity_name,processor_class_name) values (newid(),now(),USER,7,now(),USER,null,null,'Запуск задачи','tm$StartTaskScheduleAction.edit','tm$StartTaskScheduleAction','com.haulmont.thesis.core.schedule.ext.StartTaskScheduleActionProcessor');

------------------------------------------------------------------------------------------------------------
insert into WF_ATTACHMENTTYPE (ID,CODE,ISDEFAULT)
values ('144feeb6-5ad8-11e0-a80d-cf59394498a5','AttachmentType.executorAttachment',false)^
-------------------------------------------------------------------------------------------------------------
insert into SEC_PERMISSION (ID, PERMISSION_TYPE, TARGET, VALUE, ROLE_ID) values (newid(), 20, 'df$DocReceivingMethod:create', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c');
insert into SEC_PERMISSION (ID, PERMISSION_TYPE, TARGET, VALUE, ROLE_ID) values (newid(), 20, 'df$DocReceivingMethod:update', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c');
insert into SEC_PERMISSION (ID, PERMISSION_TYPE, TARGET, VALUE, ROLE_ID) values (newid(), 20, 'df$DocReceivingMethod:delete', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c');

insert into SEC_PERMISSION (ID, PERMISSION_TYPE, TARGET, VALUE, ROLE_ID) values (newid(), 20, 'df$DocReceivingMethod:create', 1, '0038f3db-ac9c-4323-83e7-356996cc63ae');
insert into SEC_PERMISSION (ID, PERMISSION_TYPE, TARGET, VALUE, ROLE_ID) values (newid(), 20, 'df$DocReceivingMethod:update', 1, '0038f3db-ac9c-4323-83e7-356996cc63ae');
insert into SEC_PERMISSION (ID, PERMISSION_TYPE, TARGET, VALUE, ROLE_ID) values (newid(), 20, 'df$DocReceivingMethod:delete', 1, '0038f3db-ac9c-4323-83e7-356996cc63ae');

insert into SEC_PERMISSION (ID, PERMISSION_TYPE, TARGET, VALUE, ROLE_ID) values (newid(), 20, 'df$DocReceivingMethod:create', 1, '7091f5ef-a77a-450a-834a-39406885676e');
insert into SEC_PERMISSION (ID, PERMISSION_TYPE, TARGET, VALUE, ROLE_ID) values (newid(), 20, 'df$DocReceivingMethod:update', 1, '7091f5ef-a77a-450a-834a-39406885676e');
insert into SEC_PERMISSION (ID, PERMISSION_TYPE, TARGET, VALUE, ROLE_ID) values (newid(), 20, 'df$DocReceivingMethod:delete', 1, '7091f5ef-a77a-450a-834a-39406885676e');


INSERT INTO SEC_PERMISSION (ID, PERMISSION_TYPE, TARGET, VALUE, ROLE_ID)
VALUES ('8758c060-5c4d-11e0-8696-33f82bb15aff', 40, 'cuba.gui.appFolder.global',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c')^
INSERT INTO SEC_PERMISSION (ID,  PERMISSION_TYPE, TARGET, VALUE, ROLE_ID)
VALUES ('8f80f37a-5c4d-11e0-af0f-63f861b2275a', 40, 'cuba.gui.searchFolder.global',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c')^

INSERT INTO SEC_PERMISSION (ID,  PERMISSION_TYPE, TARGET, VALUE, ROLE_ID)
VALUES ('ec19b976-fa65-11e0-92be-a345180a50f5', 40, 'cuba.gui.presentations.global',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c')^

INSERT INTO SEC_PERMISSION (ID,  PERMISSION_TYPE, TARGET, VALUE, ROLE_ID)
VALUES ('566e2541-b36b-4ea6-ad37-47b95a7381e2', 10, 'report$Report.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c')^
-------------------------------------------------------------------------------------------------------------
create index idx_df_doc_office_data_doc on df_doc_office_data (doc_id)^

create index idx_tm_card_project_card on tm_card_project (card_id)^

create index idx_tm_task_finish_date_plan on tm_task (finish_date_plan)^

create index idx_tm_schedule_trigger_active on tm_schedule_trigger (active)^

create index idx_df_doc_transfer_log_doc_office_data on df_doc_transfer_log (doc_office_data_id)^

create index idx_df_doc_office_data_response_to_doc on df_doc_office_data (response_to_doc_id)^

create index idx_df_doc_version_of on df_doc (version_of_id)^

create index idx_df_doc_is_template on df_doc (is_template)^

create index idx_tm_task_version_task on tm_task_version (task_id)^

create index idx_employee_department on df_employee(department_id)^

create index idx_department_correspondent on df_department(correspondent_id)^

----------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW df_department_membership AS
WITH RECURSIVE hdep (correspondent_id, parent_department_id , level, top_level_id) AS
         (
         SELECT correspondent_id, parent_department_id, 0 as level, correspondent_id
         FROM df_department
         UNION ALL
         SELECT d1.correspondent_id, d1.parent_department_id,  level + 1, d2.top_level_id
         FROM df_department as d1 INNER JOIN hdep as d2 ON d1.parent_department_id = d2.correspondent_id
          )
select distinct cast(null as uuid) as id, e.user_id, h.correspondent_id as department_id
from hdep h join df_employee_department_position_relation edr
on edr.department_id=h.top_level_id and edr.delete_ts is null
	join df_employee e
	on e.correspondent_id = edr.employee_id
	and e.user_id is not null
	and (h.top_level_id=h.correspondent_id
	     or exists (
			select r.id from sec_role r join sec_user_role ur
			on r.id=ur.role_id
			and ur.user_id=e.user_id
			and ur.delete_ts is null
			and r.name = 'DepartmentChief'))
^

---------------------------------------------------------------------------------------------------------------
delete from SEC_FILTER sf where sf.id = 'b61d18cb-e79a-46f3-b16d-eaf4aebb10dd'^

-----------------------------Plugin for hierarchy query--------------------------------------------------------
CREATE OR REPLACE FUNCTION tableFuncInit()
RETURNS integer
AS $BODY$
DECLARE
	cnt integer = 0;
BEGIN
cnt = (SELECT count (*) FROM pg_type WHERE typname='tablefunc_crosstab_2' );
if (cnt = 0) then
	/* $PostgreSQL: pgsql/contrib/tablefunc/tablefunc.sql.in,v 1.12 2007/11/13 04:24:29 momjian Exp $ */
	-- Adjust this setting to control where the objects get created.
	SET search_path = public;

	CREATE OR REPLACE FUNCTION normal_rand(int4, float8, float8)
	RETURNS setof float8
	AS '$libdir/tablefunc','normal_rand'
	LANGUAGE C VOLATILE STRICT;

	-- the generic crosstab function:
	CREATE OR REPLACE FUNCTION crosstab(text)
	RETURNS setof record
	AS '$libdir/tablefunc','crosstab'
	LANGUAGE C STABLE STRICT;

	-- examples of building custom type-specific crosstab functions:
	CREATE TYPE tablefunc_crosstab_2 AS
	(
		row_name TEXT,
		category_1 TEXT,
		category_2 TEXT
	);

	CREATE TYPE tablefunc_crosstab_3 AS
	(
		row_name TEXT,
		category_1 TEXT,
		category_2 TEXT,
		category_3 TEXT
	);

	CREATE TYPE tablefunc_crosstab_4 AS
	(
		row_name TEXT,
		category_1 TEXT,
		category_2 TEXT,
		category_3 TEXT,
		category_4 TEXT
	);

	CREATE OR REPLACE FUNCTION crosstab2(text)
	RETURNS setof tablefunc_crosstab_2
	AS '$libdir/tablefunc','crosstab'
	LANGUAGE C STABLE STRICT;

	CREATE OR REPLACE FUNCTION crosstab3(text)
	RETURNS setof tablefunc_crosstab_3
	AS '$libdir/tablefunc','crosstab'
	LANGUAGE C STABLE STRICT;

	CREATE OR REPLACE FUNCTION crosstab4(text)
	RETURNS setof tablefunc_crosstab_4
	AS '$libdir/tablefunc','crosstab'
	LANGUAGE C STABLE STRICT;

	-- obsolete:
	CREATE OR REPLACE FUNCTION crosstab(text,int)
	RETURNS setof record
	AS '$libdir/tablefunc','crosstab'
	LANGUAGE C STABLE STRICT;

	CREATE OR REPLACE FUNCTION crosstab(text,text)
	RETURNS setof record
	AS '$libdir/tablefunc','crosstab_hash'
	LANGUAGE C STABLE STRICT;

	CREATE OR REPLACE FUNCTION connectby(text,text,text,text,int,text)
	RETURNS setof record
	AS '$libdir/tablefunc','connectby_text'
	LANGUAGE C STABLE STRICT;

	CREATE OR REPLACE FUNCTION connectby(text,text,text,text,int)
	RETURNS setof record
	AS '$libdir/tablefunc','connectby_text'
	LANGUAGE C STABLE STRICT;

	-- These 2 take the name of a field to ORDER BY as 4th arg (for sorting siblings)

	CREATE OR REPLACE FUNCTION connectby(text,text,text,text,text,int,text)
	RETURNS setof record
	AS '$libdir/tablefunc','connectby_text_serial'
	LANGUAGE C STABLE STRICT;

	CREATE OR REPLACE FUNCTION connectby(text,text,text,text,text,int)
	RETURNS setof record
	AS '$libdir/tablefunc','connectby_text_serial'
	LANGUAGE C STABLE STRICT;
end if;
return 0;
END;
$BODY$
LANGUAGE plpgsql;
^
select tableFuncInit();
^
drop function if exists tableFuncInit();
^

---------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION create_or_update_sec_permission
(
  varchar(255), -- sec_role.name
  varchar(100), -- sec_permission.target
  integer,  -- sec_permission.type
  integer  -- sec_permission.value
) RETURNS varchar AS $BODY$
DECLARE
     r_name alias for $1;
     p_target alias for $2;
     p_type alias for $3;
     p_value alias for $4;

     p_id uuid;
BEGIN
    p_id = NULL;
    select p.id from SEC_PERMISSION p
        join SEC_ROLE r on r.id = p.role_id
        where r.name = r_name and p.target = p_target limit 1 into p_id;
--   return p_id;
   if  p_id is not null  then
        update SEC_PERMISSION set  PERMISSION_TYPE = p_type, value = p_value
        where id = p_id;
        return 'SEC_PERMISSION record was updated';
    else
        insert into SEC_PERMISSION (
          id,
          create_ts,
          created_by,
          version,
          PERMISSION_TYPE,
          target,
          value,
          role_id
        ) values (
          newid(),
          now(),
          USER,
          1,
          p_type,
          p_target,
          p_value,
          (select id from sec_role where name=r_name)
        );
        return 'SEC_PERMISSION record was created';
    end if;
END;
$BODY$ LANGUAGE plpgsql;

^
select create_or_update_sec_permission('ReferenceEditor', 'df$Department:update', 20, 1)^

select create_or_update_sec_permission('SimpleUser', 'report$ReportGroup.browse', 10, 0)^
select create_or_update_sec_permission('Administrators', 'report$ReportGroup.browse', 10, 1)^
select create_or_update_sec_permission('Administrators', 'tm$Task:delete', 20, 1)^

select create_or_update_sec_permission('ReferenceEditor', 'df$CorrespondentAttachment:create', 20, 1)^
select create_or_update_sec_permission('ReferenceEditor', 'df$CorrespondentAttachment:update', 20, 1)^
select create_or_update_sec_permission('ReferenceEditor', 'df$CorrespondentAttachment:delete', 20, 1)^

select create_or_update_sec_permission('Administrators', 'df$CorrespondentAttachment:create', 20, 1)^
select create_or_update_sec_permission('Administrators', 'df$CorrespondentAttachment:update', 20, 1)^
select create_or_update_sec_permission('Administrators', 'df$CorrespondentAttachment:delete', 20, 1)^

select create_or_update_sec_permission('SimpleUser', 'df$CorrespondentAttachment:create', 20, 0)^
select create_or_update_sec_permission('SimpleUser', 'df$CorrespondentAttachment:update', 20, 0)^
select create_or_update_sec_permission('SimpleUser', 'df$CorrespondentAttachment:delete', 20, 0)^

select create_or_update_sec_permission('ReferenceEditor', 'df$OrganizationAttachment:create', 20, 1)^
select create_or_update_sec_permission('ReferenceEditor', 'df$OrganizationAttachment:update', 20, 1)^
select create_or_update_sec_permission('ReferenceEditor', 'df$OrganizationAttachment:delete', 20, 1)^

select create_or_update_sec_permission('Administrators', 'df$OrganizationAttachment:create', 20, 1)^
select create_or_update_sec_permission('Administrators', 'df$OrganizationAttachment:update', 20, 1)^
select create_or_update_sec_permission('Administrators', 'df$OrganizationAttachment:delete', 20, 1)^

select create_or_update_sec_permission('SimpleUser', 'df$OrganizationAttachment:create', 20, 0)^
select create_or_update_sec_permission('SimpleUser', 'df$OrganizationAttachment:update', 20, 0)^
select create_or_update_sec_permission('SimpleUser', 'df$OrganizationAttachment:delete', 20, 0)^

select create_or_update_sec_permission('Administrators', 'df$TypicalResolution:create', 20, 1)^
select create_or_update_sec_permission('Administrators', 'df$TypicalResolution:update', 20, 1)^
select create_or_update_sec_permission('Administrators', 'df$TypicalResolution:delete', 20, 1)^

select create_or_update_sec_permission('SimpleUser', 'df$DocKind.edit', 10, 0)^
select create_or_update_sec_permission('SimpleUser', 'df$DocType.edit', 10, 0)^
select create_or_update_sec_permission('SimpleUser', 'sec$Role.edit', 10, 0)^
select create_or_update_sec_permission('SimpleUser', 'tm$TaskType.edit', 10, 0)^

insert into SEC_CONSTRAINT (ID,CREATE_TS,CREATED_BY,VERSION, ENTITY_NAME,JOIN_CLAUSE,WHERE_CLAUSE,GROUP_ID) values ('802ffec0-4035-11e2-96bd-67dbe6e43aaa', CURRENT_TIMESTAMP, USER, 1, 'df$TypicalResolution', null, '({E}.global = true OR {E}.substitutedCreator.id = :session$userId)', '8e6306e2-9e10-414a-b437-24c91ffef804')^
insert into SEC_CONSTRAINT (ID,CREATE_TS,CREATED_BY,VERSION, ENTITY_NAME,JOIN_CLAUSE,WHERE_CLAUSE,GROUP_ID) values ('8847523e-4035-11e2-983c-93910de3e507', CURRENT_TIMESTAMP, USER, 1, 'df$TypicalResolution', null, '({E}.global = true OR {E}.substitutedCreator.id = :session$userId)', '7dfe5c72-073f-4e1e-9cf4-1b1bad9c0093')^
insert into SEC_CONSTRAINT (ID,CREATE_TS,CREATED_BY,VERSION, ENTITY_NAME,JOIN_CLAUSE,WHERE_CLAUSE,GROUP_ID) values ('8ce85a54-4035-11e2-93ae-27ba989b01e9', CURRENT_TIMESTAMP, USER, 1, 'df$TypicalResolution', null, '({E}.global = true OR {E}.substitutedCreator.id = :session$userId)', '8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb')^
insert into SEC_CONSTRAINT (ID,CREATE_TS,CREATED_BY,VERSION, ENTITY_NAME,JOIN_CLAUSE,WHERE_CLAUSE,GROUP_ID) values ('91020d74-4035-11e2-989b-3366d8647d18', CURRENT_TIMESTAMP, USER, 1, 'df$TypicalResolution', null, '({E}.global = true OR {E}.substitutedCreator.id = :session$userId)', '9fa89a54-9ffa-11e1-b13e-9f4a54bff17e')^

update sys_category_attr set data_type = 'com.haulmont.cuba.security.entity.User' where data_type = 'com.haulmont.thesis.core.entity.TmUser';

insert into SEC_PERMISSION (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, PERMISSION_TYPE, TARGET, VALUE, ROLE_ID)
select newid(), null, null, null, null, null, null, null, 40, 'thesis.userGroup.edit.global', 1, ID from SEC_ROLE where NAME in ('Administrators', 'ReferenceEditor')
^

insert into SEC_PERMISSION (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, PERMISSION_TYPE, TARGET, VALUE, ROLE_ID)
select newid(), null, null, null, null, null, null, null, 40, 'thesis.userGroup.edit.global', 0, ID from SEC_ROLE where NAME = 'SimpleUser'
^

insert into SEC_CONSTRAINT (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, ENTITY_NAME, JOIN_CLAUSE, WHERE_CLAUSE, GROUP_ID)
select newid(), now(), null, 1, null, null, null, null, 'wf$UserGroup', null, '({E}.substitutedCreator.id = :session$userId or {E}.global = true)', ID from SEC_GROUP where ID <> '0fa2b1a5-1d68-4d69-9fbd-dff348347f93'
^

insert into sec_permission (id, create_ts, created_by, PERMISSION_TYPE, target, value, role_id)
values ('e91407e0-725b-11e1-9738-4f4aa51f761f', now(), 'admin', 10, 'serverLog', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c')
^

alter table DF_CATEGORY add constraint FK_DF_CATEGORY_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
alter table DF_OFFICE_FILE add constraint FK_DF_OFFICE_FILE_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
alter table DF_TYPICAL_RESOLUTION add constraint FK_DF_TYPICAL_RESOLUTION_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
alter table TM_PROJECT add constraint FK_TM_PROJECT_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
alter table TM_PROJECT_GROUP add constraint FK_TM_PROJECT_GROUP_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
alter table TM_START_TASK_SCHEDULE_ACTION add constraint FK_TM_START_TASK_SCHEDULE_ACTION_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
alter table TM_TASK add constraint FK_TM_TASK_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
alter table TM_TASK_PATTERN add constraint FK_TM_TASK_PATTERN_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
alter table TM_TASK_VERSION add constraint FK_TM_TASK_VERSION_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
alter table TM_TASK_GROUP add constraint FK_TM_TASK_GROUP_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
alter table TM_TASK_PATTERN_GROUP add constraint FK_TM_TASK_PATTERN_GROUP_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
alter table SEC_USER add constraint FK_SEC_USER_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
alter table WF_USER_GROUP add constraint FK_WF_USER_GROUP_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^

alter table DF_DOC add IMPORTED boolean^
update DF_DOC set IMPORTED = false^

select create_or_update_sec_permission('Administrators', 'df$Organization.browse', 10, 1)^

insert into SEC_USER (ID, CREATE_TS, VERSION, LOGIN, LOGIN_LC, PASSWORD, NAME, GROUP_ID, ACTIVE)
values ('b18e3c10-0328-11e2-969a-fb0e8fd8c622', now(), 0, 'system', 'system', '6a9e40c1c2439a85035943bda146d965', 'System user', '0fa2b1a5-1d68-4d69-9fbd-dff348347f93', true)^

select create_or_update_sec_permission('Administrators', 'wf$UserNotifiedBySms.browse', 10, 1)^
select create_or_update_sec_permission('SimpleUser', 'wf$UserNotifiedBySms.browse', 10, 0)^
select create_or_update_sec_permission('Administrators', 'wf$SendingSms.browse', 10, 1)^
select create_or_update_sec_permission('SimpleUser', 'wf$SendingSms.browse', 10, 0)^
select create_or_update_sec_permission('SimpleUser', 'df$FastRegistration', 10, 0)^
select create_or_update_sec_permission('Administrators', 'df$FastRegistration', 10, 1)^
select create_or_update_sec_permission('doc_secretary', 'df$FastRegistration', 10, 1)^

select create_or_update_sec_permission('Administrators', 'userMobileBrowse', 10, 1)^
select create_or_update_sec_permission('SimpleUser', 'userMobileBrowse', 10, 0)^

select create_or_update_sec_permission('Administrators', 'df$AppIntegrationLog.browse', 10, 1)^
select create_or_update_sec_permission('SimpleUser', 'df$AppIntegrationLog.browse', 10, 0)^
select create_or_update_sec_permission('AppIntegrationRole', 'df$AppIntegrationLog.browse', 10, 1)^

INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id)
VALUES ('4b744176-3f88-11e2-b1f4-2387c06904ee',now(),'system',1,20,'df$Position:update',1,(select id from SEC_ROLE where name = 'Administrators'))^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id)
VALUES ('fa9dac64-3f88-11e2-baa9-abdc5402291f',now(),'system',1,20,'df$Position:delete',1,(select id from SEC_ROLE where name = 'Administrators'))^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id)
VALUES ('fade084a-3f88-11e2-bfbc-1754d44c59ad',now(),'system',1,20,'df$Position:read',1,(select id from SEC_ROLE where name = 'Administrators'))^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id)
VALUES ('fae06a86-3f88-11e2-b386-4ffc775f57ea',now(),'system',1,20,'df$Position:create',1,(select id from SEC_ROLE where name = 'Administrators'))^

INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id)
VALUES ('fae52ef4-3f88-11e2-8581-470be131402f',now(),'system',1,20,'df$Position:update',1,(select id from SEC_ROLE where name = 'ReferenceEditor'))^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id)
VALUES ('fae52ef4-3f88-11e2-8a34-cf46cd2037e8',now(),'system',1,20,'df$Position:delete',1,(select id from SEC_ROLE where name = 'ReferenceEditor'))^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id)
VALUES ('fae9f362-3f88-11e2-ba71-2bf955c28f6c',now(),'system',1,20,'df$Position:read',1,(select id from SEC_ROLE where name = 'ReferenceEditor'))^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id)
VALUES ('faf11a0c-3f88-11e2-8835-ef8481161ae1',now(),'system',1,20,'df$Position:create',1,(select id from SEC_ROLE where name = 'ReferenceEditor'))^

INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id)
VALUES ('fb01c992-3f88-11e2-8845-c3747e4f7b90',now(),'system',1,20,'df$Position:update',0,(select id from SEC_ROLE where name = 'SimpleUser'))^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id)
VALUES ('fb042bce-3f88-11e2-ac1c-9fc28b598153',now(),'system',1,20,'df$Position:delete',0,(select id from SEC_ROLE where name = 'SimpleUser'))^
INSERT INTO sec_permission (id,create_ts,created_by,version,PERMISSION_TYPE,target,value,role_id)
VALUES ('fb068e00-3f88-11e2-a384-23c38be8091f',now(),'system',1,20,'df$Position:create',0,(select id from SEC_ROLE where name = 'SimpleUser'))^


---------------------------------------------------------------------------------------------------

insert into DF_IMPORT_DATA_TYPE (id, create_ts, created_by, version, name, meta_class_name) values
('ff801f90-a389-11e2-a895-f7261fdb7f5a', now(), 'admin', 1 , 'Документ' , 'df$SimpleDoc'),
('33433e50-a38c-11e2-9506-a71c3d8f3fe2', now(), 'admin', 1, 'Договор' , 'df$Contract');

insert INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type) values

  -------------------------          df$SimpleDoc               ----------------------------------
 (newid(), now(), 'admin', 1, 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Категория', 'docCategory', 'df$Category'),
 (newid(), now(), 'admin', 1, 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Номер', 'number', 'String'),
 (newid(), now(), 'admin', 1, 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Вид', 'docKind', 'df$DocKind'),
 (newid(), now(), 'admin', 1, 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Подразделение', 'department', 'df$Department'),
 (newid(), now(), 'admin', 1, 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Куратор', 'owner', 'df$Employee'),
 (newid(), now(), 'admin', 1, 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Дата', 'date', 'Date'),
 (newid(), now(), 'admin', 1, 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Отправитель', 'sender', 'df$Company'),
 (newid(), now(), 'admin', 1, 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Рег.номер', 'regNo', 'String'),
 (newid(), now(), 'admin', 1, 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Адресат', 'docOfficeDataAddressees', 'df$Company'),
 (newid(), now(), 'admin', 1, 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Содержание', 'comment', 'String'),
 (newid(), now(), 'admin', 1, 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Дата регистрации', 'regDate', 'Date'),
 (newid(), now(), 'admin', 1, 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Канцелярский вид', 'docOfficeDocKind', 'DocOfficeDocKind'),
 (newid(), now(), 'admin', 1, 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Файлы', 'attachments', 'wf$CardAttachment'),
 (newid(), now(), 'admin', 1, 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Тема', 'theme', 'String'),
 (newid(), now(), 'admin', 1, 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Основание для приказа', 'orderCause', 'String'),
 (newid(), now(), 'admin', 1, 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Текст приказа', 'orderText', 'String'),


---------------------------            df$Contract               --------------------------------------
 (newid(), now(), 'admin', 1, '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Сумма', 'amount', 'BigDecimal'),
 (newid(), now(), 'admin', 1, '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Описание', 'comment', 'String'),
 (newid(), now(), 'admin', 1, '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Ставка, %', 'vatRate', 'BigDecimal'),
 (newid(), now(), 'admin', 1, '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Конт.лицо', 'contactPerson', 'df$ContactPerson'),
 (newid(), now(), 'admin', 1, '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Вид', 'docKind', 'df$DocKind'),
 (newid(), now(), 'admin', 1, '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Активный', 'active', 'Boolean'),
 (newid(), now(), 'admin', 1, '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Сумма НДС', 'vatAmount', 'BigDecimal'),
 (newid(), now(), 'admin', 1, '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'НДС в сумме', 'vatInclusive', 'Boolean'),
 (newid(), now(), 'admin', 1, '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Дата', 'date', 'Date'),
 (newid(), now(), 'admin', 1, '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Контрагент', 'contractor', 'df$Company'),
 (newid(), now(), 'admin', 1, '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Номер', 'number', 'String'),
 (newid(), now(), 'admin', 1, '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Подразделение', 'department', 'df$Department'),
 (newid(), now(), 'admin', 1, '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Организация', 'organization', 'df$Organization'),
 (newid(), now(), 'admin', 1, '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Условия платежа', 'paymentConditions', 'String'),
 (newid(), now(), 'admin', 1, '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Куратор', 'owner', 'df$Employee'),
 (newid(), now(), 'admin', 1, '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Начало обязательств', 'liabilityStart', 'Date'),
 (newid(), now(), 'admin', 1, '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Окончание обязательств', 'liabilityEnd', 'Date'),
 (newid(), now(), 'admin', 1, '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Категория', 'docCategory', 'df$Category'),
 (newid(), now(), 'admin', 1, '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Файлы', 'attachments', 'wf$CardAttachment'),
 (newid(), now(), 'admin', 1, '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Валюта', 'currency', 'df$Currency')^

select create_or_update_sec_permission('Administrators', 'df$ImportDataType.browse', 10, 1)^
select create_or_update_sec_permission('SimpleUser', 'df$ImportDataType.browse', 10, 0)^
select create_or_update_sec_permission('Administrators', 'tm$TaskType.browse', 10, 1)^
select create_or_update_sec_permission('Administrators', 'tm$TaskType.edit', 10, 1)^

select create_or_update_sec_permission('Administrators', 'transferOfficeFile', 10, 1)^
select create_or_update_sec_permission('SimpleUser', 'transferOfficeFile', 10, 0)^

insert into SYS_CONFIG(id, create_ts, created_by, version, name, value) values
('a64df96a-25d9-11e3-b75e-93ea4236d5e4', now(), 'admin', 1, 'com.haulmont.thesis.core.config.organizationDefault', 'df$Organization-a851beaf-6890-4ab2-b847-b7a810c4c2b9'),
('0d8f9e98-25db-11e3-8c50-4f96a0994af2', now(), 'admin', 1, 'com.haulmont.thesis.core.config.currencyDefault', 'df$Currency-409bd4d2-cfa2-11e0-84b0-13f6ef08af82'),
('150b663e-25db-11e3-9d36-e3b0db5c9947', now(), 'admin', 1, 'com.haulmont.thesis.core.config.priorityDefault', 'tm$Priority-2562cb31-0ebc-477b-a124-1cc618108be3'),
('1dacf0be-25db-11e3-9db8-671686f3c707', now(), 'admin', 1, 'com.haulmont.thesis.core.config.taskTypeDefault', 'tm$TaskType-836d02a0-68a9-4aa5-b11a-08e9b32c589b-edit'),
('23dea3c4-25db-11e3-acc4-df8f5c432b46', now(), 'admin', 1, 'com.haulmont.thesis.core.config.incomeNumeratorDefault', 'df$Numerator-bebc21e2-fce0-40c6-9202-7cffff7cf88e'),
('2b651a1a-25db-11e3-9ee7-bfa91abd62c7', now(), 'admin', 1, 'com.haulmont.thesis.core.config.outcomeNumeratorDefault', 'df$Numerator-5618547c-a4c9-4bfd-a71e-d884cf49df57'),
('30654a26-25db-11e3-84a5-a391cca407b5', now(), 'admin', 1, 'com.haulmont.thesis.core.config.internalNumeratorDefault', 'df$Numerator-36708c7f-e232-4451-a239-3f5a8fa10726'),
('35c57702-25db-11e3-92d7-c76ffa73b284', now(), 'admin', 1, 'com.haulmont.thesis.core.config.defaultDocKind', 'df$DocKind-c40ea551-d399-4a11-b6be-347ca5f27837'),
('ab123702-25db-11e3-92d7-c12ffa73b67a', now(), 'admin', 1, 'com.haulmont.thesis.core.config.defaultContractDocKind', 'df$DocKind-9cd678e3-7978-4f53-a503-a36bce3a76d6'),
('c40ea551-d399-4a11-b6be-347ca5f27837', now(), 'admin', 1, 'com.haulmont.thesis.core.config.defaultLetterDocKind', 'df$DocKind-c40ea551-d399-4a11-b6be-347ca5f27837'),
('2e7792fe-2ccb-11e3-9489-8b3b585569ea', now(), 'admin', 1, 'thesis.firstInstallationThesisVersion', '3.6')^

select create_or_update_sec_permission('SimpleUser', 'portalIntegration', 10, 0)^
select create_or_update_sec_permission('SimpleUser', 'tm$User.edit:fieldGroupLeft', 50, 1)^
select create_or_update_sec_permission('SimpleUser', 'tm$User.edit:fieldGroupRight', 50, 1)^
select create_or_update_sec_permission('SimpleUser', 'tm$User.edit:split', 50, 0)^

select create_or_update_sec_permission('SimpleUser', 'sec$User:position', 30, 1)^
select create_or_update_sec_permission('SimpleUser', 'sec$User:password', 30, 1)^
select create_or_update_sec_permission('SimpleUser', 'sec$User:organization', 30, 1)^
select create_or_update_sec_permission('SimpleUser', 'sec$User:ipMask', 30, 1)^
select create_or_update_sec_permission('SimpleUser', 'sec$User:name', 30, 1)^
select create_or_update_sec_permission('SimpleUser', 'sec$User:login', 30, 1)^
select create_or_update_sec_permission('SimpleUser', 'sec$User:firstName', 30, 1)^
select create_or_update_sec_permission('SimpleUser', 'sec$User:middleName', 30, 1)^
select create_or_update_sec_permission('SimpleUser', 'sec$User:lastName', 30, 1)^
select create_or_update_sec_permission('SimpleUser', 'sec$User:changePasswordAtNextLogon', 30, 1)^
select create_or_update_sec_permission('SimpleUser', 'sec$User:email', 30, 2)^
select create_or_update_sec_permission('SimpleUser', 'sec$User:active', 30, 1)^
select create_or_update_sec_permission('SimpleUser', 'sec$User:language', 30, 1)^
select create_or_update_sec_permission('SimpleUser', 'sec$User:departmentCode', 30, 1)^
select create_or_update_sec_permission('SimpleUser', 'sec$User:group', 30, 1)^
select create_or_update_sec_permission('SimpleUser', 'sec$User:isMobile', 30, 1)^
select create_or_update_sec_permission('SimpleUser', 'sec$User:activeDirectoryID', 30, 1)^
select create_or_update_sec_permission('SimpleUser', 'sec$User:timeZone', 30, 1)^
select create_or_update_sec_permission('SimpleUser', 'sec$User:timeZoneAuto', 30, 1)^

select create_or_update_sec_permission('SimpleUser', 'certificationAuthoritySignatureRequestForm', 10, 0)^
select create_or_update_sec_permission('Administrators', 'certificationAuthoritySignatureRequestForm', 10, 1)^

select create_or_update_sec_permission('schedule_task_creator', 'tm$TaskPattern.browse', 10, 1)^

alter table SEC_USER alter column POSITION_ type VARCHAR(400)^

create table TS_REMOTE_CARD_STATE (
    id uuid,
    create_ts timestamp,
    created_by varchar(50),
    update_ts timestamp,
    updated_by varchar(50),
    ---
    card_id uuid,
    server_id varchar(50),
    state varchar(255),
    constraint fk_remote_card_state_to_card foreign key(card_id) references wf_card(id),
    primary key(id)
);

create unique index idx_ts_remote_card_state_unique on ts_remote_card_state (card_id, server_id);

create index IDX_WF_ATTACHMENT_FILE_ID
  on wf_attachment(file_id);

create index IDX_WF_ATTACHMENT_CORRESPONDENT_ID
  on wf_attachment(correspondent_id);

create index IDX_WF_ATTACHMENT_ORGANIZATION_ID
  on wf_attachment(organization_id);

create index IDX_WF_ATTACHMENT_RECOGNIZED_FILE_ID
  on wf_attachment(recognized_file_id);

create index IDX_WF_ATTACHMENT_TASK_GROUP_ID
  on wf_attachment(task_group_id);

insert into sec_presentation (id,component,name,is_auto_save,xml) values (newid(),'[df$SimpleDoc.browse].cardsTable','Основная',false,
'<?xml version="1.0" encoding="UTF-8"?>
<presentation>
<columns>
<columns id="docKind" visible="true"/>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="currentActorsString" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="owner" visible="false"/>
<columns id="number" visible="true"/>
<columns id="regNo" visible="true"/>
<columns id="date" visible="true"/>
<columns id="proc.name" visible="true"/>
<columns id="locState" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="resolution" visible="false"/>
<columns id="endorsementStartDate" visible="false"/>
<columns id="endorsementEndDate" visible="false"/>
<columns id="approvalDate" visible="false"/>
<columns id="docCategory" visible="false"/>
<columns id="hasAttributes" visible="false"/>
<columns id="important" visible="true"/>
<columns id="theme" visible="true"/>
<columns id="project" visible="false"/>
</columns>
<groupProperties/>
</presentation>
');

insert into sec_presentation (id,component,name,is_auto_save,xml) values (newid(),'[df$SimpleDoc.browse].cardsTable','Расширенная',false,
'<?xml version="1.0" encoding="UTF-8"?>
<presentation>
<columns>
<columns id="docKind" visible="true"/>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="currentActorsString" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="owner" visible="true"/>
<columns id="number" visible="true"/>
<columns id="regNo" visible="true"/>
<columns id="date" visible="true"/>
<columns id="proc.name" visible="true"/>
<columns id="locState" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="resolution" visible="true"/>
<columns id="endorsementStartDate" visible="true"/>
<columns id="endorsementEndDate" visible="true"/>
<columns id="approvalDate" visible="true"/>
<columns id="docCategory" visible="true"/>
<columns id="hasAttributes" visible="true"/>
<columns id="important" visible="true"/>
<columns id="theme" visible="true"/>
<columns id="project" visible="true"/>
</columns>
<groupProperties/>
</presentation>
');


insert into sec_presentation (id,component,name,is_auto_save,xml) values (newid(),'[tm$Task.browse].cardsTable','Основная',false,
'<?xml version="1.0" encoding="UTF-8"?>
<presentation>
<columns>
	<columns id="initiator.name" visible="true"/>
	<columns id="hasAttachments" width="30" visible="true"/>
	<columns id="important" width="30" visible="true"/>
	<columns id="taskName" width="400" visible="true"/>
	<columns id="fullDescr" width="400" visible="true"/>
	<columns id="createDate" width="100" visible="true"/>
	<columns id="num" visible="true"/>
	<columns id="currentActorsString" visible="true"/>
	<columns id="percentCompletion" visible="false"/>
	<columns id="locState" visible="true"/>
	<columns id="finishDateTimePlan" visible="true"/>
	<columns id="finishDateFact" visible="false"/>
	<columns id="priority" visible="true"/>
	<columns id="executorsString" visible="true"/>
	<columns id="taskType" visible="false"/>
	<columns id="parentCard" visible="false"/>
	<columns id="labourHour" visible="false"/>
	<columns id="hasAttributes" visible="false"/>
	<columns id="project" visible="false"/>
</columns>
<groupProperties/>
</presentation>
');


insert into sec_presentation (id,component,name,is_auto_save,xml) values (newid(),'[tm$Task.browse].cardsTable','Расширенная',false,
'<?xml version="1.0" encoding="UTF-8"?>
<presentation>
<columns>
	<columns id="initiator.name" visible="true"/>
	<columns id="hasAttachments" width="30" visible="true"/>
	<columns id="important" width="30" visible="true"/>
	<columns id="taskName" width="400" visible="true"/>
	<columns id="fullDescr" width="400" visible="true"/>
	<columns id="createDate" width="100" visible="true"/>
	<columns id="num" visible="true"/>
	<columns id="currentActorsString" visible="true"/>
	<columns id="percentCompletion" visible="true"/>
	<columns id="locState" visible="true"/>
	<columns id="finishDateTimePlan" visible="true"/>
	<columns id="finishDateFact" visible="true"/>
	<columns id="priority" visible="true"/>
	<columns id="executorsString" visible="true"/>
	<columns id="taskType" visible="true"/>
	<columns id="parentCard" visible="true"/>
	<columns id="labourHour" visible="true"/>
	<columns id="hasAttributes" visible="true"/>
	<columns id="project" visible="true"/>
</columns>
<groupProperties/>
</presentation>
');

insert into sec_presentation (id,component,name,is_auto_save,xml) values (newid(),'[df$Contract.browse].cardsTable','Основная',false,
'<?xml version="1.0" encoding="UTF-8"?>
<presentation textSelection="false">
<columns>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="important" width="30" visible="true"/>
<columns id="docKind" visible="true"/>
<columns id="contractor" visible="true"/>
<columns id="currentActorsString" visible="true"/>
<columns id="number" visible="true"/>
<columns id="date" visible="true"/>
<columns id="proc.name" visible="true"/>
<columns id="locState" visible="true"/>
<columns id="amount" visible="true"/>
<columns id="currency" visible="true"/>
<columns id="active" visible="false"/>
<columns id="organization" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="docCategory" visible="true"/>
<columns id="owner" visible="true"/>
<columns id="department" visible="false"/>
<columns id="liabilityStart" visible="true"/>
<columns id="liabilityEnd" visible="true"/>
<columns id="endorsementStartDate" visible="false"/>
<columns id="endorsementEndDate" visible="false"/>
<columns id="approvalDate" visible="false"/>
<columns id="hasAttributes" visible="false"/>
<columns id="project" visible="false"/>
</columns>
<groupProperties/>
</presentation>
');

insert into sec_presentation (id,component,name,is_auto_save,xml) values (newid(),'[df$Contract.browse].cardsTable','Расширенная',false,
'<?xml version="1.0" encoding="UTF-8"?>
<presentation textSelection="false">
<columns>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="important" width="30" visible="true"/>
<columns id="docKind" visible="true"/>
<columns id="contractor" visible="true"/>
<columns id="currentActorsString" visible="true"/>
<columns id="number" visible="true"/>
<columns id="date" visible="true"/>
<columns id="proc.name" visible="true"/>
<columns id="locState" visible="true"/>
<columns id="amount" visible="true"/>
<columns id="currency" visible="true"/>
<columns id="active" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="docCategory" visible="true"/>
<columns id="owner" visible="true"/>
<columns id="department" visible="true"/>
<columns id="liabilityStart" visible="true"/>
<columns id="liabilityEnd" visible="true"/>
<columns id="endorsementStartDate" visible="true"/>
<columns id="endorsementEndDate" visible="true"/>
<columns id="approvalDate" visible="true"/>
<columns id="hasAttributes" visible="true"/>
<columns id="project" visible="true"/>
</columns>
<groupProperties/>
</presentation>
');

insert into sec_presentation (id,component,name,is_auto_save,xml) values (newid(),'[df$DocIncome.browse].cardsTable','Основная',false,
'<?xml version="1.0" encoding="UTF-8"?>
<presentation textSelection="false">
<columns>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="currentActorsString" visible="true"/>
<columns id="docKind" visible="true"/>
<columns id="number" visible="true"/>
<columns id="date" visible="true"/>
<columns id="owner" visible="false"/>
<columns id="proc.name" visible="false"/>
<columns id="locState" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="docOfficeDocKind" visible="false"/>
<columns id="docOfficeData.officeFile" visible="true"/>
<columns id="regDate" visible="true"/>
<columns id="regNo" visible="true"/>
<columns id="outcomeNo" visible="true"/>
<columns id="outcomeDate" visible="true"/>
<columns id="addressees" visible="true"/>
<columns id="docOfficeData.sender" visible="true"/>
<columns id="docOfficeData.responsePlanDate" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="resolution" visible="false"/>
<columns id="endorsementStartDate" visible="false"/>
<columns id="endorsementEndDate" visible="false"/>
<columns id="approvalDate" visible="false"/>
<columns id="important" visible="true"/>
<columns id="project" visible="false"/>
</columns>
<groupProperties/>
</presentation>
');

insert into sec_presentation (id,component,name,is_auto_save,xml) values (newid(),'[df$DocIncome.browse].cardsTable','Расширенная',false,
'<?xml version="1.0" encoding="UTF-8"?>
<presentation textSelection="false">
<columns>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="currentActorsString" visible="true"/>
<columns id="docKind" visible="true"/>
<columns id="number" visible="true"/>
<columns id="date" visible="true"/>
<columns id="owner" visible="true"/>
<columns id="proc.name" visible="true"/>
<columns id="locState" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="docOfficeDocKind" visible="true"/>
<columns id="docOfficeData.officeFile" visible="true"/>
<columns id="regDate" visible="true"/>
<columns id="regNo" visible="true"/>
<columns id="outcomeNo" visible="true"/>
<columns id="outcomeDate" visible="true"/>
<columns id="addressees" visible="true"/>
<columns id="docOfficeData.sender" visible="true"/>
<columns id="docOfficeData.responsePlanDate" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="resolution" visible="true"/>
<columns id="endorsementStartDate" visible="true"/>
<columns id="endorsementEndDate" visible="true"/>
<columns id="approvalDate" visible="true"/>
<columns id="important" visible="true"/>
<columns id="project" visible="true"/>
</columns>
<groupProperties/>
</presentation>
');


insert into sec_presentation (id,component,name,is_auto_save,xml) values (newid(),'[df$DocInternal.browse].cardsTable','Основная',false,
'<?xml version="1.0" encoding="UTF-8"?>
<presentation textSelection="false">
<columns>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="currentActorsString" visible="true"/>
<columns id="docKind" visible="true"/>
<columns id="number" visible="true"/>
<columns id="date" visible="true"/>
<columns id="owner" visible="false"/>
<columns id="proc.name" visible="false"/>
<columns id="locState" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="docOfficeDocKind" visible="false"/>
<columns id="docOfficeData.officeFile" visible="true"/>
<columns id="regDate" visible="true"/>
<columns id="regNo" visible="true"/>
<columns id="addressees" visible="true"/>
<columns id="docOfficeData.sender" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="resolution" visible="false"/>
<columns id="endorsementStartDate" visible="false"/>
<columns id="endorsementEndDate" visible="false"/>
<columns id="approvalDate" visible="false"/>
<columns id="important" visible="true"/>
<columns id="project" visible="false"/>
</columns>
<groupProperties/>
</presentation>
');

insert into sec_presentation (id,component,name,is_auto_save,xml) values (newid(),'[df$DocInternal.browse].cardsTable','Расширенная',false,
'<?xml version="1.0" encoding="UTF-8"?>
<presentation textSelection="false">
<columns>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="currentActorsString" visible="true"/>
<columns id="docKind" visible="true"/>
<columns id="number" visible="true"/>
<columns id="date" visible="true"/>
<columns id="owner" visible="true"/>
<columns id="proc.name" visible="true"/>
<columns id="locState" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="docOfficeDocKind" visible="true"/>
<columns id="docOfficeData.officeFile" visible="true"/>
<columns id="regDate" visible="true"/>
<columns id="regNo" visible="true"/>
<columns id="addressees" visible="true"/>
<columns id="docOfficeData.sender" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="resolution" visible="true"/>
<columns id="endorsementStartDate" visible="true"/>
<columns id="endorsementEndDate" visible="true"/>
<columns id="approvalDate" visible="true"/>
<columns id="important" visible="true"/>
<columns id="project" visible="true"/>
</columns>
<groupProperties/>
</presentation>
');

insert into sec_presentation (id,component,name,is_auto_save,xml) values (newid(),'[df$DocOutcome.browse].cardsTable','Основная',false,
'<?xml version="1.0" encoding="UTF-8"?>
<presentation textSelection="false">
<columns>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="currentActorsString" visible="true"/>
<columns id="docKind" visible="true"/>
<columns id="number" visible="true"/>
<columns id="date" visible="true"/>
<columns id="owner" visible="false"/>
<columns id="proc.name" visible="false"/>
<columns id="locState" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="docOfficeDocKind" visible="false"/>
<columns id="docOfficeData.officeFile" visible="true"/>
<columns id="regDate" visible="true"/>
<columns id="regNo" visible="true"/>
<columns id="addressees" visible="true"/>
<columns id="docOfficeData.sender" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="resolution" visible="false"/>
<columns id="endorsementStartDate" visible="false"/>
<columns id="endorsementEndDate" visible="false"/>
<columns id="approvalDate" visible="false"/>
<columns id="important" visible="true"/>
<columns id="project" visible="false"/>
</columns>
<groupProperties/>
</presentation>
');

insert into sec_presentation (id,component,name,is_auto_save,xml) values (newid(),'[df$DocOutcome.browse].cardsTable','Расширенная',false,
'<?xml version="1.0" encoding="UTF-8"?>
<presentation textSelection="false">
<columns>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="currentActorsString" visible="true"/>
<columns id="docKind" visible="true"/>
<columns id="number" visible="true"/>
<columns id="date" visible="true"/>
<columns id="owner" visible="true"/>
<columns id="proc.name" visible="true"/>
<columns id="locState" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="docOfficeDocKind" visible="true"/>
<columns id="docOfficeData.officeFile" visible="true"/>
<columns id="regDate" visible="true"/>
<columns id="regNo" visible="true"/>
<columns id="addressees" visible="true"/>
<columns id="docOfficeData.sender" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="resolution" visible="true"/>
<columns id="endorsementStartDate" visible="true"/>
<columns id="endorsementEndDate" visible="true"/>
<columns id="approvalDate" visible="true"/>
<columns id="important" visible="true"/>
<columns id="project" visible="true"/>
</columns>
<groupProperties/>
</presentation>
');

insert into sec_presentation (id,component,name,is_auto_save,xml) values (newid(),'[df$MeetingDoc.browse].cardsTable','Основная',false,
'<?xml version="1.0" encoding="UTF-8"?>
<presentation>
<columns>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="important" visible="true"/>
<columns id="number" visible="true"/>
<columns id="createTs" visible="false"/>
<columns id="theme" visible="true"/>
<columns id="target" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="department" visible="true"/>
<columns id="parentCard" visible="true"/>
<columns id="docCategory" visible="false"/>
<columns id="dateTime" visible="true"/>
<columns id="duration" visible="false"/>
<columns id="place" visible="false"/>
<columns id="chairman" visible="true"/>
<columns id="initiator" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="secretary" visible="true"/>
<columns id="locState" visible="true"/>
</columns>
<groupProperties/>
</presentation>
');

insert into sec_presentation (id,component,name,is_auto_save,xml) values (newid(),'[df$MeetingDoc.browse].cardsTable','Расширенная',false,
'<?xml version="1.0" encoding="UTF-8"?>
<presentation>
<columns>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="important" visible="true"/>
<columns id="number" visible="true"/>
<columns id="createTs" visible="true"/>
<columns id="theme" visible="true"/>
<columns id="target" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="department" visible="true"/>
<columns id="parentCard" visible="true"/>
<columns id="docCategory" visible="true"/>
<columns id="dateTime" visible="true"/>
<columns id="duration" visible="true"/>
<columns id="place" visible="true"/>
<columns id="chairman" visible="true"/>
<columns id="initiator" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="secretary" visible="true"/>
<columns id="locState" visible="true"/>
</columns>
<groupProperties/>
</presentation>
');


insert into sec_role(id, create_ts, created_by, version, name, loc_name, description, role_type, is_default_role) values
('505d37f4-fdfc-11e3-88a0-b7bba68b44d2', now(), 'system', 1, 'Archivist', 'Архивариус', 'Архивация дел', 0, false),
('56e2fce4-fdfc-11e3-a0b9-737e257ecae7', now(), 'system', 1, 'Archive access', 'Доступ к архиву', 'Доступ к карточкам в делах архива', 0 , false);

insert into sec_permission(id, create_ts, created_by, version, permission_type, target, value, role_id) values
(newid(), now(), 'system', 1, 10, 'ts$ArchivedSimpleDoc.browse', 1, '56e2fce4-fdfc-11e3-a0b9-737e257ecae7'), -- archive access
(newid(), now(), 'system', 1, 10, 'ts$ArchivedContract.browse', 1, '56e2fce4-fdfc-11e3-a0b9-737e257ecae7'),  -- archive access

(newid(), now(), 'system', 1, 10, 'ts$ArchivedSimpleDoc.browse', 1, '505d37f4-fdfc-11e3-88a0-b7bba68b44d2'), -- archivist
(newid(), now(), 'system', 1, 10, 'ts$ArchivedContract.browse', 1, '505d37f4-fdfc-11e3-88a0-b7bba68b44d2'), -- archivist

(newid(), now(), 'system', 1, 10, 'ts$ArchivistWorkplace', 1, '505d37f4-fdfc-11e3-88a0-b7bba68b44d2'), -- archivist

(newid(), now(), 'system', 1, 10, 'ts$ArchivedSimpleDoc.browse', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c'), -- simple user
(newid(), now(), 'system', 1, 10, 'ts$ArchivedContract.browse', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c'), -- simple user
(newid(), now(), 'system', 1, 10, 'ts$ArchivistWorkplace', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c'), -- simple user

(newid(), now(), 'system', 1, 10, 'ts$ArchivistWorkplace', 0, '0c018061-b26f-4de2-a5be-dff348347f93'),      -- admin
(newid(), now(), 'system', 1, 10, 'ts$ArchivedSimpleDoc.browse', 1, '0c018061-b26f-4de2-a5be-dff348347f93'),-- admin
(newid(), now(), 'system', 1, 10, 'ts$ArchivedContract.browse', 1, '0c018061-b26f-4de2-a5be-dff348347f93'); -- admin

insert into sec_permission(id, create_ts, created_by, version, permission_type, target, value, role_id) values
(newid(), now(), 'system', 1, 20, 'df$OfficeFile:update', 1, '505d37f4-fdfc-11e3-88a0-b7bba68b44d2'); -- archivist

insert into sec_permission(id, create_ts, created_by, version, permission_type, target, value, role_id) values
(newid(), now(), 'system', 1, 10, 'ts$ArchivedSimpleDoc.browse', 1, '7091f5ef-a77a-450a-834a-39406885676e'),
(newid(), now(), 'system', 1, 10, 'ts$ArchivedContract.browse', 1, '7091f5ef-a77a-450a-834a-39406885676e'),
(newid(), now(), 'system', 1, 10, 'ts$ArchivistWorkplace', 1, '7091f5ef-a77a-450a-834a-39406885676e'); -- secretary

insert into SEC_GROUP(id,create_ts,created_by,version,name,parent_id)
values('cff945e4-e363-0dc0-d70d-4b5bdb2a2269', now(), 'system', 1, 'Архивариус', '0fa2b1a5-1d68-4d69-9fbd-dff348347f93');

insert into SEC_GROUP_HIERARCHY(id, create_ts, created_by, group_id, parent_id, hierarchy_level) values
('69ce75c8-10ca-11e4-a1bf-9f791863ea06', now(), 'system', 'cff945e4-e363-0dc0-d70d-4b5bdb2a2269','0fa2b1a5-1d68-4d69-9fbd-dff348347f93', 0);

insert into sec_constraint(id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id) values
('bc94a0d4-10ca-11e4-8fb1-07511252f87c', now(), 'system', 1, 'df$Doc', 'join {E}.aclList acl', '({E}.docOfficeData.officeFile.state >= 30 and {E}.template = false or (acl.user.id = :session$userId or acl.global = true))', 'cff945e4-e363-0dc0-d70d-4b5bdb2a2269');

insert into sec_constraint(id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id) values
('bfb52f2c-10ca-11e4-bf3e-934403a7308f', now(), 'system', 1, 'df$SimpleDoc', 'join {E}.aclList acl', '({E}.docOfficeData.officeFile.state >= 30 and {E}.template = false or (acl.user.id = :session$userId or acl.global = true))', 'cff945e4-e363-0dc0-d70d-4b5bdb2a2269');

insert into sec_constraint(id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id) values
('c2292574-10ca-11e4-857e-bb6e9cc79bd5', now(), 'system', 1, 'df$Contract', 'join {E}.aclList acl', '({E}.docOfficeData.officeFile.state >= 30 and {E}.template = false or (acl.user.id = :session$userId or acl.global = true))', 'cff945e4-e363-0dc0-d70d-4b5bdb2a2269');

insert into sec_constraint(id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id) values
('ce84d65b-6f47-c896-d393-bf3dab98660d', now(), 'system', 1, 'df$MeetingDoc', 'join {E}.aclList acl', '({E}.docOfficeData.officeFile.state >= 30 and {E}.template = false or (acl.user.id = :session$userId or acl.global = true))', 'cff945e4-e363-0dc0-d70d-4b5bdb2a2269');

insert into sec_constraint(id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id) values
('c42e9fa2-10ca-11e4-9c89-8758c81c5f95', now(), 'system', 1, 'tm$Task', ', ts$CardAcl acl', '{E}.id = acl.card.id and acl.user.id = :session$userId', 'cff945e4-e363-0dc0-d70d-4b5bdb2a2269');

insert into sec_constraint(id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id) values
('c646b7e8-10ca-11e4-9ac6-5b5381a1ae07', now(), 'system', 1, 'tm$TaskPattern', ', ts$CardAcl acl', '{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)', 'cff945e4-e363-0dc0-d70d-4b5bdb2a2269');

insert into sec_constraint(id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id) values
('c927f1b6-10ca-11e4-b068-fb1093d5ff87', now(), 'system', 1, 'df$TypicalResolution', null, '({E}.global = true OR {E}.substitutedCreator.id = :session$userId)', 'cff945e4-e363-0dc0-d70d-4b5bdb2a2269');

insert into sec_constraint(id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id) values
('cba18d6c-10ca-11e4-a48e-cf4e88c4e746', now(), 'system', 1, 'wf$UserGroup', null, '({E}.substitutedCreator.id = :session$userId or {E}.global = true)', 'cff945e4-e363-0dc0-d70d-4b5bdb2a2269');

insert into sec_constraint(id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id) values
('ce7b9b22-10ca-11e4-8ecc-a3cabbbb49b3', now(), 'system', 1, 'tm$TaskGroup', 'left join {E}.taskGroupTasks tgt left join {E}.participants p',
'({E}.subCreator.id = :session$userId
 or p.id = :session$userId
 or {E}.chairman.id = :session$userId
 or {E}.secretary.id = :session$userId
 or {E}.initiator.id = :session$userId
 or exists (select c from wf$CardRole c where c.card = tgt.task and c.user.id = :session$userId and c.deleteTs is null) or  ({E}.template = true AND {E}.global = true  ))', 'cff945e4-e363-0dc0-d70d-4b5bdb2a2269');

alter table WF_PROC add column HIDDEN_DECISIONS_BPMN varchar(1500);
alter table WF_PROC add column PARTICIPANTS_CHANGE_ENABLED boolean;

select create_or_update_sec_permission('SimpleUser', 'ts$OfficeFileTransferLog:create', 20, 0);
select create_or_update_sec_permission('SimpleUser', 'ts$OfficeFileTransferLog:update', 20, 0);
select create_or_update_sec_permission('SimpleUser', 'ts$OfficeFileTransferLog:delete', 20, 0);

select create_or_update_sec_permission('Archivist', 'ts$OfficeFileTransferLog:create', 20, 1);
select create_or_update_sec_permission('Archivist', 'ts$OfficeFileTransferLog:update', 20, 1);
select create_or_update_sec_permission('Archivist', 'ts$OfficeFileTransferLog:delete', 20, 1);