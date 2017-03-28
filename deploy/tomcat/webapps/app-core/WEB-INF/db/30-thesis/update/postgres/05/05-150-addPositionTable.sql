--$Id: 05-150-addPositionTable.sql 7296 2012-12-27 10:09:04Z kozyaikin $
--Description:
create table DF_POSITION (
       ID uuid,
       CREATE_TS timestamp,
       CREATED_BY varchar(50),
       VERSION integer,
       UPDATE_TS timestamp,
       UPDATED_BY varchar(50),
       DELETE_TS timestamp,
       DELETED_BY varchar(50),

       NAME varchar(400),

       primary key (ID)
  )^