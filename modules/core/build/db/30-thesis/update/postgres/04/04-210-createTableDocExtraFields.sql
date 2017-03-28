--$Id:
create table DF_DOC_EXTRA_FIELD (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    CARD_ID uuid,
    FIELD_NAME varchar(50),
    FIELD_VALUE varchar(100),
    primary key (ID)
)^

alter table DF_DOC_EXTRA_FIELD add constraint FK_DF_DOC_EXTRA_FIELD_DOC foreign key (CARD_ID) references DF_DOC (CARD_ID)^
ALTER TABLE df_doc_extra_field ADD CONSTRAINT df_doc_extra_field_card_id_extra_field_id_key UNIQUE(CARD_ID, FIELD_NAME)^