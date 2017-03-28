-- $Id:
-- Description: add permission on screen wf$ProcStageType.browse

INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,type,target,value,role_id) VALUES
('9949bcba-593d-11e0-9c42-9b7369fed5db',current_timestamp,null,1,null,null,null,null,10,'wf$ProcStageType.browse',1,'0c018061-b26f-4de2-a5be-dff348347f93')^

INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,type,target,value,role_id) VALUES
('749504a6-593d-11e0-8e4e-9fd908e1e0e2',current_timestamp,null,1,null,null,null,null,10,'wf$ProcStageType.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c')^