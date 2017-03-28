-- $Id: 03-100-addPermissionWfCardUpdate.sql 2500 2011-08-26 11:05:56Z novikov $

UPDATE sec_permission SET value = 1 where target ='wf$Card:update' and value = 0 and type =20;