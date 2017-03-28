--$Id: 130531-1510-addTaskTypeBrowsePermissionToAdmin.sql 12781 2013-10-25 09:55:02Z saiyan $
--$Description: adds permission to task type screen to admin

--insert into sec_permission (id, type, target, value, role_id)
--select newid(), 10, 'tm$TaskType.browse', 1, id from sec_role where name = 'Administrators';

exec create_or_update_sec_permission @r_name='Administrators', @p_target='tm$TaskType.browse', @p_type=10, @p_value=1;