--$Id: 130801-1300-updateChiefConstraints.sql 11856 2013-09-17 08:02:33Z kalashnikov $
--$Description: updates constraints for department chiefs to allow see own cards even the do not have a department

update SEC_CONSTRAINT
   set WHERE_CLAUSE = '{E}.id = acl.card.id and (acl.department.id in (:session$departmentIds) or acl.user.id = :session$userId)'
 where ENTITY_NAME = 'tm$Task'
   and GROUP_ID in ('8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb', '9fa89a54-9ffa-11e1-b13e-9f4a54bff17e')
   and JOIN_CLAUSE = ', ts$CardAcl acl'
;

 update SEC_CONSTRAINT
    set WHERE_CLAUSE = '{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.department.id in (:session$departmentIds) or acl.global = true or {E}.department.id in (:session$departmentIds))'
  where ENTITY_NAME in ('df$Doc', 'df$SimpleDoc', 'df$Contract')
    and GROUP_ID in ('8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb', '9fa89a54-9ffa-11e1-b13e-9f4a54bff17e')
    and JOIN_CLAUSE = ', ts$CardAcl acl'
    and WHERE_CLAUSE =  '{E}.id = acl.card.id and (acl.user.id in (:session$departmentMembersIds) or acl.global = true)'
;
