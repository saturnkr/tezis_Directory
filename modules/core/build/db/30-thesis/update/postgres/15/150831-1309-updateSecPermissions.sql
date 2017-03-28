-- $Id: 150831-1309-updateSecPermissions.sql 21562 2015-09-08 06:00:28Z timokhov $
-- Description:
select create_or_update_sec_permission('SimpleUser', 'df$DocKind.edit', 10, 0)^
select create_or_update_sec_permission('SimpleUser', 'df$DocType.edit', 10, 0)^
select create_or_update_sec_permission('SimpleUser', 'sec$Role.edit', 10, 0)^
select create_or_update_sec_permission('SimpleUser', 'tm$TaskType.edit', 10, 0)^
select create_or_update_sec_permission('Administrators', 'tm$TaskType.edit', 10, 1)^