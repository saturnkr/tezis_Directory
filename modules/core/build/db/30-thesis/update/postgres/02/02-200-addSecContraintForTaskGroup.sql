-- $Id: 02-200-addSecContraintForTaskGroup.sql 1963 2011-05-23 08:10:08Z chernov $
-- Description:

INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('7b87c520-5c2e-11e0-a770-b3d23ae5dd33',now(),'admin',1,now(),'admin',null,null,'tm$TaskGroup','left join {E}.taskGroupTasks tgt left join {E}.participants p',
'({E}.subCreator.id = :session$userId
or p.id = :session$userId
or {E}.chairman.id = :session$userId
or {E}.secretary.id = :session$userId
or {E}.initiator.id = :session$userId
or exists (select c from wf$CardRole c where c.card.id = tgt.task.id and c.user.id = :session$userId and c.deleteTs is null))',
'8e6306e2-9e10-414a-b437-24c91ffef804');


INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id)
SELECT '86c0ba0a-5c2e-11e0-b52d-0f8fb8df9d93', now(),'admin', 1,now(), 'admin',null,null, 'tm$TaskGroup','left join {E}.taskGroupTasks tgt left join {E}.participants p',
'({E}.subCreator.id = :session$userId
or p.id = :session$userId
or {E}.chairman.id = :session$userId
or {E}.secretary.id = :session$userId
or {E}.initiator.id = :session$userId
or exists (select c from wf$CardRole c where c.card.id = tgt.task.id and c.user.id = :session$userId and c.deleteTs is null))',
'7dfe5c72-073f-4e1e-9cf4-1b1bad9c0093'
FROM "public"."sec_group" where id = '7dfe5c72-073f-4e1e-9cf4-1b1bad9c0093';