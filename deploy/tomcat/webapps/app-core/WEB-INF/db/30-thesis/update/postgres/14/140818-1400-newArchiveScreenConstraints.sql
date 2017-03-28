--$Id: 140818-1400-newArchiveScreenConstraints.sql 17123 2014-08-18 13:26:19Z saiyan $

-- admin must see archive lists
delete from sec_permission where role_id = '0c018061-b26f-4de2-a5be-dff348347f93' and target = 'ts$ArchivedSimpleDoc.browse';
delete from sec_permission where role_id = '0c018061-b26f-4de2-a5be-dff348347f93' and target = 'ts$ArchivedContract.browse';

-- secretary must see ArchivistWorkplace
insert into sec_permission(id, create_ts, created_by, version, permission_type, target, value, role_id) values
(newid(), now(), 'system', 1, 10, 'ts$ArchivistWorkplace', 1, '7091f5ef-a77a-450a-834a-39406885676e');