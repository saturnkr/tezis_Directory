-- $Id: 01-040-updateManagerConstraints.sql 5019 2012-05-17 11:32:04Z Novikov $

update SEC_CONSTRAINT set WHERE_CLAUSE = '({E}.substitutedCreator.id =
:session$userId OR ({E}.template = true and {E}.global = true) OR r.user.id in (:session$departmentMembersIds))',
JOIN_CLAUSE = 'left join {E}.roles r'
where GROUP_ID = (select TOP 1 g.ID from SEC_GROUP g where g.NAME like '%Руководитель подразделения%') and ENTITY_NAME = 'df$Doc';

update SEC_CONSTRAINT set WHERE_CLAUSE = '({E}.substitutedCreator.id =
:session$userId OR ({E}.template = true and {E}.global = true) OR r.user.id in (:session$departmentMembersIds))',
JOIN_CLAUSE = 'left join {E}.roles r'
where GROUP_ID = (select TOP 1 g.ID from SEC_GROUP g where g.NAME like '%Руководитель подразделения%') and ENTITY_NAME = 'df$SimpleDoc';

update SEC_CONSTRAINT set WHERE_CLAUSE = '({E}.substitutedCreator.id =
:session$userId OR ({E}.template = true and {E}.global = true) OR r.user.id in (:session$departmentMembersIds))',
JOIN_CLAUSE = 'left join {E}.roles r'
where GROUP_ID = (select TOP 1 g.ID from SEC_GROUP g where g.NAME like '%Руководитель подразделения%') and ENTITY_NAME = 'df$Contract';

update SEC_CONSTRAINT set WHERE_CLAUSE = '({E}.substitutedCreator.id =
:session$userId OR r.user.id in (:session$departmentMembersIds))',
JOIN_CLAUSE = 'left join {E}.roles r'
where GROUP_ID = (select TOP 1 g.ID from SEC_GROUP g where g.NAME like '%Руководитель подразделения%') and ENTITY_NAME = 'tm$Task';

update SEC_CONSTRAINT set WHERE_CLAUSE = '({E}.subCreator.id=:session$userId OR ({E}.global = true AND {E}.template=true)
OR tgt.task.id in (select t.id from tm$Task t left join t.roles r  where t.substitutedCreator.id =
:session$userId OR r.user.id in (:session$departmentMembersIds)))',
JOIN_CLAUSE = 'left join {E}.roles r'
where GROUP_ID = (select TOP 1 g.ID from SEC_GROUP g where g.NAME like '%Руководитель подразделения%') and ENTITY_NAME = 'tm$TaskGroup';

update SEC_CONSTRAINT set WHERE_CLAUSE = '({E}.substitutedCreator.id =
:session$userId OR ({E}.template = true and {E}.global = true) OR r.user.id in (:session$departmentMembersIds))',
JOIN_CLAUSE = 'left join {E}.roles r'
where GROUP_ID = (select TOP 1 g.ID from SEC_GROUP g where g.NAME like '%Руководитель департамента%') and ENTITY_NAME = 'df$Doc';

update SEC_CONSTRAINT set WHERE_CLAUSE = '({E}.substitutedCreator.id =
:session$userId OR ({E}.template = true and {E}.global = true) OR r.user.id in (:session$departmentMembersIds))',
JOIN_CLAUSE = 'left join {E}.roles r'
where GROUP_ID = (select TOP 1 g.ID from SEC_GROUP g where g.NAME like '%Руководитель департамента%') and ENTITY_NAME = 'df$SimpleDoc';

update SEC_CONSTRAINT set WHERE_CLAUSE = '({E}.substitutedCreator.id =
:session$userId OR ({E}.template = true and {E}.global = true) OR r.user.id in (:session$departmentMembersIds))',
JOIN_CLAUSE = 'left join {E}.roles r'
where GROUP_ID = (select TOP 1 g.ID from SEC_GROUP g where g.NAME like '%Руководитель департамента%') and ENTITY_NAME = 'df$Contract';

update SEC_CONSTRAINT set WHERE_CLAUSE = '({E}.substitutedCreator.id =
:session$userId OR r.user.id in (:session$departmentMembersIds))',
JOIN_CLAUSE = 'left join {E}.roles r'
where GROUP_ID = (select TOP 1 g.ID from SEC_GROUP g where g.NAME like '%Руководитель департамента%') and ENTITY_NAME = 'tm$Task';

update SEC_CONSTRAINT set WHERE_CLAUSE = '({E}.subCreator.id=:session$userId OR ({E}.global = true AND {E}.template=true)
OR tgt.task.id in (select t.id from tm$Task t left join t.roles r  where t.substitutedCreator.id =
:session$userId OR r.user.id in (:session$departmentMembersIds)))',
JOIN_CLAUSE = 'left join {E}.roles r'
where GROUP_ID = (select TOP 1 g.ID from SEC_GROUP g where g.NAME like '%Руководитель департамента%') and ENTITY_NAME = 'tm$TaskGroup';
