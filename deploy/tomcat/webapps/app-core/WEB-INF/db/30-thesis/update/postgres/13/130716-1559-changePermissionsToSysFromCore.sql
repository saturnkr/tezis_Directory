--$Id: 130716-1559-changePermissionsToSysFromCore.sql 11003 2013-07-24 13:47:29Z pavlov $
--Description:

update SEC_PERMISSION set TARGET = 'sys$Folder:delete' where TARGET  = 'core$Folder:delete';
update SEC_PERMISSION set TARGET = 'sys$Folder:update' where TARGET  = 'core$Folder:update';
update SEC_PERMISSION set TARGET = 'sys$Folder:create' where TARGET  = 'core$Folder:create';

update SEC_PERMISSION set TARGET = 'sys$Server:delete' where TARGET  = 'core$Server:delete';
update SEC_PERMISSION set TARGET = 'sys$Server:update' where TARGET  = 'core$Server:update';
update SEC_PERMISSION set TARGET = 'sys$Server:create' where TARGET  = 'core$Server:create';

update SEC_PERMISSION set TARGET = 'sys$AppFolder:delete' where TARGET  = 'core$AppFolder:delete';
update SEC_PERMISSION set TARGET = 'sys$AppFolder:update' where TARGET  = 'core$AppFolder:update';
update SEC_PERMISSION set TARGET = 'sys$AppFolder:create' where TARGET  = 'core$AppFolder:create';