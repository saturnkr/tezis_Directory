--$Id: 130907-1400-dropEmployeeSystemFields.sql 11942 2013-09-22 10:28:21Z saiyan $
--$Description: drop employee system fields

if exists (select * from SYSINDEXES where name = 'IDX_DF_EMPLOYEE_CREATE_TS')
drop index DF_EMPLOYEE.IDX_DF_EMPLOYEE_CREATE_TS;

if exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'DF_EMPLOYEE' and 'COLUMN_NAME' = 'UPDATED_BY')
alter table DF_EMPLOYEE
    drop column CREATE_TS,
                CREATED_BY,
                UPDATE_TS,
                UPDATED_BY,
                DELETE_TS,
                DELETED_BY,
                VERSION;

if not exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'DF_EMPLOYEE' and COLUMN_NAME = 'CREATE_TS')
BEGIN
alter table DF_EMPLOYEE add CREATE_TS datetime default current_timestamp ;
create clustered index IDX_DF_EMPLOYEE_CREATE_TS on DF_EMPLOYEE (CREATE_TS)
END
^