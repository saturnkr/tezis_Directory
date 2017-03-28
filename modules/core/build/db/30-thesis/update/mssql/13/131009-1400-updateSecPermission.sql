-- $Id: 131009-1400-updateSecPermission.sql 12399 2013-10-09 13:04:49Z gaponenkov $
-- $Description:

exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='entityRestore', @p_type=10, @p_value=0^