-- $Id: 140414-1012-updateDepartmentCheefConstraint.sql 15739 2014-04-15 13:56:48Z kozyaikin $
-- Description:

update SEC_CONSTRAINT set
WHERE_CLAUSE =  '{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.department.id in (:session$departmentIds) or acl.global = true)',
JOIN_CLAUSE = ', ts$CardAcl acl'
where GROUP_ID in ('8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb', '9fa89a54-9ffa-11e1-b13e-9f4a54bff17e')
and (WHERE_CLAUSE =  '{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.department.id in (:session$departmentIds) or acl.global = true or {E}.department.id in (:session$departmentIds))'
    OR WHERE_CLAUSE =  '{E}.id = acl.card.id and (acl.department.id in (:session$departmentIds) or acl.global = true or {E}.department.id in (:session$departmentIds))')
and delete_ts is null and ENTITY_NAME in ('df$SimpleDoc', 'df$Contract', 'df$Doc');
^