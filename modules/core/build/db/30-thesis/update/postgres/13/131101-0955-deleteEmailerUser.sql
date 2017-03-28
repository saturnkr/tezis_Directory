-- $Id: 131101-0955-deleteEmailerUser.sql 12958 2013-11-01 08:32:40Z murzin $
-- Description Remove "emailer" user:

update SEC_USER set DELETED_BY = 'admin', DELETE_TS = now() where ID = '60885987-1b61-4247-94c7-dff348347f94';