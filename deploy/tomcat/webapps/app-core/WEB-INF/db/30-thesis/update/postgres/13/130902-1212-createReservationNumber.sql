-- $Id$
-- $Description:


create table DF_RESERVATION_NUMBER (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    OFFICE_FILE_ID uuid,
    NUMERATOR_ID uuid,
    DOC_ID uuid,
    SHORT_URL_ID uuid,
    ATTACHMENT_ID uuid,
    NUMBER varchar(50),
    DATE_RESERV date,
    DATE_REGISTR date,
    STATE integer,
    COMMENT text,
    primary key (ID)
)^

alter table DF_RESERVATION_NUMBER add constraint FK_DF_RESERVATION_NUMBER_OFFICE_FILE foreign key (OFFICE_FILE_ID) references DF_OFFICE_FILE(ID)^
alter table DF_RESERVATION_NUMBER add constraint FK_DF_RESERVATION_NUMBER_NUMERATOR foreign key (NUMERATOR_ID) references DF_NUMERATOR(ID)^
alter table DF_RESERVATION_NUMBER add constraint FK_DF_RESERVATION_NUMBER_DOC foreign key (DOC_ID) references DF_DOC(CARD_ID)^
alter table DF_RESERVATION_NUMBER add constraint FK_DF_RESERVATION_NUMBER_ATTACH foreign key (ATTACHMENT_ID) references WF_ATTACHMENT(ID)^