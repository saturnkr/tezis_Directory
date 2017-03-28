-- $Id: 01-170-Permissions.sql 11283 2013-08-12 09:34:32Z pavlov $
-- Description: System parameters screens are available for admins

INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, type, target, value, role_id) VALUES ('b9bf7d7f-8242-4fde-b550-e33d8c0c0545', '2010-05-20 14:12:48.65', 'admin', 1, '2010-05-20 14:12:48.65', NULL, NULL, NULL, 10, 'systemSettings', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, type, target, value, role_id) VALUES ('d9212fa1-a02d-48e3-896c-81c741fb2c5b', '2010-05-20 14:15:26.38', 'admin', 1, '2010-05-20 14:15:26.38', NULL, NULL, NULL, 10, 'systemSettings', 1, '0c018061-b26f-4de2-a5be-dff348347f93');

