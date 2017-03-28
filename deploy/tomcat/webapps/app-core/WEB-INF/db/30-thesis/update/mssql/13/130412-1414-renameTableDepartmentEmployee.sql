--$Id: 130412-1414-renameTableDepartmentEmployee.sql 9343 2013-04-24 12:09:07Z kozyaikin $
--$Description:

DROP VIEW [dbo].[df_department_membership]^
sp_RENAME 'DF_EMPLOYEE_DEPARTMENT_RELATION', 'DF_EMPLOYEE_DEPARTMENT_POSITION_RELATION'
^
