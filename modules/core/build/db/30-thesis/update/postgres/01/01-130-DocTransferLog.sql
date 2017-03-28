-- $Id: 01-130-DocTransferLog.sql 165 2010-05-06 14:40:51Z pavlov $
-- Description: Create Doc Transfer Log table

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
    DOC_ID uuid,
    EMPLOYEE_ID uuid,
    TRANSFER_DATE timestamp,
    RETURN_DATE timestamp,
    RETURNED boolean,
    COMMENT varchar(2000),
    primary key (ID)
);

alter table DF_DOC_TRANSFER_LOG add constraint FK_DF_DTL_DOC foreign key (DOC_ID) references DF_DOC (CARD_ID);
alter table DF_DOC_TRANSFER_LOG add constraint FK_DF_DTL_EMPLOYEE foreign key (EMPLOYEE_ID) references DF_EMPLOYEE (CORRESPONDENT_ID);