--$Id: 130418-1500-createAppIntegrationTables.sql 13334 2013-11-19 16:13:16Z saiyan $
--Description:

create table DF_APP_INTEGRATION_LOG (
      ID uuid not null,
      CREATE_TS timestamp,
      CREATED_BY varchar(50),
      VERSION integer,
      UPDATE_TS timestamp,
      UPDATED_BY varchar(50),
      DELETE_TS timestamp,
      DELETED_BY varchar(50),
      CHANGE_TYPE varchar(10),
      ENTITY_NAME varchar(100),
      ENTITY_ID uuid,
      CHANGES_SET_ID uuid,
      INTEGRATION_STATE integer,
      INTEGRATION_STATE_DATE timestamp,
      primary key (ID)
);

create index IDX_DF_ACCOUNTING_APP_INTEGRATION_LOG on DF_APP_INTEGRATION_LOG (ENTITY_NAME, ENTITY_ID);
create index IDX_DF_ACCOUNTING_APP_INTEGRATION_LOG_CHANGES_SET_ID_INTEGRATION_STATE on DF_APP_INTEGRATION_LOG (CHANGES_SET_ID, INTEGRATION_STATE);


create table DF_APP_INTEGRATION_LINK_ENTITY (
      ID uuid not null,
      CREATE_TS timestamp,
      CREATED_BY varchar(50),
      VERSION integer,
      UPDATE_TS timestamp,
      UPDATED_BY varchar(50),
      DELETE_TS timestamp,
      DELETED_BY varchar(50),
      ENTITY_NAME varchar(100),
      ENTITY_ID uuid,
      EXTERNAL_ID varchar(100),
      primary key (ID)
);

create index IDX_DF_APP_INTEGRATION_LINK_ENTITY_ENTITY_NAME_ENTITY_ID on DF_APP_INTEGRATION_LINK_ENTITY (ENTITY_NAME, ENTITY_ID);

create index IDX_DF_APP_INTEGRATION_LINK_ENTITY_ENTITY_NAME_EXTERNAL_ID on DF_APP_INTEGRATION_LINK_ENTITY (ENTITY_NAME, EXTERNAL_ID);

INSERT INTO "public"."sec_role" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role)
VALUES ('e8b73444-cb05-11e2-b014-d7054a634646',now(),'admin',1,now(),null,null,null,'AppIntegrationRole','Интеграция с учетной системой',null,null);

^
select create_or_update_sec_permission('Administrators', 'df$AppIntegrationLog.browse', 10, 1)
^
select create_or_update_sec_permission('SimpleUser', 'df$AppIntegrationLog.browse', 10, 0)
^
select create_or_update_sec_permission('AppIntegrationRole', 'df$AppIntegrationLog.browse', 10, 1)^
