-- $Id: 01-470-groupConstraintsUpdate.sql 830 2010-10-08 06:53:12Z novikov $
-- Description: Put {E} placeholder into clauses text

update SEC_CONSTRAINT set where_clause='(r.user.id = :session$userId OR {E}.substitutedCreator.id= :session$userId OR {E}.template = true)' where id='18190d06-fc17-482a-8f73-a47df9b97263';
update SEC_CONSTRAINT set where_clause='(r.user.id = :session$userId OR {E}.substitutedCreator.id= :session$userId OR {E}.template = true)' where id='22581acc-acff-4d58-bc8d-ffaea3dd01fa';
update SEC_CONSTRAINT set where_clause='(r.user.id = :session$userId OR {E}.substitutedCreator.id= :session$userId OR {E}.template = true)' where id='7231c87a-2872-4d9a-8167-2f075055f37c';