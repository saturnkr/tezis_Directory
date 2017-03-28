--$Id: 130415-1106-updateNewConstraintsGroup.sql 9113 2013-04-15 09:33:32Z kozyaikin $
--$Description:
update SEC_CONSTRAINT set join_clause=', ts$CardAcl acl',where_clause='(({E}.id = acl.card.id and TYPE({E}) in (SimpleDoc)) or ({E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true) and TYPE({E}) in (Contract)))' where id='3f520104-d798-479c-9b93-04b16a99ff62';

update SEC_CONSTRAINT set join_clause=', ts$CardAcl acl',where_clause='(({E}.id = acl.card.id and TYPE({E}) in (Contract)) or ({E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true) and TYPE({E}) in (SimpleDoc)))' where id='99961b6f-d798-479c-9b93-04b16a99ff62';
