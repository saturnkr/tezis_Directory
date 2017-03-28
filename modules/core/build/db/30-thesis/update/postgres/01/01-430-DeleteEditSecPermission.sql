-- $Id: 01-430-DeleteEditSecPermission.sql 11283 2013-08-12 09:34:32Z pavlov $
-- Description:
DELETE FROM sec_permission where target = 'tm$Task.edit' AND role_id='96fa7fe9-397d-4bac-b14a-eec2d94de68c';
DELETE FROM sec_permission where target = 'docCreator' AND role_id='96fa7fe9-397d-4bac-b14a-eec2d94de68c';
DELETE FROM sec_permission where target = 'contractCreator' AND role_id='96fa7fe9-397d-4bac-b14a-eec2d94de68c';
DELETE FROM sec_permission where target = 'report$Report.browse' AND role_id='96fa7fe9-397d-4bac-b14a-eec2d94de68c';
DELETE FROM sec_permission where target = 'tm$taskGroupCreator' AND role_id='96fa7fe9-397d-4bac-b14a-eec2d94de68c';