-- $Id: 04-410-deletePermission.sql 4185 2012-03-07 07:18:35Z Novikov $


delete from sec_permission where target like 'sec$Filter:%' and type = 20 and role_id = '96fa7fe9-397d-4bac-b14a-eec2d94de68c' and value = 0;
delete from sec_permission where target like 'wf$CardRole:%' and type = 20 and role_id = '96fa7fe9-397d-4bac-b14a-eec2d94de68c' and value = 0;
delete from sec_permission where target like 'wf$Attachment:%' and type = 20 and role_id = '96fa7fe9-397d-4bac-b14a-eec2d94de68c' and value = 0;
delete from sec_permission where target like 'core$FileDescriptor:%' and type = 20 and role_id = '96fa7fe9-397d-4bac-b14a-eec2d94de68c' and value = 0;
delete from sec_permission where target like 'wf$CardAttachment:%' and type = 20 and role_id = '96fa7fe9-397d-4bac-b14a-eec2d94de68c' and value = 0;
delete from sec_permission where target like 'wf$AssignmentAttachment:%' and type = 20 and role_id = '96fa7fe9-397d-4bac-b14a-eec2d94de68c' and value = 0;