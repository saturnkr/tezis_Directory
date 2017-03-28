-- $Id: 130912-1907-addIsFirstChangePassword.sql 11851 2013-09-16 16:27:30Z saiyan $

alter table SEC_USER add USER_IS_FIRST_CHANGE_PASSWORD tinyint;
alter table SEC_USER add FIRST_LOGIN tinyint^

update SEC_USER set FIRST_LOGIN = 0;
update SEC_USER set USER_IS_FIRST_CHANGE_PASSWORD = 0;