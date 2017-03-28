-- $Id$

update SEC_CONSTRAINT set
JOIN_CLAUSE = 'left join {E}.taskGroupTasks tgt'
where GROUP_ID in (select g.ID from SEC_GROUP g where (g.NAME like '%Руководитель подразделения%' or g.NAME like '%Руководитель департамента%')
and g.delete_ts is null) and ENTITY_NAME = 'tm$TaskGroup';