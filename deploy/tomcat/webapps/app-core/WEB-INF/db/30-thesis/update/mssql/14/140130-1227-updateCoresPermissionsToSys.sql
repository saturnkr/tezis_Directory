--$Id: 140130-1227-updateCoresPermissionsToSys.sql 14658 2014-01-30 10:35:43Z tsarevskiy $
--$Description:

update sec_permission set target='sys$' + substring(target, 6, len(target)) where target like 'core$%'