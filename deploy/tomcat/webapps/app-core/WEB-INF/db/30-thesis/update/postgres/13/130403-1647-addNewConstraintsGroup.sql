 --$Id: 130403-1647-addNewConstraintsGroup.sql 11467 2013-08-26 09:38:04Z zudin $
 --$Description:

INSERT INTO "public"."sec_group" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,parent_id) VALUES ('b3dc60f5-65b2-47ab-8802-9e8929bf8b29',{ts '2013-04-03 09:47:08.650'},'admin',1,{ts '2013-04-03 09:47:08.650'},null,null,null,'Ограниченный доступ + все документы','0fa2b1a5-1d68-4d69-9fbd-dff348347f93')^
INSERT INTO sec_group_hierarchy (id,create_ts,created_by,group_id,parent_id,HIERARCHY_LEVEL) VALUES ('4d37ce8d-09fe-419b-9c25-228240750c91',{ts '2013-04-03 09:47:08.650'},'admin','b3dc60f5-65b2-47ab-8802-9e8929bf8b29','0fa2b1a5-1d68-4d69-9fbd-dff348347f93',0)^

INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('51dd3fc6-ba93-467c-807b-ea5120721baf',{ts '2013-04-03 16:19:38.700'},'admin',3,{ts '2013-04-03 18:41:49.210'},'admin',null,null,'df$Contract',', ts$CardAcl acl','{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)','b3dc60f5-65b2-47ab-8802-9e8929bf8b29');
INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('3f520104-c1d0-4877-a331-522a53a372b3',{ts '2013-04-03 09:49:51.740'},'admin',5,{ts '2013-04-03 18:41:40.300'},'admin',null,null,'tm$Task',', ts$CardAcl acl','{E}.id = acl.card.id and acl.user.id = :session$userId','b3dc60f5-65b2-47ab-8802-9e8929bf8b29');

insert into SEC_CONSTRAINT (ID,CREATE_TS,CREATED_BY,VERSION, ENTITY_NAME,JOIN_CLAUSE,WHERE_CLAUSE,GROUP_ID) values ('0550da4d-de10-4d36-9d5e-a57f043e83c3', CURRENT_TIMESTAMP, USER, 1, 'df$TypicalResolution', null, '({E}.global = true OR {E}.substitutedCreator.id = :session$userId)', 'b3dc60f5-65b2-47ab-8802-9e8929bf8b29')^

INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('c3096def-c3eb-4580-b9e6-da6a71407f50', now(),'admin', 1,now(), 'admin',null,null, 'tm$TaskPattern',', ts$CardAcl acl','{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)', 'b3dc60f5-65b2-47ab-8802-9e8929bf8b29');

INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('8c876c9a-d973-43ed-8837-b01a8219146d',now(),'admin',1,now(),'admin',null,null,'tm$TaskGroup','left join {E}.taskGroupTasks tgt left join {E}.participants p',
'({E}.subCreator.id = :session$userId
or p.id = :session$userId
or {E}.chairman.id = :session$userId
or {E}.secretary.id = :session$userId
or {E}.initiator.id = :session$userId
or exists (select c from wf$CardRole c where c.card = tgt.task and c.user.id = :session$userId and c.deleteTs is null) or  ({E}.template = true AND {E}.global = true  ))',
'b3dc60f5-65b2-47ab-8802-9e8929bf8b29');

insert into SEC_CONSTRAINT (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, ENTITY_NAME, JOIN_CLAUSE, WHERE_CLAUSE, GROUP_ID) VALUES(
 '7233a472-a010-4344-a90a-c81b7c05d75a', {ts '2013-04-03 16:19:38.700'},'admin', 1, null, null, null, null, 'tm$UserGroup', null, '({E}.substitutedCreator.id = :session$userId or {E}.global = true)','b3dc60f5-65b2-47ab-8802-9e8929bf8b29') ^




INSERT INTO "public"."sec_group" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,parent_id) VALUES ('9e44a053-a31f-4edd-b19b-39e942161dd2',{ts '2013-04-03 09:47:08.650'},'admin',1,{ts '2013-04-03 09:47:08.650'},null,null,null,'Ограниченный доступ + все договоры','0fa2b1a5-1d68-4d69-9fbd-dff348347f93')^
INSERT INTO sec_group_hierarchy (id,create_ts,created_by,group_id,parent_id,HIERARCHY_LEVEL) VALUES ('4d37ce8d-09fe-419b-9c25-228240750c92',{ts '2013-04-03 09:47:08.650'},'admin','9e44a053-a31f-4edd-b19b-39e942161dd2','0fa2b1a5-1d68-4d69-9fbd-dff348347f93',0)^

INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('f79f52d4-d71b-4270-9c3d-72cbc37a32fb',{ts '2013-04-03 16:22:33.800'},'admin',3,{ts '2013-04-03 18:42:01.850'},'admin',null,null,'df$SimpleDoc',', ts$CardAcl acl','{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)','9e44a053-a31f-4edd-b19b-39e942161dd2');
INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('99961b6f-d798-479c-9b93-04b16a99ff62',{ts '2013-04-03 17:53:02.610'},'admin',2,{ts '2013-04-03 18:41:27.100'},'admin',null,null,'df$Doc',', ts$CardAcl acl','{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)','9e44a053-a31f-4edd-b19b-39e942161dd2');
INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('a4fd0af5-9884-4076-97fd-aa291cdaba13',{ts '2013-04-03 09:49:51.740'},'admin',5,{ts '2013-04-03 18:41:40.300'},'admin',null,null,'tm$Task',', ts$CardAcl acl','{E}.id = acl.card.id and acl.user.id = :session$userId','9e44a053-a31f-4edd-b19b-39e942161dd2');
insert into SEC_CONSTRAINT (ID,CREATE_TS,CREATED_BY,VERSION, ENTITY_NAME,JOIN_CLAUSE,WHERE_CLAUSE,GROUP_ID) values ('66676c34-c087-448f-999e-9962b291982b', CURRENT_TIMESTAMP, USER, 1, 'df$TypicalResolution', null, '({E}.global = true OR {E}.substitutedCreator.id = :session$userId)', '9e44a053-a31f-4edd-b19b-39e942161dd2')^

INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('70170bc4-1b83-4829-b51c-17c19cf7c6db', now(),'admin', 1,now(), 'admin',null,null, 'tm$TaskPattern',', ts$CardAcl acl','{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)', '9e44a053-a31f-4edd-b19b-39e942161dd2');

INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('b9647fb6-33a6-4240-a07d-c63eb19e5e1d',now(),'admin',1,now(),'admin',null,null,'tm$TaskGroup','left join {E}.taskGroupTasks tgt left join {E}.participants p',
'({E}.subCreator.id = :session$userId
or p.id = :session$userId
or {E}.chairman.id = :session$userId
or {E}.secretary.id = :session$userId
or {E}.initiator.id = :session$userId
or exists (select c from wf$CardRole c where c.card = tgt.task and c.user.id = :session$userId and c.deleteTs is null) or  ({E}.template = true AND {E}.global = true  ))',
'9e44a053-a31f-4edd-b19b-39e942161dd2');

insert into SEC_CONSTRAINT (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, ENTITY_NAME, JOIN_CLAUSE, WHERE_CLAUSE, GROUP_ID) VALUES(
 '8bbf9553-994b-4fae-93ff-2ef6ebdc6d2d', {ts '2013-04-03 16:19:38.700'},'admin', 1, null, null, null, null, 'tm$UserGroup', null, '({E}.substitutedCreator.id = :session$userId or {E}.global = true)','9e44a053-a31f-4edd-b19b-39e942161dd2') ^
