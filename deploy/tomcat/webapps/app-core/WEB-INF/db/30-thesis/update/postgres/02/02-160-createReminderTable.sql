-- $Id: 02-160-createReminderTable.sql 1642 2011-03-28 10:23:43Z pavlov $
-- Description:

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
