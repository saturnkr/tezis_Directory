--$Id: 130409-1402-addColumnEmoloyeeDepartmentRelation.sql 9077 2013-04-12 12:59:59Z kozyaikin $
--$Description:
alter table DF_EMPLOYEE_DEPARTMENT_RELATION add position_id uniqueidentifier^

alter table DF_EMPLOYEE_DEPARTMENT_RELATION add constraint FK_DF_EMPLOYEE_DEPARTMENT_RELATION_ACCOUNT_DF_POSITION foreign key (POSITION_ID) references DF_POSITION(ID)^