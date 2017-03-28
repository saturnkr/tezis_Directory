INSERT INTO SEC_CONSTRAINT (id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id)
VALUES (newid(), now(), USER, 1, 'sec$User',null, '{E}.createdBy is not null',
(select g.ID from SEC_GROUP g where g.NAME like '%Руководитель подразделения%' LIMIT 1));
INSERT INTO SEC_CONSTRAINT (id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id)
VALUES (newid(), now(), USER, 1, 'sec$User',null, '{E}.createdBy is not null',
(select g.ID from SEC_GROUP g where g.NAME like '%"Руководитель департамента"%' LIMIT 1));