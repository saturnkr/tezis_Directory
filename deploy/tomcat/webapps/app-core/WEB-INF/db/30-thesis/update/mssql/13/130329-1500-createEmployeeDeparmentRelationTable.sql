--$Id: 130329-1500-createEmployeeDeparmentRelationTable.sql 8809 2013-04-02 11:58:01Z kozyaikin $
--$Description:
create table DF_EMPLOYEE_DEPARTMENT_RELATION(
  ID uniqueidentifier not null,
  CREATE_TS datetime,
  CREATED_BY varchar(50),
  VERSION integer,
  UPDATE_TS datetime,
  UPDATED_BY varchar(50),
  DELETE_TS datetime,
  DELETED_BY varchar(50),

  EMPLOYEE_ID uniqueidentifier,
  DEPARTMENT_ID uniqueidentifier,

  primary key (ID)
)^

alter table DF_EMPLOYEE_DEPARTMENT_RELATION add constraint FK_DF_EMPLOYEE_DEPARTMENT_RELATION_ACCOUNT_DF_EMPLOYEE foreign key (EMPLOYEE_ID) references DF_EMPLOYEE(CORRESPONDENT_ID)^
alter table DF_EMPLOYEE_DEPARTMENT_RELATION add constraint FK_DF_EMPLOYEE_DEPARTMENT_RELATION_DF_DEPARTMENT foreign key (DEPARTMENT_ID) references DF_DEPARTMENT(CORRESPONDENT_ID)^