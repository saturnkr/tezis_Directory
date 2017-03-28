-- $Id: 01-420-InsertIntoSecPermission.sql 11283 2013-08-12 09:34:32Z pavlov $
-- Description:
DELETE FROM sec_permission where target = 'tm$taskGroupCreator' AND role_id='96fa7fe9-397d-4bac-b14a-eec2d94de68c';
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, type, target, value, role_id) VALUES ('2f3ed5bf-01ae-49f2-8431-9ad86a71ea50', '2010-05-20 13:04:47.49', 'admin', 1, '2010-05-20 13:04:47.49', NULL, NULL, NULL, 10, 'tm$taskGroupCreator', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c');