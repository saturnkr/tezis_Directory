--$Id: 130402-1301-increasePerfomanceOfDfDepartmentMembership.sql 8809 2013-04-02 11:58:01Z kozyaikin $
--$Description:
CREATE OR REPLACE FUNCTION df_department_membership_cache(OUT _id uuid, OUT _user_id uuid, OUT _department_id uuid)
  RETURNS SETOF record AS
$BODY$
DECLARE
    r record;
BEGIN
   BEGIN
     CREATE TEMPORARY TABLE tmp_df_department_membership ON COMMIT DROP AS
     SELECT DISTINCT deptree.id, deptree.user_id, deptree.department_id
     FROM deptree() deptree(id, user_id, department_id)
     ORDER BY deptree.id, deptree.user_id, deptree.department_id;
   EXCEPTION WHEN duplicate_table THEN
   END;
   FOR r IN SELECT * FROM tmp_df_department_membership
	LOOP
	    _user_id =  r.user_id;
	    _department_id = r.department_id;
	    RETURN next;
	END LOOP;
   RETURN;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
^
CREATE OR REPLACE VIEW df_department_membership AS
SELECT df_department_membership_cache.id, df_department_membership_cache.user_id, df_department_membership_cache.department_id
FROM df_department_membership_cache() df_department_membership_cache(id, user_id,department_id)
^
