update sys_folder set parent_id = null where parent_id in (select id from sys_folder where name = 'SearchFolder_task.system');
delete from sec_search_folder as t1 using sys_folder where sys_folder.id = t1.folder_id and sys_folder.name = 'SearchFolder_task.system';
delete from sys_folder where parent_id is null and name = 'SearchFolder_task.system'