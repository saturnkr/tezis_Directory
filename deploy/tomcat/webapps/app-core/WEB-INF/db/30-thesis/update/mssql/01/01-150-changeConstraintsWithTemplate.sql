--$Id: 01-150-changeConstraintsWithTemplate.sql 5464 2012-07-09 11:14:16Z kozyaikin $
--Description:

update SEC_CONSTRAINT set
WHERE_CLAUSE =  '((r.user.id = :session$userId OR {E}.substitutedCreator.id = :session$userId) OR   {E}.global = true)'
where GROUP_ID in (select g.ID from SEC_GROUP g where (g.NAME like '%Ограниченный доступ%')
and g.delete_ts is null) and ENTITY_NAME in ('df$SimpleDoc', 'df$Contract', 'df$Doc');

update SEC_CONSTRAINT set
WHERE_CLAUSE =  '({E}.substitutedCreator.id =:session$userId OR {E}.global = true OR r.user.id in (:session$departmentMembersIds))'
where GROUP_ID in (select g.ID from SEC_GROUP g where (g.NAME like '%Руководитель подразделения%' or g.NAME like '%Руководитель департамента%')
and g.delete_ts is null) and ENTITY_NAME in ('df$SimpleDoc', 'df$Contract', 'df$Doc')^