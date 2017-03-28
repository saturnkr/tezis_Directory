-- $Id: 150508-1424-updateSecGroupConstraints.sql 20170 2015-05-22 14:35:38Z kozyaikin $
-- Description:
INSERT INTO sec_constraint (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES
('589212af-c2cb-ee71-6029-e742d0935ed8',{ts '2010-06-08 16:22:33.800'},'admin',3,{ts '2010-06-10 18:42:01.850'},'admin',null,null,'df$MeetingDoc',', ts$CardAcl acl','{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)','8e6306e2-9e10-414a-b437-24c91ffef804');
INSERT INTO sec_constraint (id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id) VALUES
(newid(), now(), USER, 1, 'df$MeetingDoc', ', ts$CardAcl acl', '{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.department.id in (:session$departmentIds) or acl.global = true)','8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb');
INSERT INTO sec_constraint (id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id) VALUES
(newid(), now(), USER, 1, 'df$MeetingDoc', ', ts$CardAcl acl', '{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.department.id in (:session$departmentIds) or acl.global = true)','9fa89a54-9ffa-11e1-b13e-9f4a54bff17e');
INSERT INTO sec_constraint(id, create_ts, created_by, version, entity_name, join_clause, where_clause, group_id) VALUES
('ce84d65b-6f47-c896-d393-bf3dab98660d', now(), 'system', 1, 'df$MeetingDoc', 'join {E}.aclList acl', '({E}.docOfficeData.officeFile.state >= 30 and {E}.template = false or (acl.user.id = :session$userId or acl.global = true))', 'cff945e4-e363-0dc0-d70d-4b5bdb2a2269');
INSERT INTO sec_constraint (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES
('9efe6868-855e-e9f0-eca6-6f6c6931633e',{ts '2013-04-03 16:22:33.800'},'admin',3,{ts '2013-04-03 18:42:01.850'},'admin',null,null,'df$MeetingDoc',', ts$CardAcl acl','{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)','9e44a053-a31f-4edd-b19b-39e942161dd2');
INSERT INTO sec_constraint (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES
('9466d7c9-66a2-412b-5579-2be06a97b136',{ts '2010-06-08 16:22:33.800'},'admin',3,{ts '2010-06-10 18:42:01.850'},'admin',null,null,'df$MeetingDoc',', ts$CardAcl acl','{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)','b3dc60f5-65b2-47ab-8802-9e8929bf8b29');
