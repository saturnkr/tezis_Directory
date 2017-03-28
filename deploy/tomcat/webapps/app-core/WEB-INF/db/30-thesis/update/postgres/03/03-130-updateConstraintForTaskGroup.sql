-- $Id: 03-130-updateConstraintForTaskGroup.sql 4121 2012-03-01 11:09:08Z pavlov $
update SEC_CONSTRAINT set WHERE_CLAUSE = '({E}.subCreator.id = :session$userId
or p.id = :session$userId
or {E}.chairman.id = :session$userId
or {E}.secretary.id = :session$userId
or {E}.initiator.id = :session$userId
or exists (select c from wf$CardRole c where c.card = tgt.task and c.user.id = :session$userId and c.deleteTs is null) or  ({E}.template = true AND {E}.global = true  ))'
where id = '7b87c520-5c2e-11e0-a770-b3d23ae5dd33' or id = '86c0ba0a-5c2e-11e0-b52d-0f8fb8df9d93'^