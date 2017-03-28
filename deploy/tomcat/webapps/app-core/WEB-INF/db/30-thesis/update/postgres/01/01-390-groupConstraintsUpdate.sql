-- $Id: 01-390-groupConstraintsUpdate.sql 741 2010-09-20 07:16:11Z gorbunkov $
-- Description: Put {E} placeholder into clauses text

update SEC_CONSTRAINT set join_clause='left join {E}.roles r', where_clause='(r.user.id = :session$userId OR {E}.substitutedCreator.id= :session$userId)' where id='18190d06-fc17-482a-8f73-a47df9b97263';
update SEC_CONSTRAINT set join_clause='left join {E}.roles r', where_clause='(r.user.id = :session$userId OR {E}.substitutedCreator.id= :session$userId)' where id='22581acc-acff-4d58-bc8d-ffaea3dd01fa';
update SEC_CONSTRAINT set join_clause='left join {E}.roles r', where_clause='(r.user.id = :session$userId OR {E}.substitutedCreator.id= :session$userId)' where id='433c5a9a-991f-454c-a064-861a74a66c88';
update SEC_CONSTRAINT set join_clause='left join {E}.roles r', where_clause='(r.user.id = :session$userId OR {E}.substitutedCreator.id= :session$userId)' where id='7231c87a-2872-4d9a-8167-2f075055f37c';
update SEC_CONSTRAINT set join_clause='left join {E}.roles r', where_clause='(r.user.id = :session$userId OR {E}.substitutedCreator.id= :session$userId)' where id='bcb90482-e02a-42f3-b936-a40b28b5963a';
update SEC_CONSTRAINT set join_clause=null, where_clause='{E}.createdBy is not null' where id='cbd897a2-5c4d-4b84-a613-6393c435cbcc';