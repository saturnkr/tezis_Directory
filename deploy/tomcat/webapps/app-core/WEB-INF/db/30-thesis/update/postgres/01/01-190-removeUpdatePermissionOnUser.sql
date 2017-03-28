-- $Id: 01-190-removeUpdatePermissionOnUser.sql 11283 2013-08-12 09:34:32Z pavlov $
-- Description: access for role SimpleUser to update User

delete from "public"."sec_permission"
where target = 'sec$User:update' and role_id = '96fa7fe9-397d-4bac-b14a-eec2d94de68c' and value = 0;

INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, type, target, value, role_id)
VALUES ('3ccc3e08-6c9a-11df-b69f-abdb42ff7f18', '2010-05-31 13:04:47.49', 'admin', 1, '2010-05-20 13:04:47.49', NULL, NULL, NULL, 10, 'sec$User.edit', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c');