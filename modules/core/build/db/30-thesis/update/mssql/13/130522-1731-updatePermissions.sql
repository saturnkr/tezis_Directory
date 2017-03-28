-- $Id: 130522-1731-updatePermissions.sql 9816 2013-05-23 09:21:28Z kozyaikin $
-- Description:

update SEC_CONSTRAINT set
WHERE_CLAUSE =  '{E}.id = acl.card.id and (acl.department.id in (:session$departmentIds) or acl.global = true or card.department.id in (:session$departmentIds))',
JOIN_CLAUSE = ', ts$CardAcl acl'
where GROUP_ID in (select g.ID from SEC_GROUP g where (g.NAME like '%Руководитель подразделения%' or g.NAME like '%Руководитель департамента%')
and WHERE_CLAUSE =  '{E}.id = acl.card.id and (acl.user.id in (:session$departmentMembersIds) or acl.global = true)'
and g.delete_ts is null) and ENTITY_NAME in ('df$SimpleDoc', 'df$Contract', 'df$Doc');
^

update SEC_CONSTRAINT set
WHERE_CLAUSE =  '{E}.id = acl.card.id and acl.department.id in (:session$departmentIds)',
JOIN_CLAUSE = ', ts$CardAcl acl'
where GROUP_ID in (select g.ID from SEC_GROUP g where (g.NAME like '%Руководитель подразделения%' or g.NAME like '%Руководитель департамента%')
and WHERE_CLAUSE =  '{E}.id = acl.card.id and acl.user.id in (:session$departmentMembersIds)'
and g.delete_ts is null) and ENTITY_NAME in ('tm$Task');
^
