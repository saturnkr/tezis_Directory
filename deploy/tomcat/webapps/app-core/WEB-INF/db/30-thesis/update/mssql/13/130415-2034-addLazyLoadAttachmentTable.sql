create table TM_LAZY_LOAD_ATTACHMENT (
    ID uniqueidentifier not null,
    FILE_ID uniqueidentifier,
    HAS_FILE tinyint,
    CREATE_TS datetime,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS datetime,
    UPDATED_BY varchar(50),
    DELETE_TS datetime,
    DELETED_BY varchar(50),
    primary key (ID),
    constraint TM_LAZY_LOAD_ATTACHMENT_FILE_ID foreign key (FILE_ID) references SYS_FILE (ID)
)^