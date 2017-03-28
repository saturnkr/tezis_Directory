--$Id: 130412-1641-increasePerfomanceOfDfDepartmentMembership.sql 9077 2013-04-12 12:59:59Z kozyaikin $
--$Description:

CREATE VIEW [dbo].[df_department_membership] WITH SCHEMABINDING  AS
WITH hdep (correspondent_id, parent_department_id , level, top_level_id) AS
          (
           SELECT correspondent_id, parent_department_id, 0 as level, top_level_id = correspondent_id
         FROM [dbo].df_department
         UNION ALL
         SELECT d1.correspondent_id, d1.parent_department_id,  level + 1, d2.top_level_id
         FROM [dbo].df_department as d1 INNER JOIN hdep as d2 ON d1.parent_department_id = d2.correspondent_id
          )
select distinct cast(null as uniqueidentifier) as id,e.user_id, h.correspondent_id as department_id
from hdep h join  [dbo].df_employee_department_position_relation edr  on edr.department_id=h.top_level_id
join [dbo].df_employee e on e.correspondent_id = edr.employee_id and e.user_id is not null ^
