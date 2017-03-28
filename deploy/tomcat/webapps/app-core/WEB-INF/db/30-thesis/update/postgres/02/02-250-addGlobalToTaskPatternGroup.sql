-- $Id: 02-240-addGlobalToTaskPatternGroup.sql 1785 2011-04-27 12:17:44Z khaimovich $
-- Description
ALTER table TM_TASK_GROUP add COLUMN  global  boolean^
update  "public"."sec_constraint"        set where_clause = '({E}.subCreator.id = :session$userId or p.id = :session$userId or {E}.chairman.id = :session$userId or {E}.secretary.id = :session$userId  or {E}.initiator.id = :session$userId  or exists (select c from wf$CardRole c where c.card.id = tgt.task.id and c.user.id = :session$userId and c.deleteTs is null) or    ({E}.template = true AND {E}.global = true  ))'
where entity_name = 'tm$TaskGroup' and    group_id = '7dfe5c72-073f-4e1e-9cf4-1b1bad9c0093'^

update  "public"."sec_constraint"        set where_clause = '( {E}.subCreator.id = :session$userId or p.id = :session$userId or {E}.chairman.id = :session$userId or {E}.secretary.id = :session$userId  or {E}.initiator.id = :session$userId   or exists (select c from wf$CardRole c where c.card.id = tgt.task.id and c.user.id = :session$userId and c.deleteTs is null) or  ({E}.template = true AND {E}.global = true  ))'
where entity_name = 'tm$TaskGroup' and    group_id = '8e6306e2-9e10-414a-b437-24c91ffef804'^

