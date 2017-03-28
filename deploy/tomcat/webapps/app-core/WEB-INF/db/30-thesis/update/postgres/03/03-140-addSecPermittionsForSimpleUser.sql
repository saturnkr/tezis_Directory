-- $Id: 03-140-addSecPermittionsForSimpleUser.sql 4121 2012-03-01 11:09:08Z pavlov $

INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id) VALUES (newid(),now(),'admin',1,20,'df$OfficeFile:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id) VALUES (newid(),now(),'admin',1,20,'df$OfficeFile:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id) VALUES (newid(),now(),'admin',1,20,'df$OfficeFile:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c')^

INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id) VALUES (newid(),now(),'admin',1,20,'df$OfficeFileNomenclature:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id) VALUES (newid(),now(),'admin',1,20,'df$OfficeFileNomenclature:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id) VALUES (newid(),now(),'admin',1,20,'df$OfficeFileNomenclature:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c')^