-- $Id: 01-010-changeSimpleUser.sql 11283 2013-08-12 09:34:32Z pavlov $
-- Description
insert into sec_permission (id, create_ts, created_by, type, target, value, role_id)
values ('e91407e0-725b-11e1-9738-4f4aa51f761f', current_timestamp, 'admin', 10, 'serverLog', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c');



