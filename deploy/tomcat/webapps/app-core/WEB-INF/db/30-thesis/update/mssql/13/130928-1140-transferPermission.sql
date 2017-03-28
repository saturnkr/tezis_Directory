--$Id: 130928-1140-transferPermission.sql 12075 2013-09-28 09:47:50Z zudin $
--$Description:

exec create_or_update_sec_permission @r_name='Administrators', @p_target='transferOfficeFile', @p_type=10, @p_value=1^
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='transferOfficeFile', @p_type=10, @p_value=0^