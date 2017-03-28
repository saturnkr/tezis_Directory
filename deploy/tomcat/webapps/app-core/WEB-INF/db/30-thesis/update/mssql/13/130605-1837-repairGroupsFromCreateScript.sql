--$Id: 130605-1837-repairGroupsFromCreateScript.sql 10160 2013-06-05 15:03:58Z tsarevskiy $
--Description:

update SEC_CONSTRAINT set
WHERE_CLAUSE='{E}.id = acl.card.id and (acl.department.id in (:session$departmentIds) or acl.global = true or {E}.department.id in (:session$departmentIds))'
where WHERE_CLAUSE='{E}.id = acl.card.id and (acl.department.id in (:session$departmentIds) or acl.global = true or card.department.id in (:session$departmentIds))';