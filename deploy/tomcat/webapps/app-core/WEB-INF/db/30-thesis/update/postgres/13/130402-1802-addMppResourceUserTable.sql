--$Id: 130402-1802-addMppResourceUserTable.sql 8913 2013-04-05 05:45:33Z stekolschikov $
--Description:

create table TM_MPP_RESOURCE_USER (
       ID uuid,
       CREATE_TS timestamp,
       CREATED_BY varchar(50),
       VERSION integer,
       UPDATE_TS timestamp,
       UPDATED_BY varchar(50),
       DELETE_TS timestamp,
       DELETED_BY varchar(50),

       RESOURCE_NAME varchar(256),
       USER_ID uuid,
       primary key(ID)
)^

alter table TM_MPP_RESOURCE_USER add constraint FK_TM_MPP_RESOURCE_USER_USER foreign key (USER_ID) references SEC_USER (ID)^