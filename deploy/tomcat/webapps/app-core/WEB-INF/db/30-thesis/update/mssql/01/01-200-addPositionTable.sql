--$Id: 01-200-addPositionTable.sql 5871 2012-08-24 11:30:24Z kozyaikin $
--Description:
create table DF_POSITION (
     ID uniqueidentifier,
     CREATE_TS datetime,
     CREATED_BY varchar(50),
     VERSION integer,
     UPDATE_TS datetime,
     UPDATED_BY varchar(50),
     DELETE_TS datetime,
     DELETED_BY varchar(50),

     NAME varchar(400),

     primary key (ID)
);
