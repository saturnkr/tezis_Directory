-- $Id: 04-060-addUserSubstitutionEditorSecRole.sql 3963 2012-02-10 14:27:25Z pavlov $
-- Description: add sec_role - UserSubstitutionEditor

INSERT INTO "public"."sec_role" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role)
VALUES ('b6a03cd4-0479-11e1-b6c9-77dd813b99ee',now(),'admin',1,now(),null,null,null,'UserSubstitutionEditor','Редактирование замещений пользователей',null,null);