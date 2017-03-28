--$Id: 131114-1534-correctOldStylePermission.sql 13246 2013-11-14 11:42:44Z kudrenko $
update sec_permission set target = 'tm$TaskType.browse' where target = 'W:tm$TaskType.browse' ^