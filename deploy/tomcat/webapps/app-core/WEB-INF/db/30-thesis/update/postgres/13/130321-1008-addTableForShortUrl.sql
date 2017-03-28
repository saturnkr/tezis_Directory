--$Id: 130321-1008-addTableForShortUrl.sql 8746 2013-03-29 09:50:54Z kozyaikin $
--Description:
create table DF_SHORT_URL (
       ID uuid,
       CREATE_TS timestamp,
       CREATED_BY varchar(50),
       VERSION integer,
       UPDATE_TS timestamp,
       UPDATED_BY varchar(50),
       DELETE_TS timestamp,
       DELETED_BY varchar(50),

       LONG_URL varchar(1000),
       SHORT_URL varchar(100),

       primary key (ID)
  )^