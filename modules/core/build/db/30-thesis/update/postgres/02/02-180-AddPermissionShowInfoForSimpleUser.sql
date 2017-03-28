-- $Id: 02-180-AddPermissionShowInfoForSimpleUser.sql 1658 2011-03-29 10:35:45Z chernov $
-- Description:

INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,type,target,value,role_id) VALUES ('826c59e4-593d-11e0-afdc-87a3d5cee637',null,'admin',1,null,null,null,null,40,'cuba.gui.showInfo',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c');