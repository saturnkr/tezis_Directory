-- $Id: 01-050-createSchedulerUser.sql 85 2010-04-08 11:43:55Z krivopustov $
-- Description: create SchedulerUser

insert into SEC_USER (ID, CREATE_TS, VERSION, LOGIN, LOGIN_LC, PASSWORD, NAME, GROUP_ID, ACTIVE)
values ('0bc7263e-e4a2-4137-a4d8-a9e225e8ac84', current_timestamp, 0, 'SchedulerUser', 'scheduleruser',
'7e0ffe513f4e8c8f1376da12fe9c5561', '', '0fa2b1a5-1d68-4d69-9fbd-dff348347f93', true);

update SEC_USER set CREATED_BY='admin' where LOGIN='admin';

-- constraint to hide system users

INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id) VALUES ('cbd897a2-5c4d-4b84-a613-6393c435cbcc',null,'admin',1,null,null,null,null,'sec$User',null,'t.createdBy is not null','0fa2b1a5-1d68-4d69-9fbd-dff348347f93');
