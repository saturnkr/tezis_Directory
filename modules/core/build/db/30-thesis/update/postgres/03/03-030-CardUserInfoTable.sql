-- $Id: 03-030-CardUserInfoTable.sql 2040 2011-05-31 14:39:55Z chernov $
-- Description: Creating CardUserInfo table

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
);

alter table WF_CARD_USER_INFO add constraint FK_WF_CARD_USER_INFO_CARD foreign key (CARD_ID) references WF_CARD(ID);
alter table WF_CARD_USER_INFO add constraint FK_WF_CARD_USER_INFO_USER foreign key (USER_ID) references SEC_USER(ID);

create index IDX_WF_CARD_USER_INFO_CARD on WF_CARD_USER_INFO(card_id);
create index IDX_WF_CARD_USER_INFO_USER on WF_CARD_USER_INFO(user_id, delete_ts);