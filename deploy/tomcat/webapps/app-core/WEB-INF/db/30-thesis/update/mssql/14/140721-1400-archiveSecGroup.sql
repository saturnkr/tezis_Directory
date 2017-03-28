--$Id: 140721-1400-archiveSecGroup.sql 16789 2014-07-21 14:24:54Z saiyan $

insert into sec_permission(id, create_ts, created_by, version, permission_type, target, value, role_id) values
(newid(), current_timestamp, 'system', 1, 10, 'ts$ArchivedSimpleDoc.browse', 1, '7091f5ef-a77a-450a-834a-39406885676e'); -- secretary
insert into sec_permission(id, create_ts, created_by, version, permission_type, target, value, role_id) values
(newid(), current_timestamp, 'system', 1, 10, 'ts$ArchivedContract.browse', 1, '7091f5ef-a77a-450a-834a-39406885676e'); -- secretary

create index IDX_OFFICE_FILE_STATE on DF_OFFICE_FILE(state);

insert into SEC_GROUP(id,create_ts,created_by,version,name,parent_id)
values('cff945e4-e363-0dc0-d70d-4b5bdb2a2269', current_timestamp, 'system', 1, 'Архивариус', '0fa2b1a5-1d68-4d69-9fbd-dff348347f93');

insert into SEC_GROUP_HIERARCHY(id, create_ts, created_by, group_id, parent_id, hierarchy_level) values
('69ce75c8-10ca-11e4-a1bf-9f791863ea06', current_timestamp, 'system', 'cff945e4-e363-0dc0-d70d-4b5bdb2a2269','0fa2b1a5-1d68-4d69-9fbd-dff348347f93', 0);

insert into sec_constraint(id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id) values
('bc94a0d4-10ca-11e4-8fb1-07511252f87c', current_timestamp, 'system', 1, 'df$Doc', 'join {E}.aclList acl', '({E}.docOfficeData.officeFile.state >= 30 or (acl.user.id = :session$userId or acl.global = true))', 'cff945e4-e363-0dc0-d70d-4b5bdb2a2269');

insert into sec_constraint(id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id) values
('bfb52f2c-10ca-11e4-bf3e-934403a7308f', current_timestamp, 'system', 1, 'df$SimpleDoc', 'join {E}.aclList acl', '({E}.docOfficeData.officeFile.state >= 30 or (acl.user.id = :session$userId or acl.global = true))', 'cff945e4-e363-0dc0-d70d-4b5bdb2a2269');

insert into sec_constraint(id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id) values
('c2292574-10ca-11e4-857e-bb6e9cc79bd5', current_timestamp, 'system', 1, 'df$Contract', 'join {E}.aclList acl', '({E}.docOfficeData.officeFile.state >= 30 or (acl.user.id = :session$userId or acl.global = true))', 'cff945e4-e363-0dc0-d70d-4b5bdb2a2269');

insert into sec_constraint(id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id) values
('c42e9fa2-10ca-11e4-9c89-8758c81c5f95', current_timestamp, 'system', 1, 'tm$Task', ', ts$CardAcl acl', '{E}.id = acl.card.id and acl.user.id = :session$userId', 'cff945e4-e363-0dc0-d70d-4b5bdb2a2269');

insert into sec_constraint(id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id) values
('c646b7e8-10ca-11e4-9ac6-5b5381a1ae07', current_timestamp, 'system', 1, 'tm$TaskPattern', ', ts$CardAcl acl', '{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)', 'cff945e4-e363-0dc0-d70d-4b5bdb2a2269');

insert into sec_constraint(id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id) values
('c927f1b6-10ca-11e4-b068-fb1093d5ff87', current_timestamp, 'system', 1, 'df$TypicalResolution', null, '({E}.global = true OR {E}.substitutedCreator.id = :session$userId)', 'cff945e4-e363-0dc0-d70d-4b5bdb2a2269');

insert into sec_constraint(id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id) values
('cba18d6c-10ca-11e4-a48e-cf4e88c4e746', current_timestamp, 'system', 1, 'wf$UserGroup', null, '({E}.substitutedCreator.id = :session$userId or {E}.global = true)', 'cff945e4-e363-0dc0-d70d-4b5bdb2a2269');

insert into sec_constraint(id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id) values
('ce7b9b22-10ca-11e4-8ecc-a3cabbbb49b3', current_timestamp, 'system', 1, 'tm$TaskGroup', 'left join {E}.taskGroupTasks tgt left join {E}.participants p',
'({E}.subCreator.id = :session$userId
 or p.id = :session$userId
 or {E}.chairman.id = :session$userId
 or {E}.secretary.id = :session$userId
 or {E}.initiator.id = :session$userId
 or exists (select c from wf$CardRole c where c.card = tgt.task and c.user.id = :session$userId and c.deleteTs is null) or  ({E}.template = true AND {E}.global = true  ))', 'cff945e4-e363-0dc0-d70d-4b5bdb2a2269');
