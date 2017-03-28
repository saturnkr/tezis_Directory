--$Id: 140826-1637-updateChiefConstraintsForTask.sql 17249 2014-09-01 08:29:42Z kozyaikin $
--$Description: updates constraints for department chiefs to allow see own tasks even the do not have a department

update SEC_CONSTRAINT
   set WHERE_CLAUSE = '{E}.id = acl.card.id and (acl.department.id in (:session$departmentIds) or acl.user.id = :session$userId)'
 where ENTITY_NAME = 'tm$Task'
   and GROUP_ID in ('8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb', '9fa89a54-9ffa-11e1-b13e-9f4a54bff17e')
   and JOIN_CLAUSE = ', ts$CardAcl acl'
   and WHERE_CLAUSE='{E}.id = acl.card.id and (acl.department.id in (:session$departmentIds))';