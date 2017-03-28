-- $Id: 150910-1657-updateAdminSecPermissions.sql 21619 2015-09-10 13:11:24Z timokhov $
-- Description:
select create_or_update_sec_permission('Administrators', 'df$TypicalResolution:create', 20, 1)^
select create_or_update_sec_permission('Administrators', 'df$TypicalResolution:update', 20, 1)^
select create_or_update_sec_permission('Administrators', 'df$TypicalResolution:delete', 20, 1)^