-- $Id: 130912-1907-addIsFirstChangePassword.sql 11840 2013-09-16 08:17:04Z zudin $

alter table SEC_USER ADD USER_IS_FIRST_CHANGE_PASSWORD boolean;
alter table SEC_USER ADD FIRST_LOGIN boolean;

update SEC_USER set FIRST_LOGIN = false;
update SEC_USER set USER_IS_FIRST_CHANGE_PASSWORD = false;