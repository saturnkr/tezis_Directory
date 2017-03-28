--$Id: 04-230-updateEmployeeEntity.sql 3482 2011-12-20 06:04:30Z shishov $

alter table DF_EMPLOYEE add column MOBILE_PHONE varchar(100);
alter table DF_EMPLOYEE add column PHOTO_FILE_ID uuid;

alter table DF_EMPLOYEE add constraint FK_DF_EMPLOYEE_SYS_FILE foreign key (PHOTO_FILE_ID) references SYS_FILE (ID);