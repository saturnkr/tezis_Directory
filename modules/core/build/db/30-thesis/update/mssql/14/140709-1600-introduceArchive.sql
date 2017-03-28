alter table df_doc add archived tinyint^

create index idx_doc_archived on DF_DOC(archived);

update df_doc set archived = 0;


alter table df_office_file add state integer^

update df_office_file set state = 50 where DESTROYED = 1; -- destroyed state
update df_office_file set state = 30 where IN_ARCHIVE = 1; -- archive request state
update df_office_file set state = 20 where CLOSED = 1; -- closed state
update df_office_file set state = 10 where state is null; --active state

alter table df_office_file drop column DESTROYED;
alter table df_office_file drop column CLOSED;
alter table df_office_file drop column IN_ARCHIVE;
^

insert into sec_role(id, create_ts, created_by, version, name, loc_name, description, role_type, is_default_role) values
('505d37f4-fdfc-11e3-88a0-b7bba68b44d2', current_timestamp, 'system', 1, 'Archivist', 'Архивариус', 'Архивация дел', 0, 0);
insert into sec_role(id, create_ts, created_by, version, name, loc_name, description, role_type, is_default_role) values
('56e2fce4-fdfc-11e3-a0b9-737e257ecae7', current_timestamp, 'system', 1, 'Archive access', 'Доступ к архиву', 'Доступ к карточкам в делах архива', 0 , 0);

insert into sec_permission(id, create_ts, created_by, version, permission_type, target, value, role_id) values
(newid(), current_timestamp, 'system', 1, 10, 'ts$ArchivedSimpleDoc.browse', 1, '56e2fce4-fdfc-11e3-a0b9-737e257ecae7'); -- archive access

insert into sec_permission(id, create_ts, created_by, version, permission_type, target, value, role_id) values
(newid(), current_timestamp, 'system', 1, 10, 'ts$ArchivedContract.browse', 1, '56e2fce4-fdfc-11e3-a0b9-737e257ecae7');  -- archive access

insert into sec_permission(id, create_ts, created_by, version, permission_type, target, value, role_id) values
(newid(), current_timestamp, 'system', 1, 10, 'ts$ArchivedSimpleDoc.browse', 1, '505d37f4-fdfc-11e3-88a0-b7bba68b44d2'); -- archivist

insert into sec_permission(id, create_ts, created_by, version, permission_type, target, value, role_id) values
(newid(), current_timestamp, 'system', 1, 10, 'ts$ArchivedContract.browse', 1, '505d37f4-fdfc-11e3-88a0-b7bba68b44d2'); -- archivist

insert into sec_permission(id, create_ts, created_by, version, permission_type, target, value, role_id) values
(newid(), current_timestamp, 'system', 1, 10, 'ts$ArchivistWorkplace', 1, '505d37f4-fdfc-11e3-88a0-b7bba68b44d2'); -- archivist

insert into sec_permission(id, create_ts, created_by, version, permission_type, target, value, role_id) values
(newid(), current_timestamp, 'system', 1, 10, 'ts$ArchivedSimpleDoc.browse', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c'); -- simple user
insert into sec_permission(id, create_ts, created_by, version, permission_type, target, value, role_id) values
(newid(), current_timestamp, 'system', 1, 10, 'ts$ArchivedContract.browse', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c'); -- simple user

insert into sec_permission(id, create_ts, created_by, version, permission_type, target, value, role_id) values
(newid(), current_timestamp, 'system', 1, 10, 'ts$ArchivistWorkplace', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c'); -- simple user

create table TS_OFFICE_FILE_TRANSFER_LOG (
     ID uniqueidentifier,
     CREATE_TS datetime,
     CREATED_BY varchar(50),
     VERSION integer,
     UPDATE_TS datetime,
     UPDATED_BY varchar(50),
     DELETE_TS datetime,
     DELETED_BY varchar(50),

     ISSUED_BY uniqueidentifier not null,
     RECEIVER_ID uniqueidentifier not null,
     OFFICE_FILE_ID uniqueidentifier not null,
     TRANSFER_DATE datetime,
     DUE_DATE datetime,
     RETURN_DATE datetime,
     COMMENT varchar(1000),
     OVERDUE_NOTIFIED tinyint,

     primary key(ID),
     constraint FK_OFTL_RECEIVER foreign key (RECEIVER_ID) references DF_CORRESPONDENT(ID),
     constraint FK_OFTL_OFFICE_FILE foreign key (OFFICE_FILE_ID) references DF_OFFICE_FILE(ID),
     constraint FK_OFTL_ISSUED_BY foreign key (ISSUED_BY) references SEC_USER(ID)
);


