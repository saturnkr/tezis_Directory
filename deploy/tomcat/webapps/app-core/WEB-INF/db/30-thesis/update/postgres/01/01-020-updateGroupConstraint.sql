-- $Id: 01-020-updateGroupConstraint.sql 85 2010-04-08 11:43:55Z krivopustov $
-- Description: update constraint for limited task access

update SEC_CONSTRAINT set where_clause = '(r.user.id = :session$userId OR t.createdBy = :session$userLogin)', join_clause = 'left join t.roles r' where id = 'bcb90482-e02a-42f3-b936-a40b28b5963a'



