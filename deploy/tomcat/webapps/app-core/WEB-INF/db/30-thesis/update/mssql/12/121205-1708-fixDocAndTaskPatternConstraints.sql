-- $Id$
-- Description:

update SEC_CONSTRAINT set WHERE_CLAUSE = '({E}.substitutedCreator.id = :session$userId  OR  {E}.global =  true)' where ENTITY_NAME = 'tm$TaskPattern';

update SEC_CONSTRAINT set WHERE_CLAUSE = REPLACE(WHERE_CLAUSE, 'OR  and', 'OR') where WHERE_CLAUSE like '%OR  and%'^