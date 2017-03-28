-- $Id: 150728-1245-updateEmployeeNamesLengths.sql 21200 2015-08-12 08:27:45Z gaslov $

alter table df_employee alter column name type varchar(255);
alter table df_employee alter column first_name type varchar(255);
alter table df_employee alter column last_name type varchar(255);
alter table df_employee alter column middle_name type varchar(255);

alter table df_correspondent alter column name type varchar(255);