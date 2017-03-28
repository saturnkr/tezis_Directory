-- $Id: 02-250-addTypicalResolution.sql 11283 2013-08-12 09:34:32Z pavlov $
-- Description:

create table DF_TYPICAL_RESOLUTION (
    ID uuid not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    NAME varchar(500),
    TEXT text,
    GLOBAL boolean,
    CREATOR_ID uuid,
    SUBSTITUTED_CREATOR_ID uuid,
    primary key (ID)
)^

alter table DF_TYPICAL_RESOLUTION add constraint FK_DF_TYPICAL_RESOLUTION_CREATOR
foreign key (CREATOR_ID) references SEC_USER(ID)^
alter table DF_TYPICAL_RESOLUTION add constraint FK_DF_TYPICAL_RESOLUTION_SUBSTITUTED_CREATOR
foreign key (SUBSTITUTED_CREATOR_ID) references SEC_USER(ID)^

INSERT INTO SEC_PERMISSION (ID, CREATE_TS, CREATED_BY, VERSION,  TYPE, TARGET, VALUE, ROLE_ID)
VALUES (newid(), now(), USER, 1, 10, 'df$TypicalResolution.browse', 0,
(select r.id from sec_role r where r.name = 'SimpleUser'))^

INSERT INTO SEC_PERMISSION (ID, CREATE_TS, CREATED_BY, VERSION,  TYPE, TARGET, VALUE, ROLE_ID)
VALUES (newid(), now(), USER, 1, 10, 'df$TypicalResolution.browse', 1,
(select r.id from sec_role r where r.name = 'doc_approver'))^

INSERT INTO SEC_PERMISSION (ID, CREATE_TS, CREATED_BY, VERSION,  TYPE, TARGET, VALUE, ROLE_ID)
VALUES (newid(), now(), USER, 1, 10, 'df$TypicalResolution.browse', 1,
(select r.id from sec_role r where r.name = 'Administrators'))^

INSERT INTO SEC_CONSTRAINT (ID, CREATE_TS, CREATED_BY, VERSION,  ENTITY_NAME, JOIN_CLAUSE, WHERE_CLAUSE, GROUP_ID)
VALUES (newid(), now(), USER, 1, 'df$TypicalResolution', null, '({E}.substitutedCreator.id = :session$userId OR {E}.global = true)',
(select g.id from sec_group g where g.name = 'Ограниченный доступ'))^

