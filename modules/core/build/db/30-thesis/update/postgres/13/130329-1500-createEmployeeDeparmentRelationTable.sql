--$Id: 130329-1500-createEmployeeDeparmentRelationTable.sql 8809 2013-04-02 11:58:01Z kozyaikin $
--$Description:
create table DF_EMPLOYEE_DEPARTMENT_RELATION(
  ID uuid not null,
  CREATE_TS timestamp,
  CREATED_BY varchar(50),
  VERSION integer,
  UPDATE_TS timestamp,
  UPDATED_BY varchar(50),
  DELETE_TS timestamp,
  DELETED_BY varchar(50),

  EMPLOYEE_ID uuid,
  DEPARTMENT_ID uuid,

  primary key (ID)
)^

alter table DF_EMPLOYEE_DEPARTMENT_RELATION add constraint FK_DF_EMPLOYEE_DEPARTMENT_RELATION_ACCOUNT_DF_EMPLOYEE foreign key (EMPLOYEE_ID) references DF_EMPLOYEE(correspondent_id)^
alter table DF_EMPLOYEE_DEPARTMENT_RELATION add constraint FK_DF_EMPLOYEE_DEPARTMENT_RELATION_DF_DEPARTMENT foreign key (DEPARTMENT_ID) references DF_DEPARTMENT(CORRESPONDENT_ID)^