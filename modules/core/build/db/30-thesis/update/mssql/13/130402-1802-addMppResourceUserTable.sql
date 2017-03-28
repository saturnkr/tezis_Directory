--$Id: 130402-1802-addMppResourceUserTable.sql 9233 2013-04-18 08:27:44Z stekolschikov $
--Description:

create table TM_MPP_RESOURCE_USER (
       ID uniqueidentifier,
       CREATE_TS datetime,
       CREATED_BY varchar(50),
       VERSION integer,
       UPDATE_TS datetime,
       UPDATED_BY varchar(50),
       DELETE_TS datetime,
       DELETED_BY varchar(50),

       RESOURCE_NAME varchar(256),
       USER_ID uniqueidentifier,
       primary key(ID)
)^

alter table TM_MPP_RESOURCE_USER add constraint FK_TM_MPP_RESOURCE_USER_USER foreign key (USER_ID) references SEC_USER (ID)^