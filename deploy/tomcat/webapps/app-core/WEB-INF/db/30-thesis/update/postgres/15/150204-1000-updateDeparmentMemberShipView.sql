CREATE OR REPLACE VIEW df_department_membership AS
WITH RECURSIVE hdep (correspondent_id, parent_department_id , level, top_level_id) AS
         (
         SELECT correspondent_id, parent_department_id, 0 as level, correspondent_id
         FROM df_department
         UNION ALL
         SELECT d1.correspondent_id, d1.parent_department_id,  level + 1, d2.top_level_id
         FROM df_department as d1 INNER JOIN hdep as d2 ON d1.parent_department_id = d2.correspondent_id
          )
select distinct cast(null as uuid) as id, e.user_id, h.correspondent_id as department_id
from hdep h join df_employee_department_position_relation edr
on edr.department_id=h.top_level_id and edr.delete_ts is null
	join df_employee e
	on e.correspondent_id = edr.employee_id
	and e.user_id is not null
	and (h.top_level_id=h.correspondent_id
	     or exists (
			select r.id from sec_role r join sec_user_role ur
			on r.id=ur.role_id
			and ur.user_id=e.user_id
			and ur.delete_ts is null
			and r.name = 'DepartmentChief'))