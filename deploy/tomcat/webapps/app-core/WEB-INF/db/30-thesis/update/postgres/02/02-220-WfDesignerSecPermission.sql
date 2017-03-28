-- $Id: 02-220-WfDesignerSecPermission.sql 11283 2013-08-12 09:34:32Z pavlov $
-- Description

INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,type,target,value,role_id) VALUES
('9019aa96-60dc-11e0-bc0b-17274be9dbd9',current_timestamp,null,1,null,null,null,null,10,'wf$Design.browse',1,'0c018061-b26f-4de2-a5be-dff348347f93')^

INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,type,target,value,role_id) VALUES
('96a6d56e-60dc-11e0-b398-1748ee18874b',current_timestamp,null,1,null,null,null,null,10,'wf$Design.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c')^