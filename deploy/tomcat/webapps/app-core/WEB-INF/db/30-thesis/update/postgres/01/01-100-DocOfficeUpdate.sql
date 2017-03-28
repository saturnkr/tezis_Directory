-- $Id: 01-100-DocOfficeUpdate.sql 130 2010-04-29 10:44:40Z gorbunkov $
-- Description: create DO_CORRESPONDENT table and alter other tables of inheritance hierarchy;
-- Add common office attributes to DF_DOC table
-- create DF_DOC_RECEIVING_METHOD table
-- create DF_OFFICE_FILE table
-- create DF_OFFICE_FILE_NOMENCLATURE table

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
);

----------------------------------------------------------------
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
    INDEX varchar(50),
    YEAR numeric(4),
    ARTICLES_LIST varchar(100),
    COMMENT varchar(2000),
    EC_MARK boolean,
    CATEGORY numeric(1),
    STORAGE_PERIOD numeric(3),
    ORGANIZATION_ID uuid,
    PARENT_NOMENCLATURE_ID uuid,
    primary key (ID)
);

alter table DF_OFFICE_FILE_NOMENCLATURE add constraint FK_DF_OFFICE_FILE_NOMENCLATURE_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION(ID);
alter table DF_OFFICE_FILE_NOMENCLATURE add constraint FK_DF_OFFICE_FILE_NOMENCLATURE_NOMENCLATURE foreign key (PARENT_NOMENCLATURE_ID) references DF_OFFICE_FILE_NOMENCLATURE(ID);

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
    CLOSED boolean,
    IN_ARCHIVE boolean,
    DESTROYED boolean,
    OFFICE_FILE_NOMENCLATURE_ID uuid,
    NUMERATOR_ID uuid,
    primary key (ID)
);

alter table DF_OFFICE_FILE add constraint FK_DF_OFFICE_FILE_NOMENCLATURE foreign key (OFFICE_FILE_NOMENCLATURE_ID) references DF_OFFICE_FILE_NOMENCLATURE(ID);
alter table DF_OFFICE_FILE add constraint FK_DF_OFFICE_FILE_NUMERATOR foreign key (NUMERATOR_ID) references DF_NUMERATOR(ID);

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
    NAME varchar(200),
    TYPE varchar(1),
    primary key (ID)
);

alter table DF_CONTRACTOR rename column ID to CORRESPONDENT_ID;
alter table DF_CONTRACTOR add constraint FK_DF_CONTRACTOR_CORRESPONDENT foreign key (CORRESPONDENT_ID) references DF_CORRESPONDENT(ID);

alter table DF_INDIVIDUAL drop constraint FK_DF_INDIVIDUAL_CONTRACTOR;
alter table DF_INDIVIDUAL add constraint FK_DF_INDIVIDUAL_CONTRACTOR foreign key (CONTRACTOR_ID) references DF_CONTRACTOR (CORRESPONDENT_ID);

alter table DF_COMPANY drop constraint FK_DF_COMPANY_CONTRACTOR;
alter table DF_COMPANY add constraint FK_DF_COMPANY_CONTRACTOR foreign key (CONTRACTOR_ID) references DF_CONTRACTOR (CORRESPONDENT_ID);

alter table DF_EMPLOYEE rename column ID to CORRESPONDENT_ID;
alter table DF_EMPLOYEE add constraint FK_DF_EMPLOYEE_CORRESPONDENT foreign key (CORRESPONDENT_ID) references DF_CORRESPONDENT(ID);
alter table DF_EMPLOYEE add column TYPE varchar(1);

alter table DF_DEPARTMENT rename column ID to CORRESPONDENT_ID;
alter table DF_DEPARTMENT add constraint FK_DF_DEPARTMENT_CORRESPONDENT foreign key (CORRESPONDENT_ID) references DF_CORRESPONDENT(ID);
alter table DF_DEPARTMENT add column TYPE varchar(1);  

update DF_EMPLOYEE set TYPE = 'E';
update DF_DEPARTMENT set TYPE = 'D';

----------------------------------------------------------------
alter table DF_DOC add column INCOME_DATE date;
alter table DF_DOC add column INCOME_NO varchar(50);
alter table DF_DOC add column OUTCOME_DATE date;
alter table DF_DOC add column OUTCOME_NO varchar(50);
alter table DF_DOC add column FINISH_DATE_PLAN date;
alter table DF_DOC add column DOC_OFFICE_DOC_KIND varchar(1);
alter table DF_DOC add column RESOLUTION varchar(500);
alter table DF_DOC add column RESPONSE_TO_DOC_ID uuid;
alter table DF_DOC add column ADDRESSEE_ID uuid;
alter table DF_DOC add column SENDER_ID uuid;
alter table DF_DOC add column OFFICE_FILE_ID uuid;
alter table DF_DOC add column DOC_RECEIVING_METHOD_ID uuid;

alter table DF_DOC add constraint FK_DF_DOC_DOC_RECEIVING_METHOD foreign key (DOC_RECEIVING_METHOD_ID) references DF_DOC_RECEIVING_METHOD(ID);
alter table DF_DOC add constraint FK_DF_DOC_RESPONSE_TO_DOC foreign key (RESPONSE_TO_DOC_ID) references DF_DOC(CARD_ID);
alter table DF_DOC add constraint FK_DF_DOC_ADDRESSEE foreign key (ADDRESSEE_ID) references DF_CORRESPONDENT(ID);
alter table DF_DOC add constraint FK_DF_DOC_SENDER foreign key (SENDER_ID) references DF_CORRESPONDENT(ID);
alter table DF_DOC add constraint FK_DF_DOC_OFFICE_FILE foreign key (OFFICE_FILE_ID) references DF_OFFICE_FILE(ID);


