-- $Id: 140320-1039-addUserEditScreenPermission.sql 15403 2014-03-20 07:48:52Z kozyaikin $
-- Description:
select create_or_update_sec_permission('SimpleUser', 'tm$User.edit:fieldGroup', 50, 1)^
select create_or_update_sec_permission('SimpleUser', 'tm$User.edit:split', 50, 0)^
