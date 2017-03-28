-- $Id: 04-281-updateConstraint.sql 3628 2012-01-16 12:41:15Z Novikov $
update SEC_CONSTRAINT set WHERE_CLAUSE = '(r.user.id = :session$userId OR u.id =
:session$userId OR ({E}.template = true  and {E}.global = true) OR exists(select em from df$Employee em where
(em.user.id = r.user.id or em.user.id = u.id) and em.department.id in
(select eu.department.id from df$Employee eu where eu.user.id = :session$userId)))', join_clause = 'left join {E}.roles r left join {E}.substitutedCreator u'
where GROUP_ID = (select g.ID from SEC_GROUP g where g.NAME like '%Руководитель подразделения%' LIMIT 1) and ENTITY_NAME = 'df$Doc';

update SEC_CONSTRAINT set WHERE_CLAUSE = '(r.user.id = :session$userId OR u.id =
:session$userId OR ({E}.template = true  and {E}.global = true) OR exists(select em from df$Employee em where
(em.user.id = r.user.id or em.user.id = u.id) and em.department.id in
(select eu.department.id from df$Employee eu where eu.user.id = :session$userId)))', join_clause = 'left join {E}.roles r left join {E}.substitutedCreator u'
where GROUP_ID = (select g.ID from SEC_GROUP g where g.NAME like '%Руководитель подразделения%' LIMIT 1) and ENTITY_NAME = 'df$SimpleDoc';

update SEC_CONSTRAINT set WHERE_CLAUSE = '(r.user.id = :session$userId OR u.id =
:session$userId OR ({E}.template = true  and {E}.global = true) OR exists(select em from df$Employee em where
(em.user.id = r.user.id or em.user.id = u.id) and em.department.id in
(select eu.department.id from df$Employee eu where eu.user.id = :session$userId)))', join_clause = 'left join {E}.roles r left join {E}.substitutedCreator u'
where GROUP_ID = (select g.ID from SEC_GROUP g where g.NAME like '%Руководитель подразделения%' LIMIT 1) and ENTITY_NAME = 'df$Contract';

update SEC_CONSTRAINT set WHERE_CLAUSE = '(r.user.id = :session$userId OR u.id =
:session$userId OR ({E}.template = true  and {E}.global = true) OR exists(select em from df$Employee em where
(em.user.id = r.user.id or em.user.id = u.id) and em.department.id in
(:session$departmentIds)))', join_clause = 'left join {E}.roles r left join {E}.substitutedCreator u'
where GROUP_ID = (select g.ID from SEC_GROUP g where g.NAME like '%Руководитель департамента%' LIMIT 1) and ENTITY_NAME = 'df$Doc';

update SEC_CONSTRAINT set WHERE_CLAUSE = '(r.user.id = :session$userId OR u.id =
:session$userId OR ({E}.template = true  and {E}.global = true) OR exists(select em from df$Employee em where
(em.user.id = r.user.id or em.user.id = u.id) and em.department.id in
(:session$departmentIds)))', join_clause = 'left join {E}.roles r left join {E}.substitutedCreator u'
where GROUP_ID = (select g.ID from SEC_GROUP g where g.NAME like '%Руководитель департамента%' LIMIT 1) and ENTITY_NAME = 'df$SimpleDoc';

update SEC_CONSTRAINT set WHERE_CLAUSE = '(r.user.id = :session$userId OR u.id =
:session$userId OR ({E}.template = true  and {E}.global = true) OR exists(select em from df$Employee em where
(em.user.id = r.user.id or em.user.id = u.id) and em.department.id in
(:session$departmentIds)))', join_clause = 'left join {E}.roles r left join {E}.substitutedCreator u'
where GROUP_ID = (select g.ID from SEC_GROUP g where g.NAME like '%Руководитель департамента%' LIMIT 1) and ENTITY_NAME = 'df$Contract';
