--Группы доступа для документов, договоров, совещаний для Руководителя подразделения и Руководителя департамента
update sec_constraint set where_clause='{E}.id in (select acl.card.id from ts$CardAcl acl where (acl.user.id = :session$userId or acl.department.id in (:session$departmentIds) or acl.global = true))', join_clause = null
where group_id in ('8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb', '9fa89a54-9ffa-11e1-b13e-9f4a54bff17e')
and entity_name in ('df$Doc', 'df$SimpleDoc', 'df$Contract', 'df$MeetingDoc')
and where_clause = '{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.department.id in (:session$departmentIds) or acl.global = true)';
--Группы доступа для документов, договоров, совещаний для Ограниченного доступа
update sec_constraint set where_clause='{E}.id in (select acl.card.id from ts$CardAcl acl where (acl.user.id = :session$userId or acl.global = true))', join_clause = null
where group_id = '8e6306e2-9e10-414a-b437-24c91ffef804'
and entity_name in ('df$Doc', 'df$SimpleDoc', 'df$Contract', 'df$MeetingDoc')
and where_clause = '{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)';
--Группы доступа для документов, договоров, совещаний для Архивариуса
update sec_constraint set where_clause='({E}.docOfficeData.officeFile.state >= 30 and {E}.template = false or {E}.id in (select acl.card.id from ts$CardAcl acl where (acl.user.id = :session$userId or acl.global = true)))', join_clause = null
where group_id = 'cff945e4-e363-0dc0-d70d-4b5bdb2a2269'
and entity_name in ('df$Doc', 'df$SimpleDoc', 'df$Contract', 'df$MeetingDoc')
and where_clause = '({E}.docOfficeData.officeFile.state >= 30 and {E}.template = false or (acl.user.id = :session$userId or acl.global = true))';
--Группы доступа для документов, договоров, совещаний для Ограниченного доступа + все документы
update sec_constraint set where_clause='{E}.id in (select acl.card.id from ts$CardAcl acl where (acl.user.id = :session$userId or acl.global = true))', join_clause = null
where group_id = 'b3dc60f5-65b2-47ab-8802-9e8929bf8b29'
and entity_name in ('df$Contract', 'df$MeetingDoc')
and where_clause = '{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)';
update sec_constraint set where_clause='(TYPE({E}) in (:session$simpleDocEffectiveClass) or TYPE({E}) in (:session$meetingDocEffectiveClass) or {E}.id in (select acl.card.id from ts$CardAcl acl where (acl.user.id = :session$userId or acl.global = true)) and TYPE({E}) in (:session$contractEffectiveClass))', join_clause = null
where group_id = 'b3dc60f5-65b2-47ab-8802-9e8929bf8b29'
and entity_name = 'df$Doc'
and where_clause = '(({E}.id = acl.card.id and (TYPE({E}) in (:session$simpleDocEffectiveClass) or TYPE({E}) in (:session$meetingDocEffectiveClass))) or ({E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true) and TYPE({E}) in (:session$contractEffectiveClass)))';
--Группы доступа для документов, договоров, совещаний для Ограниченного доступа + все договора
update sec_constraint set where_clause='{E}.id in (select acl.card.id from ts$CardAcl acl where (acl.user.id = :session$userId or acl.global = true))', join_clause = null
where group_id = '9e44a053-a31f-4edd-b19b-39e942161dd2'
and entity_name in ('df$SimpleDoc', 'df$MeetingDoc')
and where_clause = '{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)';
update sec_constraint set where_clause='(TYPE({E}) in (:session$contractEffectiveClass) or {E}.id in (select acl.card.id from ts$CardAcl acl where (acl.user.id = :session$userId or acl.global = true)) and (TYPE({E}) in (:session$simpleDocEffectiveClass) or TYPE({E}) in (:session$meetingDocEffectiveClass)))', join_clause = null
where group_id = '9e44a053-a31f-4edd-b19b-39e942161dd2'
and entity_name = 'df$Doc'
and where_clause = '(({E}.id = acl.card.id and TYPE({E}) in (:session$contractEffectiveClass)) or ({E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true) and (TYPE({E}) in (:session$simpleDocEffectiveClass) or TYPE({E}) in (:session$meetingDocEffectiveClass))))';
--Группы доступа для шаблонов задач
update sec_constraint set where_clause='{E}.id in (select acl.card.id from ts$CardAcl acl where (acl.user.id = :session$userId or acl.global = true))', join_clause = null
where entity_name = 'tm$TaskPattern'
and where_clause = '{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)';
--Группы доступа для задач
update sec_constraint set where_clause='{E}.id in (select acl.card.id from ts$CardAcl acl where acl.user.id = :session$userId)', join_clause = null
where entity_name = 'tm$Task'
and where_clause = '{E}.id = acl.card.id and acl.user.id = :session$userId';
update sec_constraint set where_clause='{E}.id in (select acl.card.id from ts$CardAcl acl where (acl.department.id in (:session$departmentIds) or acl.user.id = :session$userId))', join_clause = null
where entity_name = 'tm$Task'
and where_clause = '{E}.id = acl.card.id and (acl.department.id in (:session$departmentIds) or acl.user.id = :session$userId)';

