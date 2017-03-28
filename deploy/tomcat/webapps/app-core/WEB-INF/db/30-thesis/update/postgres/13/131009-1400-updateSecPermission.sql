-- $Id: 131009-1400-updateSecPermission.sql 12396 2013-10-09 11:00:25Z gaponenkov $
-- $Description:

select create_or_update_sec_permission('SimpleUser', 'entityRestore', 10, 0)^