-- $Id: 140626-1234-fixSystemUserConstraint.sql 16474 2014-06-26 08:49:27Z chekashkin $
-- Description: fixes constraint for hiding system users

update sec_constraint set entity_name = 'tm$User' where id = 'cbd897a2-5c4d-4b84-a613-6393c435cbcc';
