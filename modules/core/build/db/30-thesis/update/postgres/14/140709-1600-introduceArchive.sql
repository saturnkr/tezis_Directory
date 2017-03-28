alter table df_doc add archived boolean;

create index idx_doc_archived on DF_DOC(archived);

update df_doc set archived = false;


alter table df_office_file add state integer;

update df_office_file set state = 50 where DESTROYED = true; -- destroyed state
update df_office_file set state = 30 where IN_ARCHIVE = true; -- archive request state
update df_office_file set state = 20 where CLOSED = true; -- closed state
update df_office_file set state = 10 where state is null; --active state

alter table df_office_file drop column DESTROYED;
alter table df_office_file drop column CLOSED;
alter table df_office_file drop column IN_ARCHIVE;

insert into sec_role(id, create_ts, created_by, version, name, loc_name, description, role_type, is_default_role) values
('505d37f4-fdfc-11e3-88a0-b7bba68b44d2', now(), 'system', 1, 'Archivist', 'Архивариус', 'Архивация дел', 0, false),
('56e2fce4-fdfc-11e3-a0b9-737e257ecae7', now(), 'system', 1, 'Archive access', 'Доступ к архиву', 'Доступ к карточкам в делах архива', 0 , false);

insert into sec_permission(id, create_ts, created_by, version, permission_type, target, value, role_id) values
(newid(), now(), 'system', 1, 10, 'ts$ArchivedSimpleDoc.browse', 1, '56e2fce4-fdfc-11e3-a0b9-737e257ecae7'), -- archive access
(newid(), now(), 'system', 1, 10, 'ts$ArchivedContract.browse', 1, '56e2fce4-fdfc-11e3-a0b9-737e257ecae7'),  -- archive access

(newid(), now(), 'system', 1, 10, 'ts$ArchivedSimpleDoc.browse', 1, '505d37f4-fdfc-11e3-88a0-b7bba68b44d2'), -- archivist
(newid(), now(), 'system', 1, 10, 'ts$ArchivedContract.browse', 1, '505d37f4-fdfc-11e3-88a0-b7bba68b44d2'), -- archivist

(newid(), now(), 'system', 1, 10, 'ts$ArchivistWorkplace', 1, '505d37f4-fdfc-11e3-88a0-b7bba68b44d2'), -- archivist

(newid(), now(), 'system', 1, 10, 'ts$ArchivedSimpleDoc.browse', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c'), -- simple user
(newid(), now(), 'system', 1, 10, 'ts$ArchivedContract.browse', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c'), -- simple user
(newid(), now(), 'system', 1, 10, 'ts$ArchivistWorkplace', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c'); -- simple user

create table TS_OFFICE_FILE_TRANSFER_LOG (
     ID uuid,
     CREATE_TS timestamp,
     CREATED_BY varchar(50),
     VERSION integer,
     UPDATE_TS timestamp,
     UPDATED_BY varchar(50),
     DELETE_TS timestamp,
     DELETED_BY varchar(50),

     ISSUED_BY uuid not null,
     RECEIVER_ID uuid not null,
     OFFICE_FILE_ID uuid not null,
     TRANSFER_DATE date,
     DUE_DATE date,
     RETURN_DATE date,
     COMMENT varchar(1000),
     OVERDUE_NOTIFIED boolean,

     primary key(ID),
     constraint FK_OFTL_RECEIVER foreign key (RECEIVER_ID) references DF_CORRESPONDENT(ID),
     constraint FK_OFTL_OFFICE_FILE foreign key (OFFICE_FILE_ID) references DF_OFFICE_FILE(ID),
     constraint FK_OFTL_ISSUED_BY foreign key (ISSUED_BY) references SEC_USER(ID)
);


