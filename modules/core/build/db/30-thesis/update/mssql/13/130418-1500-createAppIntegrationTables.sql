--$Id: 130418-1500-createAppIntegrationTables.sql 11283 2013-08-12 09:34:32Z pavlov $
--Description:

create table DF_APP_INTEGRATION_LOG (
      ID uniqueidentifier not null,
      CREATE_TS datetime,
      CREATED_BY varchar(50),
      VERSION integer,
      UPDATE_TS datetime,
      UPDATED_BY varchar(50),
      DELETE_TS datetime,
      DELETED_BY varchar(50),
      CHANGE_TYPE varchar(10),
      ENTITY_NAME varchar(100),
      ENTITY_ID uniqueidentifier,
      CHANGES_SET_ID uniqueidentifier,
      INTEGRATION_STATE integer,
      INTEGRATION_STATE_DATE datetime,
      primary key nonclustered (ID)
);

create index IDX_DF_ACCOUNTING_APP_INTEGRATION_LOG on DF_APP_INTEGRATION_LOG (ENTITY_NAME, ENTITY_ID);
create index IDX_DF_ACCOUNTING_APP_INTEGRATION_LOG_CHANGES_SET_ID_INTEGRATION_STATE on DF_APP_INTEGRATION_LOG (CHANGES_SET_ID, INTEGRATION_STATE);


create table DF_APP_INTEGRATION_LINK_ENTITY (
      ID uniqueidentifier not null,
      CREATE_TS datetime,
      CREATED_BY varchar(50),
      VERSION integer,
      UPDATE_TS datetime,
      UPDATED_BY varchar(50),
      DELETE_TS datetime,
      DELETED_BY varchar(50),
      ENTITY_NAME varchar(100),
      ENTITY_ID uniqueidentifier,
      EXTERNAL_ID varchar(100),
      primary key nonclustered (ID)
);

create index IDX_DF_APP_INTEGRATION_LINK_ENTITY_ENTITY_NAME_ENTITY_ID on DF_APP_INTEGRATION_LINK_ENTITY (ENTITY_NAME, ENTITY_ID);

create index IDX_DF_APP_INTEGRATION_LINK_ENTITY_ENTITY_NAME_EXTERNAL_ID on DF_APP_INTEGRATION_LINK_ENTITY (ENTITY_NAME, EXTERNAL_ID);

INSERT INTO SEC_ROLE (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role)
VALUES ('e8b73444-cb05-11e2-b014-d7054a634646',current_timestamp ,'admin',1,current_timestamp ,null,null,null,'AppIntegrationRole','Интеграция с учетной системой',null,null);

exec create_or_update_sec_permission @r_name='Administrators', @p_target='df$AppIntegrationLog.browse', @p_type=10, @p_value=1;
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='df$AppIntegrationLog.browse', @p_type=10, @p_value=0;
exec create_or_update_sec_permission @r_name='AppIntegrationRole', @p_target='df$AppIntegrationLog.browse', @p_type=10, @p_value=1^