-- $Id: 03-080-insertInRole.sql 2496 2011-08-26 08:22:28Z novikov $
-- Description:

UPDATE SEC_GROUP SET name = 'Руководитель подразделения'  WHERE name = 'Руководитель подразделения (видит задачи только своего подразделения)';
UPDATE SEC_GROUP SET name = 'Руководитель департамента'  WHERE name = 'Руководитель подразделения (видит задачи всех подчиненных подразделений)'^
INSERT INTO SEC_ROLE (ID, CREATE_TS, CREATED_BY, VERSION, NAME, LOC_NAME) VALUES ('5cd3839e-781b-487f-8810-4091943da63b', now(), USER, 1, 'DepartmentChief', 'Начальник отдела');
INSERT INTO SEC_CONSTRAINT (id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id)
VALUES (newid(), now(), USER, 1, 'df$Doc', 'left join {E}.roles r', '(r.user.id = :session$userId OR {E}.substitutedCreator.id =
:session$userId OR exists(select em from df$Employee em where em.user.id = r.user.id and em.department.id in
(select eu.department.id from df$Employee eu where eu.user.id = :session$userId)))',
(select g.ID from SEC_GROUP g where g.NAME like '%Руководитель подразделения%' LIMIT 1));
INSERT INTO SEC_CONSTRAINT (id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id)
VALUES (newid(), now(), USER, 1, 'df$Doc', 'left join {E}.roles r', '(r.user.id = :session$userId OR {E}.substitutedCreator.id =
:session$userId OR exists(select em from df$Employee em where em.user.id = r.user.id and em.department.id in
(:session$departmentIds)))',
(select g.ID from SEC_GROUP g where g.NAME like '%Руководитель департамента%' LIMIT 1));
INSERT INTO SEC_CONSTRAINT (id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id)
VALUES (newid(), now(), USER, 1, 'df$SimpleDoc', 'left join {E}.roles r', '(r.user.id = :session$userId OR {E}.substitutedCreator.id =
:session$userId OR exists(select em from df$Employee em where em.user.id = r.user.id and em.department.id in
(select eu.department.id from df$Employee eu where eu.user.id = :session$userId)))',
(select g.ID from SEC_GROUP g where g.NAME like '%Руководитель подразделения%' LIMIT 1));
INSERT INTO SEC_CONSTRAINT (id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id)
VALUES (newid(), now(), USER, 1, 'df$SimpleDoc', 'left join {E}.roles r', '(r.user.id = :session$userId OR {E}.substitutedCreator.id =
:session$userId OR exists(select em from df$Employee em where em.user.id = r.user.id and em.department.id in
(:session$departmentIds)))',
(select g.ID from SEC_GROUP g where g.NAME like '%Руководитель департамента%' LIMIT 1));
INSERT INTO SEC_CONSTRAINT (id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id)
VALUES (newid(), now(), USER, 1, 'df$Contract', 'left join {E}.roles r', '(r.user.id = :session$userId OR {E}.substitutedCreator.id =
:session$userId OR exists(select em from df$Employee em where em.user.id = r.user.id and em.department.id in
(select eu.department.id from df$Employee eu where eu.user.id = :session$userId)))',
(select g.ID from SEC_GROUP g where g.NAME like '%Руководитель подразделения%' LIMIT 1));
INSERT INTO SEC_CONSTRAINT (id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id)
VALUES (newid(), now(), USER, 1, 'df$Contract', 'left join {E}.roles r', '(r.user.id = :session$userId OR {E}.substitutedCreator.id =
:session$userId OR exists(select em from df$Employee em where em.user.id = r.user.id and em.department.id in
(:session$departmentIds)))',
(select g.ID from SEC_GROUP g where g.NAME like '%Руководитель департамента%' LIMIT 1));