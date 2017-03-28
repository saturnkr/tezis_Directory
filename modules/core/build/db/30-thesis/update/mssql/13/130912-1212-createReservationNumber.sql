create table DF_RESERVATION_NUMBER (
      ID uniqueidentifier not null,
      CREATE_TS datetime,
      CREATED_BY varchar(50),
      VERSION integer,
      UPDATE_TS datetime,
      UPDATED_BY varchar(50),
      DELETE_TS datetime,
      DELETED_BY varchar(50),
      OFFICE_FILE_ID uniqueidentifier,
      NUMERATOR_ID uniqueidentifier,
      DOC_ID uniqueidentifier,
      SHORT_URL_ID uniqueidentifier,
      ATTACHMENT_ID uniqueidentifier,
      NUMBER varchar(50),
      DATE_RESERV datetime,
      DATE_REGISTR datetime,
      STATE integer,
      COMMENT varchar(max),
      primary key nonclustered (ID)
)^

alter table DF_RESERVATION_NUMBER add constraint FK_DF_RESERVATION_NUMBER_OFFICE_FILE foreign key (OFFICE_FILE_ID) references DF_OFFICE_FILE(ID)^
alter table DF_RESERVATION_NUMBER add constraint FK_DF_RESERVATION_NUMBER_NUMERATOR foreign key (NUMERATOR_ID) references DF_NUMERATOR(ID)^
alter table DF_RESERVATION_NUMBER add constraint FK_DF_RESERVATION_NUMBER_DOC foreign key (DOC_ID) references DF_DOC(CARD_ID)^
alter table DF_RESERVATION_NUMBER add constraint FK_DF_RESERVATION_NUMBER_ATTACH foreign key (ATTACHMENT_ID) references WF_ATTACHMENT(ID)^