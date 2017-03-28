-- $Id: 03-150-addSecPermissions.sql 4121 2012-03-01 11:09:08Z pavlov $

INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id) VALUES (newid(),now(),'admin',1,20,'tm$Project:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c')^