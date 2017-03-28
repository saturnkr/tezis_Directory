-- $Id: 140626-1436-undoUserConstraintFix.sql 16485 2014-06-26 10:45:10Z chekashkin $
-- Description:

update sec_constraint set entity_name = 'sec$User' where id = 'cbd897a2-5c4d-4b84-a613-6393c435cbcc';
