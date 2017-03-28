-- $Id: 03-050-addViewDepartment.sql 2496 2011-08-26 08:22:28Z novikov $
-- Description:

CREATE OR REPLACE FUNCTION deptree(OUT id uuid, OUT user_id uuid, OUT department_id uuid)
RETURNS setof record
AS $$
DECLARE
    varId uuid;
    userId uuid;
    branch_ text;
    ids text[];
BEGIN
	for varId in select d.correspondent_id from df_department d where d.parent_department_id is null
	LOOP
		for branch_ in SELECT t.branch FROM connectby('df_department'::text, 'correspondent_id'::text, 'parent_department_id'::text,
		(( SELECT df_department.correspondent_id FROM df_department WHERE df_department.correspondent_id = varId)::character varying)::text, 0, '_'::text)
        t(keyid text, parent_keyid text, pos integer, branch text)
		LOOP
			ids = regexp_split_to_array(branch_, '_');
			FOR i IN 1..array_upper(ids,1) LOOP
				FOR userId in select e.user_id from df_employee e where e.department_id = ids[i]::uuid
				LOOP
					FOR j IN i..array_upper(ids,1) LOOP
						user_id =  userId;
						department_id = ids[j];
						id = newid();
						return next;
					END LOOP;
				END LOOP;
			END LOOP;
		END LOOP;
	END LOOP;
    return;
END;
$$
LANGUAGE plpgsql^

CREATE OR REPLACE VIEW df_department_membership AS select distinct * from deptree()^
ALTER TABLE df_department_membership OWNER TO root^

INSERT INTO SEC_GROUP (id, create_ts, created_by, version, name, parent_id) VALUES (newid(), now(), USER, 1,
'Руководитель подразделения',
(select g.ID from SEC_GROUP g where g.NAME like '%Полный доступ к задачам%' LIMIT 1));

INSERT INTO SEC_CONSTRAINT (id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id)
VALUES (newid(), now(), USER, 1, 'tm$Task', 'left join {E}.roles r', '(r.user.id = :session$userId OR {E}.substitutedCreator.id =
:session$userId OR exists(select em from df$Employee em where em.user.id = r.user.id and em.department.id in
(select eu.department.id from df$Employee eu where eu.user.id = :session$userId)))',
(select g.ID from SEC_GROUP g where g.NAME like '%Руководитель подразделения%' LIMIT 1));

INSERT INTO SEC_GROUP (id, create_ts, created_by, version, name, parent_id) VALUES (newid(), now(), USER, 1,
'Руководитель департамента',
(select g.ID from SEC_GROUP g where g.NAME like '%Полный доступ к задачам%' LIMIT 1));

INSERT INTO SEC_CONSTRAINT (id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id)
VALUES (newid(), now(), USER, 1, 'tm$Task', 'left join {E}.roles r', '(r.user.id = :session$userId OR {E}.substitutedCreator.id =
:session$userId OR exists(select em from df$Employee em where em.user.id = r.user.id and em.department.id in
(:session$departmentIds)))',
(select g.ID from SEC_GROUP g where g.NAME like '%Руководитель департамента%' LIMIT 1));