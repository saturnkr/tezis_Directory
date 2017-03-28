-- $Id: 150728-1245-updateEmployeeNamesLengths.sql 21201 2015-08-12 08:52:35Z gaslov $

alter table df_employee alter column name varchar(255);
alter table df_employee alter column first_name varchar(255);
alter table df_employee alter column last_name varchar(255);
alter table df_employee alter column middle_name varchar(255);

alter table df_correspondent alter column name varchar(255);