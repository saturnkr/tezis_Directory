-- $Id: 05-180-addPermissionTaskDelete.sql 5909 2012-09-03 08:19:59Z Novikov $
^
select create_or_update_sec_permission('Administrators', 'tm$Task:delete', 20, 1)^