--$Id: 130708-1600-fixSecGroupsConstraintForTask.sql 11215 2013-08-02 13:36:37Z saiyan $
--$Description : fix updating security constraints for chiefs on tm$Task.

update SEC_CONSTRAINT set
WHERE_CLAUSE =  '{E}.id = acl.card.id and (acl.department.id in (:session$departmentIds))',
JOIN_CLAUSE = ', ts$CardAcl acl'
where GROUP_ID in (select g.ID from SEC_GROUP g where (g.NAME like '%Руководитель подразделения%' or g.NAME like '%Руководитель департамента%')
and WHERE_CLAUSE =  '{E}.id = acl.card.id and acl.user.id in (:session$departmentMembersIds)'
and g.delete_ts is null) and ENTITY_NAME in ('tm$Task');
^