--$Id: 130412-1640-updateDeepTreeFunction.sql 9077 2013-04-12 12:59:59Z kozyaikin $
--$Description:
CREATE OR REPLACE FUNCTION deptree(OUT id uuid, OUT user_id uuid, OUT department_id uuid)
RETURNS setof record
AS $BODY$
DECLARE
    varId uuid;
    userId uuid;
    branch_ text;
    ids text[];
BEGIN
	for varId in select d.correspondent_id from df_department d where d.parent_department_id is null
	LOOP
		for branch_ in SELECT t.branch FROM connectby('df_department'::text, 'correspondent_id'::text, 'parent_department_id'::text,
		varId::text, 0, '_'::text)
        t(keyid text, parent_keyid text, pos integer, branch text)
		LOOP
			ids = regexp_split_to_array(branch_, '_');
			FOR i IN 1..array_upper(ids,1) LOOP
				FOR userId in select e.user_id from df_employee e inner join df_employee_department_position_relation edr  on edr.employee_id=e.correspondent_id where  edr.department_id = ids[i]::uuid
                LOOP
					FOR j IN i..array_upper(ids,1) LOOP
						user_id = userId;
						department_id = ids[j];
						--id = newid();
						return next;
					END LOOP;
				END LOOP;
			END LOOP;
		END LOOP;
	END LOOP;
	return;
END;
$BODY$
LANGUAGE plpgsql^
