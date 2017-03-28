-- begin TEZISDIRECTORY_COST_ARTICLE
create table TEZISDIRECTORY_COST_ARTICLE (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    COSTARTICLE varchar(90),
    HOLDER_ID uuid,
    COMMERCIAL_ID uuid,
    --
    primary key (ID)
)^
-- end TEZISDIRECTORY_COST_ARTICLE
--Insert permissions for entity tezisdirectory$CostArticle
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),'system',1,now(),null,null,null,20,'tezisdirectory$CostArticle:create',0,(select id from sec_role where name='SimpleUser'));
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),'system',1,now(),null,null,null,20,'tezisdirectory$CostArticle:update',0,(select id from sec_role where name='SimpleUser'));
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),'system',1,now(),null,null,null,20,'tezisdirectory$CostArticle:delete',0,(select id from sec_role where name='SimpleUser'));
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),'system',1,now(),null,null,null,20,'tezisdirectory$CostArticle:create',1,(select id from sec_role where name='Administrators'));
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),'system',1,now(),null,null,null,20,'tezisdirectory$CostArticle:update',1,(select id from sec_role where name='Administrators'));
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),'system',1,now(),null,null,null,20,'tezisdirectory$CostArticle:delete',1,(select id from sec_role where name='Administrators'));
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),'system',1,now(),null,null,null,20,'tezisdirectory$CostArticle:create',1,(select id from sec_role where name='ReferenceEditor'));
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),'system',1,now(),null,null,null,20,'tezisdirectory$CostArticle:update',1,(select id from sec_role where name='ReferenceEditor'));
INSERT INTO sec_permission (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,PERMISSION_TYPE,target,value,role_id) VALUES (newid(),now(),'system',1,now(),null,null,null,20,'tezisdirectory$CostArticle:delete',1,(select id from sec_role where name='ReferenceEditor'));
-- begin DF_SIMPLE_DOC
alter table DF_SIMPLE_DOC add column COSTART_ID uuid ^
-- end DF_SIMPLE_DOC
