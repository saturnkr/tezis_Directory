-- $Id: 01-160-Permissions.sql 11283 2013-08-12 09:34:32Z pavlov $
-- Description: Office screens are availabale for secretars only

INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, type, target, value, role_id) VALUES ('9e75c7eb-a430-44f7-8b51-b9f6db4dd90f', '2010-05-20 13:04:11.42', 'admin', 1, '2010-05-20 13:04:11.42', NULL, NULL, NULL, 10, 'df$DocIncome.browse', 1, '7091f5ef-a77a-450a-834a-39406885676e');
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, type, target, value, role_id) VALUES ('6ed2a5df-8d7c-42ac-8eef-e1bf0edc95a9', '2010-05-20 13:04:11.42', 'admin', 1, '2010-05-20 13:04:11.42', NULL, NULL, NULL, 10, 'df$DocInternal.browse', 1, '7091f5ef-a77a-450a-834a-39406885676e');
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, type, target, value, role_id) VALUES ('33dd26ac-a1d8-4894-a7b1-5afe0a069773', '2010-05-20 13:04:11.42', 'admin', 1, '2010-05-20 13:04:11.42', NULL, NULL, NULL, 10, 'df$OfficeFileNomenclature.browse', 1, '7091f5ef-a77a-450a-834a-39406885676e');
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, type, target, value, role_id) VALUES ('0db798c7-98ab-41ce-82ce-7eb116953554', '2010-05-20 13:04:11.42', 'admin', 1, '2010-05-20 13:04:11.42', NULL, NULL, NULL, 10, 'df$DocReceivingMethod.browse', 1, '7091f5ef-a77a-450a-834a-39406885676e');
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, type, target, value, role_id) VALUES ('88d0aa5c-3b84-42c5-b715-ccd24bcf59d8', '2010-05-20 13:04:11.42', 'admin', 1, '2010-05-20 13:04:11.42', NULL, NULL, NULL, 10, 'df$DocOutcome.browse', 1, '7091f5ef-a77a-450a-834a-39406885676e');
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, type, target, value, role_id) VALUES ('e76d68f8-4e4a-4972-b1e5-6e19e0381e1d', '2010-05-20 13:04:11.42', 'admin', 1, '2010-05-20 13:04:11.42', NULL, NULL, NULL, 10, 'df$OfficeFile.browse', 1, '7091f5ef-a77a-450a-834a-39406885676e');
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, type, target, value, role_id) VALUES ('b525fcc6-2963-4c95-ab53-736d513d2e87', '2010-05-20 13:04:47.47', 'admin', 1, '2010-05-20 13:04:47.47', NULL, NULL, NULL, 10, 'df$OfficeFile.browse', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, type, target, value, role_id) VALUES ('ce5eea18-6112-4e8c-9354-31f70f557151', '2010-05-20 13:04:47.47', 'admin', 1, '2010-05-20 13:04:47.47', NULL, NULL, NULL, 10, 'df$DocReceivingMethod.browse', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, type, target, value, role_id) VALUES ('76eaa12b-4d9c-45e6-8265-4e88241d6c8d', '2010-05-20 13:04:47.48', 'admin', 1, '2010-05-20 13:04:47.48', NULL, NULL, NULL, 10, 'df$OfficeFileNomenclature.browse', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, type, target, value, role_id) VALUES ('a275efde-db56-483d-8d44-675336311faa', '2010-05-20 13:04:47.48', 'admin', 1, '2010-05-20 13:04:47.48', NULL, NULL, NULL, 10, 'df$DocIncome.browse', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, type, target, value, role_id) VALUES ('deddf997-f5d2-4512-96ef-49b41be754af', '2010-05-20 13:04:47.48', 'admin', 1, '2010-05-20 13:04:47.48', NULL, NULL, NULL, 10, 'df$DocOutcome.browse', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c');
INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, type, target, value, role_id) VALUES ('5a8d93b9-c2ac-454d-b88b-16967973a54e', '2010-05-20 13:04:47.49', 'admin', 1, '2010-05-20 13:04:47.49', NULL, NULL, NULL, 10, 'df$DocInternal.browse', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c');
