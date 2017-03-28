--$Id: 130710-1825-refactorDepartment.sql 11215 2013-08-02 13:36:37Z saiyan $
--$Description: refactor department table

alter table DF_DEPARTMENT
    drop column if exists CREATE_TS,
    drop column if exists CREATED_BY,
    drop column if exists UPDATE_TS,
    drop column if exists UPDATED_BY,
    drop column if exists DELETE_TS,
    drop column if exists DELETED_BY,
    drop column if exists VERSION,
    drop column if exists NAME,
    drop column if exists TYPE ^