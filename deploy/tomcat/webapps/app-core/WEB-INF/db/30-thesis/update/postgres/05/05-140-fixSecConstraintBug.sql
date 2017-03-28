-- $Id$
update SEC_CONSTRAINT set WHERE_CLAUSE = '({E}.subCreator.id = :session$userId
or p.id = :session$userId
or {E}.chairman.id = :session$userId
or {E}.secretary.id = :session$userId
or {E}.initiator.id = :session$userId
or exists (select c from wf$CardRole c where c.card = tgt.task and c.user.id = :session$userId and c.deleteTs is null) or  ({E}.global = true))'
where id = '86c0ba0a-5c2e-11e0-b52d-0f8fb8df9d93';
