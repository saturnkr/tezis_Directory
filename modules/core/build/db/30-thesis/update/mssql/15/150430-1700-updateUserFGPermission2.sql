--$Id: 150430-1700-updateUserFGPermission2.sql 20039 2015-05-08 12:25:35Z saiyan $

exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='sec$User:timeZone', @p_type=30, @p_value=1^
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='sec$User:timeZoneAuto', @p_type=30, @p_value=1^