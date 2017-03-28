-- $Id: 140320-1039-addUserEditScreenPermission.sql 15403 2014-03-20 07:48:52Z kozyaikin $
-- Description:
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='tm$User.edit:fieldGroup', @p_type=50, @p_value=1^
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='tm$User.edit:split', @p_type=50, @p_value=0^
