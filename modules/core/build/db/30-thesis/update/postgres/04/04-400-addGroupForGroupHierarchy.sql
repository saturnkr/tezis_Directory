-- $Id: 04-400-addGroupForGroupHierarchy.sql 4168 2012-03-06 07:43:54Z zudin $
-- Description:

insert into sec_group_hierarchy (id,create_ts,created_by,group_id,parent_id,level)
values (newid(), {ts '2010-02-12 09:47:08.650'}, 'admin', (select g.ID from SEC_GROUP g where g.NAME like '%Руководитель департамента%' LIMIT 1),'0fa2b1a5-1d68-4d69-9fbd-dff348347f93',0);

insert into sec_group_hierarchy (id,create_ts,created_by,group_id,parent_id,level)
values (newid(), {ts '2010-02-12 09:47:08.650'}, 'admin', (select g.ID from SEC_GROUP g where g.NAME like '%Руководитель подразделения%' LIMIT 1),'0fa2b1a5-1d68-4d69-9fbd-dff348347f93',0);