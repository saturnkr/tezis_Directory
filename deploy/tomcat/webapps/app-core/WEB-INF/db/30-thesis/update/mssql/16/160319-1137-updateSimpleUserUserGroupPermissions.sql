-- $Id: 160319-1137-updateSimpleUserUserGroupPermissions.sql 23800 2016-03-19 07:45:33Z chekashkin $
-- Description: grant user group permissions for simple user

exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='wf$UserGroup:create', @p_type=20, @p_value=1^
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='wf$UserGroup:update', @p_type=20, @p_value=1^
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='wf$UserGroup:delete', @p_type=20, @p_value=1^