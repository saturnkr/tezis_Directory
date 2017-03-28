--$Id: 130419-1538-addPermissionOnReassigenScreen.sql 12781 2013-10-25 09:55:02Z saiyan $
--$Description:  updated to support migration from 3.4 to 3.6

--INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,type,target,value,role_id) VALUES ('94de95ef-0490-441e-beb3-81b0ae0541d3',{ts '2013-04-19 15:35:05.93'},'admin',1,{ts '2013-04-19 15:35:05.93'},null,null,null,10,'reassignment.form',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='reassignment.form', @p_type=10, @p_value=0 ^
