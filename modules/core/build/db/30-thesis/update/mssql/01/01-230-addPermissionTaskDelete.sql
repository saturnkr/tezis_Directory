-- $Id: 01-230-addPermissionTaskDelete.sql 5902 2012-08-31 10:23:17Z Novikov $

exec create_or_update_sec_permission @r_name='Administrators', @p_target='tm$Task:delete', @p_type=20, @p_value=1^