-- $Id: 03-190-InsertPermissionForOfficeFile.sql 2575 2011-09-07 09:24:35Z novikov $
-- Description:

INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id) VALUES (newid(),now(),USER,1,20,'df$OfficeFileNomenclature:create',1,'7091f5ef-a77a-450a-834a-39406885676e');
INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id) VALUES (newid(),now(),USER,1,20,'df$OfficeFileNomenclature:update',1,'7091f5ef-a77a-450a-834a-39406885676e');
INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id) VALUES (newid(),now(),USER,1,20,'df$OfficeFileNomenclature:delete',1,'7091f5ef-a77a-450a-834a-39406885676e');
INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id) VALUES (newid(),now(),USER,1,20,'df$OfficeFile:create',1,'7091f5ef-a77a-450a-834a-39406885676e');
INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id) VALUES (newid(),now(),USER,1,20,'df$OfficeFile:update',1,'7091f5ef-a77a-450a-834a-39406885676e');
INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id) VALUES (newid(),now(),USER,1,20,'df$OfficeFile:delete',1,'7091f5ef-a77a-450a-834a-39406885676e');