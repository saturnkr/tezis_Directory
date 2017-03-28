-- $Id$
-- Description:

delete from sec_constraint c where
(
select count(1) from sec_constraint cc
where cc.group_id = c.group_id
and cc.where_clause = c.where_clause
and cc.join_clause = c.join_clause
and cc.entity_name = c.entity_name
and cc.delete_ts is null
and c.delete_ts is null
and cc.id <= c.id
) >= 2;
^