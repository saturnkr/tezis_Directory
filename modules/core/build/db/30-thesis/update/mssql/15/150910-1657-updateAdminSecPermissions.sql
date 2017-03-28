-- $Id: 150910-1657-updateAdminSecPermissions.sql 21619 2015-09-10 13:11:24Z timokhov $
-- Description:
exec create_or_update_sec_permission @r_name='Administrators', @p_target='df$TypicalResolution:create', @p_type=20, @p_value=1^
exec create_or_update_sec_permission @r_name='Administrators', @p_target='df$TypicalResolution:update', @p_type=20, @p_value=1^
exec create_or_update_sec_permission @r_name='Administrators', @p_target='df$TypicalResolution:delete', @p_type=20, @p_value=1^