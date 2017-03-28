-- $Id: 03-060-addSecPermittions.sql 2313 2011-07-22 09:02:47Z ternovsky $

INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id) VALUES (newid(),now(),'admin',1,20,'df$DocKind:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id) VALUES (newid(),now(),'admin',1,20,'df$DocKind:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c')^
INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id) VALUES (newid(),now(),'admin',1,20,'df$DocKind:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c')^