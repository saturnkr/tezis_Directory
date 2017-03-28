-- $Id:$
-- Description:

INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id)
VALUES (newid(),now(),'admin',1,10,'sys$Categories.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
