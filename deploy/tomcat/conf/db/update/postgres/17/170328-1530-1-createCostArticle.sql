create table TEZISDIRECTORY_COST_ARTICLE (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    COSTARTICLE varchar(90),
    HOLDER_ID uuid,
    COMMERCIAL_ID uuid,
    --
    primary key (ID)
);
