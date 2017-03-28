-- $Id: 160302-1527-updateUserGroupPermissions.sql 23582 2016-03-02 13:34:31Z chekashkin $
-- Description: update user group permissions

select create_or_update_sec_permission('Administrators', 'wf$UserGroup:create', 20, 1)^
select create_or_update_sec_permission('Administrators', 'wf$UserGroup:update', 20, 1)^
select create_or_update_sec_permission('Administrators', 'wf$UserGroup:delete', 20, 1)^

select create_or_update_sec_permission('SimpleUser', 'wf$UserGroup:create', 20, 0)^
select create_or_update_sec_permission('SimpleUser', 'wf$UserGroup:update', 20, 0)^
select create_or_update_sec_permission('SimpleUser', 'wf$UserGroup:delete', 20, 0)^