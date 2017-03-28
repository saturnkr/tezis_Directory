-- $Id: 04-510-insertConstraintTaskGroup.sql 4685 2012-04-17 12:55:50Z Novikov $

delete from SEC_CONSTRAINT where entity_name='tm$TaskGroup' and  group_id = (select g.ID from SEC_GROUP g where g.NAME like '%Руководитель подразделения%' LIMIT 1);

INSERT INTO SEC_CONSTRAINT (id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id)
VALUES (newid(), now(), USER, 1, 'tm$TaskGroup', 'left join {E}.taskGroupTasks tgt', '({E}.subCreator.id=:session$userId OR ({E}.global = true AND {E}.template=true) OR tgt.task.id in (select t.id from tm$Task t left join t.roles r  where r.user.id = :session$userId OR t.substitutedCreator.id =
:session$userId OR exists(select em from df$Employee em where em.user.id = r.user.id and em.department.id in
(select eu.department.id from df$Employee eu where eu.user.id = :session$userId))) )',
(select g.ID from SEC_GROUP g where g.NAME like '%Руководитель подразделения%' LIMIT 1));

delete from SEC_CONSTRAINT where entity_name='tm$TaskGroup' and  group_id = (select g.ID from SEC_GROUP g where g.NAME like '%Руководитель департамента%' LIMIT 1);

INSERT INTO SEC_CONSTRAINT (id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id)
VALUES (newid(), now(), USER, 1, 'tm$TaskGroup', 'left join {E}.taskGroupTasks tgt', '({E}.subCreator.id=:session$userId OR ({E}.global = true AND {E}.template=true) OR tgt.task.id in (select t.id from tm$Task t left join t.roles r  where r.user.id = :session$userId OR t.substitutedCreator.id =
:session$userId OR exists(select em from df$Employee em where em.user.id = r.user.id and em.department.id in
(:session$departmentIds))) )',
(select g.ID from SEC_GROUP g where g.NAME like '%Руководитель департамента%' LIMIT 1));