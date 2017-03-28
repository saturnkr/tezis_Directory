--$Id: 121218-1441-deleteSuperTypeFromAdmin.sql 11467 2013-08-26 09:38:04Z zudin $

update SEC_ROLE set ROLE_TYPE = null where name='Administrators'^