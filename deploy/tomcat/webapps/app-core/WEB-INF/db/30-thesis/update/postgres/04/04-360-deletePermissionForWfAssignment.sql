-- $Id: 04-360-deletePermissionForWfAssignment.sql 4121 2012-03-01 11:09:08Z pavlov $

delete from sec_permission where target like 'wf$Assignment:%' and type = 20 and role_id = '96fa7fe9-397d-4bac-b14a-eec2d94de68c' and value = 0;