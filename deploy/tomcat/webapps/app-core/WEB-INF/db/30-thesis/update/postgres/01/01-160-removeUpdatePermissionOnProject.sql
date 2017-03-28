-- $Id: 01-160-removeUpdatePermissionOnProject.sql 798 2010-10-01 08:19:30Z pavlov $
-- Description: Remove update permission on Project for SimpleUser

delete from "public"."sec_permission"
where target = 'tm$Project:update' and role_id = '96fa7fe9-397d-4bac-b14a-eec2d94de68c' and value = 0;