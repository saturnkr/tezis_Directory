-- $Id: 01-360-updateRolesForSimpleUser.sql 11283 2013-08-12 09:34:32Z pavlov $
-- Description: disable UserGroup, systemSettings for SimpleUser,enable systemSettings for Administators, enable  UserGroup for ReferenceEditor

create or replace function systemSettingPermission() returns void as $$
declare
    i integer;
begin
    select 1 into i from sec_permission
    where target = 'systemSettings' and role_id = '96fa7fe9-397d-4bac-b14a-eec2d94de68c' and type = 10;

    if (i is null) then
      INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, type, target, value, role_id)
      VALUES ('b9bf7d7f-8242-4fde-b550-e33d8c0c0545', '2010-05-20 14:12:48.65', 'admin', 1, '2010-05-20 14:12:48.65', NULL, NULL, NULL, 10, 'systemSettings', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c');
    end if;

    select 1 into i from sec_permission
    where target = 'systemSettings' and role_id = '0c018061-b26f-4de2-a5be-dff348347f93' and type = 10;

    if (i is null) then
      INSERT INTO sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, type, target, value, role_id)
      VALUES ('d9212fa1-a02d-48e3-896c-81c741fb2c5b', '2010-05-20 14:15:26.38', 'admin', 1, '2010-05-20 14:15:26.38', NULL, NULL, NULL, 10, 'systemSettings', 1, '0c018061-b26f-4de2-a5be-dff348347f93');
    end if;
end;
$$ language plpgsql^

select systemSettingPermission()^

drop function systemSettingPermission()^

INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,type,target,value,role_id) VALUES ('de3f0f68-30f6-4991-bc07-19076ca4be6a',{ts '2010-09-07 15:49:22.100'},'admin',1,{ts '2010-09-07 15:49:22.100'},null,null,null,20,'wf$UserGroup:update',1,'0038f3db-ac9c-4323-83e7-356996cc63ae')^
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,type,target,value,role_id) VALUES ('36a1e714-6191-46ca-bfe8-979e825091c1',{ts '2010-09-07 15:49:22.100'},'admin',1,{ts '2010-09-07 15:49:22.100'},null,null,null,20,'wf$UserGroup:create',1,'0038f3db-ac9c-4323-83e7-356996cc63ae')^
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,type,target,value,role_id) VALUES ('916d3665-a309-4f8e-8e30-06c79fd92d2f',{ts '2010-09-07 15:49:22.100'},'admin',1,{ts '2010-09-07 15:49:22.100'},null,null,null,20,'wf$UserGroup:delete',1,'0038f3db-ac9c-4323-83e7-356996cc63ae')^

INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,type,target,value,role_id) VALUES ('a1599c5e-06d1-4913-93d8-17ce60c8cda4',{ts '2010-09-07 15:49:22.100'},'admin',1,{ts '2010-09-07 15:49:22.100'},null,null,null,20,'wf$UserGroup:update',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c')^
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,type,target,value,role_id) VALUES ('6939777d-c9da-43fd-a497-10f2e139af76',{ts '2010-09-07 15:49:22.100'},'admin',1,{ts '2010-09-07 15:49:22.100'},null,null,null,20,'wf$UserGroup:create',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c')^
INSERT INTO "public"."sec_permission" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,type,target,value,role_id) VALUES ('8a1cdd2e-f655-45f0-ba96-c37eb7df6e16',{ts '2010-09-07 15:49:22.100'},'admin',1,{ts '2010-09-07 15:49:22.100'},null,null,null,20,'wf$UserGroup:delete',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c')^
