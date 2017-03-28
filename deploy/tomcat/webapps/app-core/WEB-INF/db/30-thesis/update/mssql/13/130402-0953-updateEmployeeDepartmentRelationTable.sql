--$Id: 130402-0953-updateEmployeeDepartmentRelationTable.sql 8809 2013-04-02 11:58:01Z kozyaikin $
--$Description:

insert into DF_EMPLOYEE_DEPARTMENT_RELATION (id, create_Ts,created_by,department_id,employee_id)
select newid(),{ts '2013-04-01 09:59:00.350'},'admin',e.department_id,e.correspondent_id from df_employee e where e.department_id is not null^