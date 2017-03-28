--$Id: 121218-1441-deleteSuperTypeFromAdmin.sql 12781 2013-10-25 09:55:02Z saiyan $

update SEC_ROLE set ROLE_TYPE=null where name='Administrators' ^