-- $Id: 150802-1240-createEmployeeAvatar.sql 21009 2015-08-03 10:55:41Z korotkov $
-- Description:

alter table DF_EMPLOYEE add AVATAR_FILE_ID uniqueidentifier;
alter table DF_EMPLOYEE add constraint FK_DF_EMPLOYEE_AVATAR_FILE_ID foreign key (AVATAR_FILE_ID) references SYS_FILE(ID);