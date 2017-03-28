--$Id: 121220-1257-addSuperTypeForAdmin.sql 11467 2013-08-26 09:38:04Z zudin $

update SEC_ROLE set ROLE_TYPE=10 where name='Administrators' ^