--$Id: 130710-1840-refactorDepartment.sql 11215 2013-08-02 13:36:37Z saiyan $
--$Description: refactor department table
 
if exists (select * from SYSINDEXES where name = 'IDX_DF_DEPARTMENT_CREATE_TS')
drop index DF_DEPARTMENT.IDX_DF_DEPARTMENT_CREATE_TS;
 
if exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'DF_DEPARTMENT' and 'COLUMN_NAME' = 'UPDATED_BY')
alter table DF_DEPARTMENT
    drop column CREATE_TS,
                CREATED_BY,
                UPDATE_TS,
                UPDATED_BY,
                DELETE_TS,
                DELETED_BY,
                VERSION,
                NAME,
                TYPE;

if not exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'DF_DEPARTMENT' and COLUMN_NAME = 'CREATE_TS')
BEGIN
alter table DF_DEPARTMENT add CREATE_TS datetime default current_timestamp ;
create clustered index IDX_DF_DEPARTMENT_CREATE_TS on DF_DEPARTMENT (CREATE_TS)
END
^