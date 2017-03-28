--$Id: 121205-1951-addPermittions.sql 12781 2013-10-25 09:55:02Z saiyan $
--Description:

exec create_or_update_sec_permission @r_name='Administrators', @p_target='df$Position:update', @p_type=20, @p_value=1 ^
exec create_or_update_sec_permission @r_name='Administrators', @p_target='df$Position:delete', @p_type=20, @p_value=1 ^
exec create_or_update_sec_permission @r_name='Administrators', @p_target='df$Position:read', @p_type=20, @p_value=1 ^
exec create_or_update_sec_permission @r_name='Administrators', @p_target='df$Position:create', @p_type=20, @p_value=1 ^

exec create_or_update_sec_permission @r_name='ReferenceEditor', @p_target='df$Position:update', @p_type=20, @p_value=1 ^
exec create_or_update_sec_permission @r_name='ReferenceEditor', @p_target='df$Position:delete', @p_type=20, @p_value=1 ^
exec create_or_update_sec_permission @r_name='ReferenceEditor', @p_target='df$Position:read', @p_type=20, @p_value=1 ^
exec create_or_update_sec_permission @r_name='ReferenceEditor', @p_target='df$Position:create', @p_type=20, @p_value=1 ^

exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='df$Position:update', @p_type=20, @p_value=0 ^
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='df$Position:delete', @p_type=20, @p_value=0 ^
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='df$Position:create', @p_type=20, @p_value=0 ^


