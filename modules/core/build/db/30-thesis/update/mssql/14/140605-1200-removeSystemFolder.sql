update sys_folder set parent_id = null where parent_id in (select id from sys_folder where name = 'SearchFolder_task.system');
delete sec_search_folder from sec_search_folder join sys_folder on sys_folder.id = sec_search_folder.folder_id  where sys_folder.name = 'SearchFolder_task.system';
delete from sys_folder where parent_id is null and name = 'SearchFolder_task.system'