--$Id: 150619-1330-updateGroupConstraint.sql 20438 2015-06-19 09:39:58Z timokhov $

update sec_constraint set where_clause='(({E}.id = acl.card.id and (TYPE({E}) in (:session$simpleDocEffectiveClass) or TYPE({E}) in (:session$meetingDocEffectiveClass))) or ({E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true) and TYPE({E}) in (:session$contractEffectiveClass)))' where id='3f520104-d798-479c-9b93-04b16a99ff62'^
update sec_constraint set where_clause='(({E}.id = acl.card.id and TYPE({E}) in (:session$contractEffectiveClass)) or ({E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true) and (TYPE({E}) in (:session$simpleDocEffectiveClass) or TYPE({E}) in (:session$meetingDocEffectiveClass))))' where id='99961b6f-d798-479c-9b93-04b16a99ff62'^
