--$Id: 130613-1720-repairGroupsFromCreateScript.sql 10302 2013-06-13 13:31:01Z kozyaikin $
--Description:

update SEC_CONSTRAINT set
WHERE_CLAUSE='{E}.id = acl.card.id and (acl.department.id in (:session$departmentIds) or acl.global = true or {E}.department.id in (:session$departmentIds))'
where WHERE_CLAUSE='{E}.id = acl.card.id and (acl.department.id in (:session$departmentIds) or acl.global = true  or card.department.id in (:session$departmentIds))';
