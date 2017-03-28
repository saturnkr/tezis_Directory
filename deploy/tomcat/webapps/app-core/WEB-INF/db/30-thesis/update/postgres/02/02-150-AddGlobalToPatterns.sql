-- $Id$
-- Description:
ALTER table TM_TASK_PATTERN add COLUMN  global  boolean^
ALTER TABLE DF_DOC add COLUMN global boolean^

update  "public"."sec_constraint" set where_clause =  '((r.user.id = :session$userId OR {E}.substitutedCreator.id = :session$userId) OR  ({E}.template = true  and {E}.global = true))'  where entity_name = 'df$SimpleDoc'^
update  "public"."sec_constraint" set where_clause =  '((r.user.id = :session$userId OR {E}.substitutedCreator.id = :session$userId) OR  ({E}.template = true  and {E}.global = true))'  where entity_name = 'df$Contract'^
update  "public"."sec_constraint" set where_clause =  '((r.user.id = :session$userId OR {E}.substitutedCreator.id = :session$userId) OR  ({E}.template = true  and {E}.global = true))'  where entity_name = 'df$Doc'^

INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id)
SELECT 'edda0d21-3aa0-40df-8100-19444d75535c', now(),'admin', 1,now(), 'admin',null,null, 'tm$TaskPattern','','({E}.substitutedCreator.id = :session$userId  OR  {E}.global =  true)', '7dfe5c72-073f-4e1e-9cf4-1b1bad9c0093'
FROM "public"."sec_group" where id = '7dfe5c72-073f-4e1e-9cf4-1b1bad9c0093'^

INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('cb37a982-a1fe-4082-b0ea-440f4211af8d', now(),'admin', 1,now(), 'admin',null,null, 'tm$TaskPattern','','({E}.substitutedCreator.id = :session$userId  OR  {E}.global =  true)', '8e6306e2-9e10-414a-b437-24c91ffef804')^

