-- deletes constraint on tm$User for parent group
--$Id: 140219-1800-removeFakeUserContraint.sql 15016 2014-02-19 14:03:56Z saiyan $

delete from sec_constraint where
exists (select c.* from sec_constraint c where c.group_id = '0fa2b1a5-1d68-4d69-9fbd-dff348347f93' and c.entity_name = 'sec$User')
and id = 'f40ca7b4-9889-4232-be18-0f8207223fc2'