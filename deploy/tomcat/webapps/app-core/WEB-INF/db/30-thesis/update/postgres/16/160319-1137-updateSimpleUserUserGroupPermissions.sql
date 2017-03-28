-- $Id: 160319-1137-updateSimpleUserUserGroupPermissions.sql 23800 2016-03-19 07:45:33Z chekashkin $
-- Description: grant user group permissions for simple user

select create_or_update_sec_permission('SimpleUser', 'wf$UserGroup:create', 20, 1)^
select create_or_update_sec_permission('SimpleUser', 'wf$UserGroup:update', 20, 1)^
select create_or_update_sec_permission('SimpleUser', 'wf$UserGroup:delete', 20, 1)^