-- $Id: 131001-1255-dropUserLoginColumns.sql 12169 2013-10-02 07:42:13Z zudin $
alter table SEC_USER DROP COLUMN first_login;
alter table SEC_USER DROP COLUMN user_is_first_change_password;