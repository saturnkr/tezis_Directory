-- $Id: 04-320-addConstraint.sql 3912 2012-02-07 07:46:52Z Novikov $
-- Description:
INSERT INTO sec_constraint (id,create_ts,created_by,version, entity_name,join_clause,where_clause,group_id)
VALUES ('f40ca7b4-9889-4232-be18-0f8207223fc2', now(), USER, 1, 'tm$User', null, '{E}.createdBy is not null', '0fa2b1a5-1d68-4d69-9fbd-dff348347f93');