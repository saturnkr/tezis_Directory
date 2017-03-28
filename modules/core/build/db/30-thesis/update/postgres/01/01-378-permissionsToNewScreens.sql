-- $Id: 01-378-permissionsToNewScreens.sql 11283 2013-08-12 09:34:32Z pavlov $
-- Description: Revoke rights to JMX-Console and Undelete screens from SimpleUser role

INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, type, target, value, role_id) VALUES ('2dc3ec4c-b733-11df-932a-2b8e44e58220', current_timestamp, 'admin', 1, current_timestamp, NULL, NULL, NULL, 10, 'jmxcontrol$DisplayMbeans', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, type, target, value, role_id) VALUES ('76a6977a-b733-11df-b52a-fb44c9d29968', current_timestamp, 'admin', 1, current_timestamp, NULL, NULL, NULL, 10, 'core$Entity.restore', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c');

