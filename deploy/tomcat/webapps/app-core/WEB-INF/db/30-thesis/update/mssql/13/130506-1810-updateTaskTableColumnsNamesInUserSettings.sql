--$Id: 130506-1810-updateTaskTableColumnsNamesInUserSettings.sql 9514 2013-05-07 11:54:41Z chekashkin $
--$Description: updates column names in old userSettings
update sec_user_setting set value = replace(value, 'executor.name', 'executorsString');
update sec_user_setting set value = replace(value, 'currentActor.name', 'currentActorsString');
update sec_presentation set xml = replace(xml, 'executor.name', 'executorsString');
update sec_presentation set xml = replace(xml, 'currentActor.name', 'currentActorsString');