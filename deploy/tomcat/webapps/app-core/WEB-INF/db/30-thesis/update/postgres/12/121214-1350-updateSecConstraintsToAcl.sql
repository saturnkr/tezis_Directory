-- $Id: 121214-1350-updateSecConstraintsToAcl.sql 7483 2013-01-22 08:31:41Z pavlov $
-- Description:

update SEC_CONSTRAINT set join_clause = ', ts$CardAcl acl', where_clause = '{E}.id = acl.card.id and acl.user.id in (:session$departmentMembersIds)'
where join_clause = 'left join {E}.roles r'  and where_clause = '({E}.substitutedCreator.id =
:session$userId OR r.user.id in (:session$departmentMembersIds))';

update SEC_CONSTRAINT set join_clause = ', ts$CardAcl acl', where_clause = '{E}.id = acl.card.id and (acl.user.id in (:session$departmentMembersIds) or acl.global = true)'
where join_clause = 'left join {E}.roles r'  and where_clause = '({E}.substitutedCreator.id =
:session$userId OR ({E}.template = true and {E}.global = true) OR r.user.id in (:session$departmentMembersIds))';

update SEC_CONSTRAINT set join_clause = ', ts$CardAcl acl', where_clause = '{E}.id = acl.card.id and (acl.user.id in (:session$departmentMembersIds) or acl.global = true)'
where join_clause = 'left join {E}.roles r'  and where_clause like '%{E}.substitutedCreator.id =%
:session$userId OR {E}.global = true OR r.user.id in (:session$departmentMembersIds))%';


update SEC_CONSTRAINT set join_clause = ', ts$CardAcl acl', where_clause = '{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)'
where join_clause = 'left join {E}.roles r'  and where_clause = '((r.user.id = :session$userId OR {E}.substitutedCreator.id = :session$userId) OR  {E}.global = true)';

update SEC_CONSTRAINT set join_clause = ', ts$CardAcl acl', where_clause = '{E}.id = acl.card.id and acl.user.id = :session$userId'
where join_clause = 'left join {E}.roles r'  and where_clause = '(r.user.id = :session$userId OR {E}.substitutedCreator.id= :session$userId)';

update SEC_CONSTRAINT set join_clause = ', ts$CardAcl acl', where_clause = '{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)'
where where_clause = '({E}.substitutedCreator.id = :session$userId  OR  {E}.global =  true)';


update SEC_CONSTRAINT set
WHERE_CLAUSE =  '{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)',
JOIN_CLAUSE = ', ts$CardAcl acl'
where GROUP_ID in (select g.ID from SEC_GROUP g where (g.NAME like '%Ограниченный доступ%')
and WHERE_CLAUSE = '((r.user.id = :session$userId OR {E}.substitutedCreator.id = :session$userId) OR   {E}.global = true)'
and g.delete_ts is null) and ENTITY_NAME in ('df$SimpleDoc', 'df$Contract', 'df$Doc');

update SEC_CONSTRAINT set
WHERE_CLAUSE =  '{E}.id = acl.card.id and (acl.user.id in (:session$departmentMembersIds) or acl.global = true)',
JOIN_CLAUSE = ', ts$CardAcl acl'
where GROUP_ID in (select g.ID from SEC_GROUP g where (g.NAME like '%Руководитель подразделения%' or g.NAME like '%Руководитель департамента%')
and WHERE_CLAUSE =  '({E}.substitutedCreator.id =:session$userId OR {E}.global = true OR r.user.id in (:session$departmentMembersIds))'
and g.delete_ts is null) and ENTITY_NAME in ('df$SimpleDoc', 'df$Contract', 'df$Doc');
^
