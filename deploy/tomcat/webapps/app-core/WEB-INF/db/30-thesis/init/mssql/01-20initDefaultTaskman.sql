-- $Id: 01-20initDefaultTaskman.sql 20627 2015-07-06 09:41:19Z mishunin $
-- Description:
--Update Proc an ProcRole--
update WF_PROC set name = 'Управление задачами', card_types = ',tm$Task,' where jbpm_process_key = 'TaskManagement' and updated_by is null;
update WF_PROC set name = 'Управление задачами', HIDDEN_DECISIONS_BPMN = 'ControlByInitiatorDecision,IsSelfAssignedTaskAfterStart,IsSelfAssignedTask' where jbpm_process_key = 'TaskManagement';
update WF_PROC_ROLE set name = 'Initiator', role_id = (select id from SEC_ROLE where name = 'task_initiator'),assign_to_creator=1 where code = '10-Initiator' and proc_id = (select id from WF_PROC where jbpm_process_key = 'TaskManagement') and updated_by is null;
update WF_PROC_ROLE set name = 'Executor', role_id = (select id from SEC_ROLE where name = 'task_executor'), order_filling_type = 'P', is_multi_user = 1 where code = '20-Executor' and proc_id = (select id from WF_PROC where jbpm_process_key = 'TaskManagement') and updated_by is null;
update WF_PROC_ROLE set name = 'Controller', role_id = (select id from SEC_ROLE where name = 'task_controller') where code = '30-Controller' and proc_id = (select id from WF_PROC where jbpm_process_key = 'TaskManagement') and updated_by is null;
update WF_PROC_ROLE set name = 'Observer', role_id = (select id from SEC_ROLE where name = 'task_observer'), order_filling_type = 'P', is_multi_user = 1 where code = '90-Observer' and proc_id = (select id from WF_PROC where jbpm_process_key = 'TaskManagement') and updated_by is null;
update WF_PROC_ROLE set name = 'Creator', role_id = (select id from SEC_ROLE where name = 'task_creator') where code = 'CARD_CREATOR' and proc_id = (select id from WF_PROC where jbpm_process_key = 'TaskManagement') and updated_by is null;

update WF_PROC_ROLE set assign_to_creator='1' where code = '10-Initiator';

update wf_proc_role set sort_order = 1 where code = '10-Initiator' and proc_id = (select id from wf_proc where code = 'TaskManagement') and delete_ts is null;
update wf_proc_role set sort_order = 2 where code = '20-Executor' and proc_id = (select id from wf_proc where code = 'TaskManagement') and delete_ts is null;
update wf_proc_role set sort_order = 3 where code = '30-Controller' and proc_id = (select id from wf_proc where code = 'TaskManagement') and delete_ts is null;
update wf_proc_role set sort_order = 4 where code = '90-Observer' and proc_id = (select id from wf_proc where code = 'TaskManagement') and delete_ts is null;
update wf_proc_role set sort_order = 5 where code = 'CARD_CREATOR' and proc_id = (select id from wf_proc where code = 'TaskManagement') and delete_ts is null;
^


CREATE procedure baseInsert
AS
BEGIN
  DECLARE @cnt integer;
--Insert roles by Administrator--
select @cnt =  count(id) from SEC_USER_ROLE where id = '2bf2d72c-d773-45b6-9775-826e8294f926'
or (user_id = '60885987-1b61-4247-94c7-dff348347f93' and role_id = '0c018061-b26f-4de2-a5be-dff348347f93');
if(@cnt = 0) begin
insert into SEC_USER_ROLE (id, create_ts, created_by, version, user_id, role_id) values ('2bf2d72c-d773-45b6-9775-826e8294f926', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, '60885987-1b61-4247-94c7-dff348347f93', '0c018061-b26f-4de2-a5be-dff348347f93');
end;
select @cnt =  count(id) from SEC_USER_ROLE where id = '505c696d-9460-4712-ba27-55053b8f3757'
or (user_id = '60885987-1b61-4247-94c7-dff348347f93' and role_id = 'c06c0cee-2f21-4241-8d6f-76b4cd462f96');
if(@cnt = 0) begin
insert into SEC_USER_ROLE (id, create_ts, created_by, version, user_id, role_id) values ('505c696d-9460-4712-ba27-55053b8f3757', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, '60885987-1b61-4247-94c7-dff348347f93', 'c06c0cee-2f21-4241-8d6f-76b4cd462f96');
end;
select @cnt = count(id) from SEC_USER_ROLE where id = '35b174b6-b3b3-4c55-bc62-b854414cef57'
or (user_id = '60885987-1b61-4247-94c7-dff348347f93' and role_id = 'e41f5aa2-3296-4fdc-906e-af2f8660f806');
if(@cnt = 0) begin
insert into SEC_USER_ROLE (id, create_ts, created_by, version, user_id, role_id) values ('35b174b6-b3b3-4c55-bc62-b854414cef57', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, '60885987-1b61-4247-94c7-dff348347f93', 'e41f5aa2-3296-4fdc-906e-af2f8660f806');
end;
select @cnt = count(id) from SEC_USER_ROLE where id = 'c362eb7b-f423-4f62-beb2-2fa100e6f116'
or (user_id = '60885987-1b61-4247-94c7-dff348347f93' and role_id = '7091f5ef-a77a-450a-834a-39406885676e');
if(@cnt = 0) begin
insert into SEC_USER_ROLE (id, create_ts, created_by, version, user_id, role_id) values ('c362eb7b-f423-4f62-beb2-2fa100e6f116', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, '60885987-1b61-4247-94c7-dff348347f93', '7091f5ef-a77a-450a-834a-39406885676e');
end;
select @cnt = count(id) from SEC_USER_ROLE where id = '27282768-1015-4120-bbc9-14a8e5ab7276'
or (user_id = '60885987-1b61-4247-94c7-dff348347f93' and role_id = '47135f12-071b-43d8-bc21-2ff77cd08fb6');
if(@cnt = 0) begin
insert into SEC_USER_ROLE (id, create_ts, created_by, version, user_id, role_id) values ('27282768-1015-4120-bbc9-14a8e5ab7276', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, '60885987-1b61-4247-94c7-dff348347f93', '47135f12-071b-43d8-bc21-2ff77cd08fb6');
end;
select @cnt = count(id) from SEC_USER_ROLE where id = 'fc843d30-3a61-4dce-a3f5-78ae23fedcdb'
or (user_id = '60885987-1b61-4247-94c7-dff348347f93' and role_id = '3c9abffb-2fae-484e-990c-343b3c1197ca');
if(@cnt = 0) begin
insert into SEC_USER_ROLE (id, create_ts, created_by, version, user_id, role_id) values ('fc843d30-3a61-4dce-a3f5-78ae23fedcdb', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, '60885987-1b61-4247-94c7-dff348347f93', '3c9abffb-2fae-484e-990c-343b3c1197ca');
end;
select @cnt = count(id) from SEC_USER_ROLE where id = '922e85ee-efef-4ffa-bfce-214d51ce5c52'
or (user_id = '60885987-1b61-4247-94c7-dff348347f93' and role_id = '7a35c6f8-6a2d-4347-a8c2-3bc887e23c83');
if(@cnt = 0) begin
insert into SEC_USER_ROLE (id, create_ts, created_by, version, user_id, role_id) values ('922e85ee-efef-4ffa-bfce-214d51ce5c52', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, '60885987-1b61-4247-94c7-dff348347f93', '7a35c6f8-6a2d-4347-a8c2-3bc887e23c83');
end;
select @cnt = count(id) from SEC_USER_ROLE where id = '58f80bee-58d7-43dc-b14d-d57de959b36f'
or (user_id = '60885987-1b61-4247-94c7-dff348347f93' and role_id = 'f7ff1ec7-802d-4a42-a7db-1a97e17f893f');
if(@cnt = 0) begin
insert into SEC_USER_ROLE (id, create_ts, created_by, version, user_id, role_id) values ('58f80bee-58d7-43dc-b14d-d57de959b36f', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, '60885987-1b61-4247-94c7-dff348347f93', 'f7ff1ec7-802d-4a42-a7db-1a97e17f893f');
end;
select @cnt = count(id) from SEC_USER_ROLE where id = '836d8822-ca48-4197-bb7b-78fd37b5076b'
or (user_id = '60885987-1b61-4247-94c7-dff348347f93' and role_id = '0038f3db-ac9c-4323-83e7-356996cc63ae');
if(@cnt = 0) begin
insert into SEC_USER_ROLE (id, create_ts, created_by, version, user_id, role_id) values ('836d8822-ca48-4197-bb7b-78fd37b5076b', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, '60885987-1b61-4247-94c7-dff348347f93', '0038f3db-ac9c-4323-83e7-356996cc63ae');
end;
select @cnt = count(id) from SEC_USER_ROLE where id = '3bafe8fd-0967-4d3d-a251-9c4b5ca30fa8'
or (user_id = '60885987-1b61-4247-94c7-dff348347f93' and role_id = '64fec164-5408-4e48-9e72-5a1d214c533e');
if(@cnt = 0) begin
insert into SEC_USER_ROLE (id, create_ts, created_by, version, user_id, role_id) values ('3bafe8fd-0967-4d3d-a251-9c4b5ca30fa8', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, '60885987-1b61-4247-94c7-dff348347f93', '64fec164-5408-4e48-9e72-5a1d214c533e');
end;
select @cnt = count(id) from SEC_USER_ROLE where id = '264a0a91-3743-4528-a713-e0ce329fb80b'
or (user_id = '60885987-1b61-4247-94c7-dff348347f93' and role_id = 'c0e15ca3-1791-4e52-9882-c88fd72fbac1');
if(@cnt = 0) begin
insert into SEC_USER_ROLE (id, create_ts, created_by, version, user_id, role_id) values ('264a0a91-3743-4528-a713-e0ce329fb80b', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, '60885987-1b61-4247-94c7-dff348347f93', 'c0e15ca3-1791-4e52-9882-c88fd72fbac1');
end;
select @cnt = count(id) from SEC_USER_ROLE where id = '8bb3653d-e8c9-433a-93d8-3aa2f1d142a9'
or (user_id = '60885987-1b61-4247-94c7-dff348347f93' and role_id = '5115e833-4146-4c98-a119-1c06053adb92');
if(@cnt = 0) begin
insert into SEC_USER_ROLE (id, create_ts, created_by, version, user_id, role_id) values ('8bb3653d-e8c9-433a-93d8-3aa2f1d142a9', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, '60885987-1b61-4247-94c7-dff348347f93', '5115e833-4146-4c98-a119-1c06053adb92');
end;
select @cnt = count(id) from SEC_USER_ROLE where id = 'd9914437-4a9a-48c3-b42e-12febe47c61b'
or (user_id = '60885987-1b61-4247-94c7-dff348347f93' and role_id = 'af439810-0f11-4a21-b239-7df2df83bbc6');
if(@cnt = 0) begin
insert into SEC_USER_ROLE (id, create_ts, created_by, version, user_id, role_id) values ('d9914437-4a9a-48c3-b42e-12febe47c61b', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, '60885987-1b61-4247-94c7-dff348347f93', 'af439810-0f11-4a21-b239-7df2df83bbc6');
end;

select @cnt = count(id) from TM_PROJECT_GROUP where id = 'b875aded-88e7-4090-9f81-a1a5fac75192';
if(@cnt = 0) begin
insert into TM_PROJECT_GROUP (id, name, create_ts, created_by, version) values ('b875aded-88e7-4090-9f81-a1a5fac75192', 'Basic project', {ts '2010-10-28 00:00:00.00'}, 'admin', 1);
end;

select @cnt = count(CATEGORY_ID) from TM_TASK_TYPE where CATEGORY_ID = '836d02a0-68a9-4aa5-b11a-08e9b32c589b';
if(@cnt = 0) begin
insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
values ('836d02a0-68a9-4aa5-b11a-08e9b32c589b', 'Basic', 'tm$Task', 0, current_timestamp, USER, 1, 2);
insert into TM_TASK_TYPE (CATEGORY_ID, create_ts, created_by, version, category_attrs_place, tab_name)
values ('836d02a0-68a9-4aa5-b11a-08e9b32c589b', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, 1, 'Доп. поля');
end;

select @cnt = count(id) from SYS_CONFIG where name = 'workflow.sms.smsProviderClassName';
if(@cnt = 0) begin
insert into SYS_CONFIG (id, name, create_ts, created_by, version) values ('f6a9be40-16ac-11e2-8783-7b7ddae9940d', current_timestamp, 'admin', 1, 'workflow.sms.smsProviderClassName', 'com.haulmont.thesis.core.app.SmsTrafficProvider');
end;

END;
^
exec baseInsert;
^
drop procedure baseInsert;
