--$Id: 140821-1121-updateGroupConstraint.sql 17214 2014-08-26 13:00:33Z kozyaikin $

update sec_constraint set where_clause='(({E}.id = acl.card.id and TYPE({E}) in (:session$simpleDocEffectiveClass)) or ({E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true) and TYPE({E}) in (:session$contractEffectiveClass)))' where id='3f520104-d798-479c-9b93-04b16a99ff62'^
update sec_constraint set where_clause='(({E}.id = acl.card.id and TYPE({E}) in (:session$contractEffectiveClass)) or ({E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true) and TYPE({E}) in (:session$simpleDocEffectiveClass)))' where id='99961b6f-d798-479c-9b93-04b16a99ff62'^
