-- $Id: 03-220-InsertPermission.sql 2622 2011-09-13 11:33:39Z novikov $
-- Description:

INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id) VALUES (newid(),now(),USER,1,20,'wf$AttachmentType:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id) VALUES (newid(),now(),USER,1,20,'wf$AttachmentType:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id) VALUES (newid(),now(),USER,1,20,'wf$AttachmentType:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');

INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id) VALUES (newid(),now(),USER,1,20,'df$TypicalResolution:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id) VALUES (newid(),now(),USER,1,20,'df$TypicalResolution:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id) VALUES (newid(),now(),USER,1,20,'df$TypicalResolution:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');