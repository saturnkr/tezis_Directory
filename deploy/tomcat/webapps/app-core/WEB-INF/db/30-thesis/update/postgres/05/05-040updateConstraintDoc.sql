-- $Id: 05-040updateConstraintDoc.sql 5049 2012-05-21 09:24:43Z Novikov $

update SEC_CONSTRAINT set
WHERE_CLAUSE =  '({E}.substitutedCreator.id = :session$userId OR {E}.global = true OR r.user.id in (:session$departmentMembersIds) OR r.user.id = :session$userId )'
where GROUP_ID in (select g.ID from SEC_GROUP g where (g.NAME like '%Руководитель подразделения%' or g.NAME like '%Руководитель департамента%')
and g.delete_ts is null) and ENTITY_NAME in ('df$SimpleDoc', 'df$Contract', 'df$Doc');