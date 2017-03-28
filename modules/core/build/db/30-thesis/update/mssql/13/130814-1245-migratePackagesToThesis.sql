--$Id: 130814-1245-migratePackagesToThesis.sql 12779 2013-10-25 09:20:28Z gaponenkov $
-- Description: refactoring

update sys_app_folder
set quantity_script = replace (quantity_script, 'com.haulmont.docflow.core.cache.appfolders.AppfoldersHelper', 'com.haulmont.thesis.core.appfolders.predicates.AppfoldersHelper')
where quantity_script like '%com.haulmont.docflow.core.cache.appfolders.AppfoldersHelper%'^

update sys_app_folder
set quantity_script = replace (quantity_script, 'com/haulmont/taskman/core/appfolders/', 'com/haulmont/thesis/core/appfolders/task/'),
 visibility_script = replace (visibility_script, 'com/haulmont/taskman/core/appfolders/', 'com/haulmont/thesis/core/appfolders/task/')
where quantity_script like '%com/haulmont/taskman/core/appfolders/%' or visibility_script like '%com/haulmont/taskman/core/appfolders/%'^

update sys_app_folder
set quantity_script = replace (quantity_script, 'com/haulmont/docflow/core/appfolders/', 'com/haulmont/thesis/core/appfolders/doc/'),
visibility_script = replace (visibility_script, 'com/haulmont/docflow/core/appfolders/', 'com/haulmont/thesis/core/appfolders/doc/')
where quantity_script like '%com/haulmont/docflow/core/appfolders/%' or visibility_script like '%com/haulmont/docflow/core/appfolders/%'^

update df_numerator set script = replace (script,'com.haulmont.docflow', 'com.haulmont.thesis' )  where script  like '%com.haulmont.docflow%'^

update df_numerator set script = replace (script,'com.haulmont.taskman', 'com.haulmont.thesis' )  where script  like '%com.haulmont.taskman%'^

update  sec_logged_entity set name = replace(name, 'com.haulmont.taskman', 'com.haulmont.thesis') where name like '%taskman%'^

update  sec_logged_entity set name = replace(name, 'com.haulmont.docflow', 'com.haulmont.thesis') where name like '%docflow%'^

update tm_schedule_action_type set processor_class_name = replace (processor_class_name, 'com.haulmont.taskman', 'com.haulmont.thesis') where
processor_class_name like '%com.haulmont.taskman%' ^

update sec_entity_log set entity = replace(entity, 'com.haulmont.taskman', 'com.haulmont.thesis') where entity like '%taskman%'^

update sec_entity_log set entity = replace(entity, 'com.haulmont.docflow', 'com.haulmont.thesis') where entity like '%docflow%'^

update sys_category_attr set data_type = replace(data_type, 'com.haulmont.taskman', 'com.haulmont.thesis') where data_type like '%taskman%'^

update sys_category_attr set data_type = replace(data_type, 'com.haulmont.docflow', 'com.haulmont.thesis') where data_type like '%docflow%'^