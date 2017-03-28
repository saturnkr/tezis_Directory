--$Id: 141009-1400-adminPermissionsForArchiveLists.sql 17700 2014-10-09 10:04:38Z saiyan $

insert into sec_permission(id, create_ts, created_by, version, permission_type, target, value, role_id) values
(newid(), current_timestamp, 'system', 1, 10, 'ts$ArchivedSimpleDoc.browse', 1, '0c018061-b26f-4de2-a5be-dff348347f93'); -- admin
insert into sec_permission(id, create_ts, created_by, version, permission_type, target, value, role_id) values
(newid(), current_timestamp, 'system', 1, 10, 'ts$ArchivedContract.browse', 1, '0c018061-b26f-4de2-a5be-dff348347f93'); -- admin