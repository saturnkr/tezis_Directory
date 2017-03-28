--$Id: 150119-1300-addImportEntityInfo.sql 18668 2015-01-20 08:45:26Z pavlov $
--$Description:


create table TS_IMPORT_ENTITY_INFO (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    IMPORT_ID uuid,
    ENTITY_NAME varchar(100),
    ENTITY_ID uuid,
    primary key (ID)
)^

create index IDX_TS_IMPORT_ENTITY_INFO_IMPORT_ID on TS_IMPORT_ENTITY_INFO (IMPORT_ID)^