--$Id: 130410-1636-addColumnEmoloyeeDepartmentRelation.sql 9298 2013-04-22 08:26:09Z kozyaikin $
--$Description:
alter table DF_EMPLOYEE_DEPARTMENT_RELATION add IS_MAIN boolean^

update DF_EMPLOYEE_DEPARTMENT_RELATION set  IS_MAIN=true;