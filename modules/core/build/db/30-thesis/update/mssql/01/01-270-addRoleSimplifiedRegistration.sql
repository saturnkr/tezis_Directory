-- $Id: 01-270-addRoleSimplifiedRegistration.sql 11283 2013-08-12 09:34:32Z pavlov $
-- Description:

INSERT INTO sec_role (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role) VALUES ('6d380898-297f-11e2-b2d9-278fef9a3a98',current_timestamp,'admin',1,current_timestamp,'admin',null,null,'SimplifiedRegistration','Упрощенная регистрация входящих',null,null);

exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='df$FastRegistration', @p_type=10, @p_value=0^
exec create_or_update_sec_permission @r_name='SimplifiedRegistration', @p_target='df$FastRegistration', @p_type=10, @p_value=1^
exec create_or_update_sec_permission @r_name='Administrators', @p_target='df$FastRegistration', @p_type=10, @p_value=1^
