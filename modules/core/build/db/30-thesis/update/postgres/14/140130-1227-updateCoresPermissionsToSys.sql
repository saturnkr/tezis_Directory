--$Id: 140130-1227-updateCoresPermissionsToSys.sql 14673 2014-01-30 18:24:11Z pavlov $
--$Description:

update sec_permission set target='sys$' || substring(target from 6) where target like 'core$%'