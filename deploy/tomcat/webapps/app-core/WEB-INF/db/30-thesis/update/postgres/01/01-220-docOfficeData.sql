-- $Id: 01-220-docOfficeData.sql 378 2010-06-17 13:28:32Z krivopustov $
-- Description: create DF_DOC_OFFICE_DATA table and move data from DF_DOC to it

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
    FINISH_DATE_PLAN date,
    RESPONSE_TO_DOC_ID uuid,
    ADDRESSEE_ID uuid,
    SENDER_ID uuid,
    OFFICE_FILE_ID uuid,
    DOC_RECEIVING_METHOD_ID uuid,
    OFFICE_CONTACT_PERSON_TO_ID uuid,
    OFFICE_EXECUTOR_ID uuid,
    OFFICE_SIGNED_BY_ID uuid,
    primary key (ID)
)^

alter table DF_DOC_OFFICE_DATA add constraint FK_DF_DOC_OFFICE_DATA_DOC foreign key (DOC_ID) references DF_DOC(CARD_ID)^

alter table DF_DOC_OFFICE_DATA add constraint FK_DF_DOC_OFFICE_DATA_DOC_RECEIVING_METHOD foreign key (DOC_RECEIVING_METHOD_ID) references DF_DOC_RECEIVING_METHOD(ID)^

alter table DF_DOC_OFFICE_DATA add constraint FK_DF_DOC_OFFICE_DATA_RESPONSE_TO_DOC foreign key (RESPONSE_TO_DOC_ID) references DF_DOC(CARD_ID)^

alter table DF_DOC_OFFICE_DATA add constraint FK_DF_DOC_OFFICE_DATA_ADDRESSEE foreign key (ADDRESSEE_ID) references DF_CORRESPONDENT(ID)^

alter table DF_DOC_OFFICE_DATA add constraint FK_DF_DOC_OFFICE_DATA_SENDER foreign key (SENDER_ID) references DF_CORRESPONDENT(ID)^

alter table DF_DOC_OFFICE_DATA add constraint FK_DF_DOC_OFFICE_DATA_OFFICE_FILE foreign key (OFFICE_FILE_ID) references DF_OFFICE_FILE(ID)^

alter table DF_DOC_OFFICE_DATA add constraint FK_DF_DOC_OFFICE_DATA_OFFICE_EXECUTOR foreign key (OFFICE_EXECUTOR_ID) references DF_CONTACT_PERSON (ID)^

alter table DF_DOC_OFFICE_DATA add constraint FK_DF_DOC_OFFICE_DATA_OFFICE_SIGNED_BY foreign key (OFFICE_SIGNED_BY_ID) references DF_CONTACT_PERSON (ID)^

alter table DF_DOC_OFFICE_DATA add constraint FK_DF_DOC_OFFICE_DATA_OFFICE_CONTACT_PERSON_TO foreign key (OFFICE_CONTACT_PERSON_TO_ID) references DF_CONTACT_PERSON (ID)^


insert into df_doc_office_data (id,create_ts,created_by,version,update_ts,doc_id,
    finish_date_plan,response_to_doc_id,addressee_id,sender_id,office_file_id,doc_receiving_method_id,office_contact_person_to_id,office_executor_id,office_signed_by_id)
select newid(), current_timestamp, 'admin', 0, current_timestamp, card_id,
    finish_date_plan,response_to_doc_id,addressee_id,sender_id,office_file_id,doc_receiving_method_id,office_contact_person_to_id,office_executor_id,office_signed_by_id
from df_doc
^

alter table df_doc
    drop finish_date_plan,
    drop response_to_doc_id,
    drop addressee_id,
    drop sender_id,
    drop office_file_id,
    drop doc_receiving_method_id,
    drop office_contact_person_to_id,
    drop office_executor_id,
    drop office_signed_by_id
^

alter table DF_DOC_TRANSFER_LOG add DOC_OFFICE_DATA_ID uuid^

alter table DF_DOC_TRANSFER_LOG add constraint FK_DF_DTL_DOC_OFFICE_DATA foreign key (DOC_OFFICE_DATA_ID) references DF_DOC_OFFICE_DATA (ID)^

update DF_DOC_TRANSFER_LOG set DOC_OFFICE_DATA_ID = (select dod.id from DF_DOC_OFFICE_DATA dod where dod.doc_id = doc_id)
