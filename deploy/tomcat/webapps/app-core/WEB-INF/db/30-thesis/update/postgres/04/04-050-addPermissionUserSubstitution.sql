-- $Id: 04-050-addPermissionUserSubstitution.sql 11283 2013-08-12 09:34:32Z pavlov $
-- Description:

INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,type,target,value,role_id)
VALUES ('8b17059e-045a-11e1-9ff0-5b3f364a9175',now(),'admin',1,now(),null,null,null,10,'df$UserSubstitution.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');