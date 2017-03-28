--$Id: 140821-1300-officeFileTransferLogPermissions.sql 17174 2014-08-21 09:32:40Z saiyan $

select create_or_update_sec_permission('SimpleUser', 'ts$OfficeFileTransferLog:create', 20, 0);
select create_or_update_sec_permission('SimpleUser', 'ts$OfficeFileTransferLog:update', 20, 0);
select create_or_update_sec_permission('SimpleUser', 'ts$OfficeFileTransferLog:delete', 20, 0);

select create_or_update_sec_permission('Archivist', 'ts$OfficeFileTransferLog:create', 20, 1);
select create_or_update_sec_permission('Archivist', 'ts$OfficeFileTransferLog:update', 20, 1);
select create_or_update_sec_permission('Archivist', 'ts$OfficeFileTransferLog:delete', 20, 1);