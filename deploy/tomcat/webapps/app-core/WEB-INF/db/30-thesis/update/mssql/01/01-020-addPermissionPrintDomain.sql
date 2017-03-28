-- $Id: 01-020-addPermissionPrintDomain.sql 11283 2013-08-12 09:34:32Z pavlov $
-- Description
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,type,target,value,role_id) VALUES ('a6935664-885e-11e1-9248-83ef391ff91f',current_timestamp,'admin',1,current_timestamp,null,null,null,10,'printDomain',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,type,target,value,role_id) VALUES ('83140af2-885f-11e1-9aa3-876f4796e54c',current_timestamp,'admin',1,current_timestamp,null,null,null,10,'printDomain',1,'0c018061-b26f-4de2-a5be-dff348347f93');
