--$Id: 140815-1350-updateGroupConstraint.sql 17104 2014-08-16 07:57:08Z kozyaikin $

update sec_constraint set where_clause='(({E}.id = acl.card.id and TYPE({E}) in (df$SimpleDoc)) or ({E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true) and TYPE({E}) in (df$Contract)))' where id='3f520104-d798-479c-9b93-04b16a99ff62'^
update sec_constraint set where_clause='(({E}.id = acl.card.id and TYPE({E}) in (df$Contract)) or ({E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true) and TYPE({E}) in (df$SimpleDoc)))' where id='99961b6f-d798-479c-9b93-04b16a99ff62'^
