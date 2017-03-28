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