-- $Id: 121216-1500-addPermissionToTaskPatternForChiefs.sql 7483 2013-01-22 08:31:41Z pavlov $
-- Description:

INSERT INTO SEC_CONSTRAINT (id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id)
VALUES (newid(), now(), USER, 1, 'tm$TaskPattern',', ts$CardAcl acl','{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)',
(select g.ID from SEC_GROUP g where g.NAME like '%Руководитель департамента%' limit 1));

INSERT INTO SEC_CONSTRAINT (id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id)
VALUES (newid(), now(), USER, 1, 'tm$TaskPattern',', ts$CardAcl acl','{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)',
(select g.ID from SEC_GROUP g where g.NAME like '%Руководитель подразделения%' limit 1));
^