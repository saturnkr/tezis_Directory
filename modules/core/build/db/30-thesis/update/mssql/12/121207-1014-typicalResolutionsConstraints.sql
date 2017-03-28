-- $Id$

delete from SEC_CONSTRAINT where id = '9ad75104-3a2e-11e2-8457-bfea7e013ec1';

insert into SEC_CONSTRAINT (ID,CREATE_TS,CREATED_BY,VERSION, ENTITY_NAME,JOIN_CLAUSE,WHERE_CLAUSE,GROUP_ID)
select '802ffec0-4035-11e2-96bd-67dbe6e43aaa', CURRENT_TIMESTAMP, USER, 1, 'df$TypicalResolution', null, '({E}.global = true OR {E}.substitutedCreator.id = :session$userId)',
id from SEC_GROUP where id = '8e6306e2-9e10-414a-b437-24c91ffef804' and delete_ts is null;

insert into SEC_CONSTRAINT (ID,CREATE_TS,CREATED_BY,VERSION, ENTITY_NAME,JOIN_CLAUSE,WHERE_CLAUSE,GROUP_ID)
select '8847523e-4035-11e2-983c-93910de3e507', CURRENT_TIMESTAMP, USER, 1, 'df$TypicalResolution', null, '({E}.global = true OR {E}.substitutedCreator.id = :session$userId)',
id from SEC_GROUP where id = '7dfe5c72-073f-4e1e-9cf4-1b1bad9c0093' and delete_ts is null;

insert into SEC_CONSTRAINT (ID,CREATE_TS,CREATED_BY,VERSION, ENTITY_NAME,JOIN_CLAUSE,WHERE_CLAUSE,GROUP_ID)
select '8ce85a54-4035-11e2-93ae-27ba989b01e9', CURRENT_TIMESTAMP, USER, 1, 'df$TypicalResolution', null, '({E}.global = true OR {E}.substitutedCreator.id = :session$userId)',
id from SEC_GROUP where id = '8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb' and delete_ts is null;

insert into SEC_CONSTRAINT (ID,CREATE_TS,CREATED_BY,VERSION, ENTITY_NAME,JOIN_CLAUSE,WHERE_CLAUSE,GROUP_ID)
select '91020d74-4035-11e2-989b-3366d8647d18', CURRENT_TIMESTAMP, USER, 1, 'df$TypicalResolution', null, '({E}.global = true OR {E}.substitutedCreator.id = :session$userId)',
id from SEC_GROUP where id = '9fa89a54-9ffa-11e1-b13e-9f4a54bff17e' and delete_ts is null;


insert into SEC_CONSTRAINT (ID,CREATE_TS,CREATED_BY,VERSION, ENTITY_NAME,JOIN_CLAUSE,WHERE_CLAUSE,GROUP_ID)
select '802ffec0-4035-11e2-96bd-67dbe6e43aaa', CURRENT_TIMESTAMP, USER, 1, 'df$TypicalResolution', null, '({E}.global = true OR {E}.substitutedCreator.id = :session$userId)',
id from SEC_GROUP where id <> '8e6306e2-9e10-414a-b437-24c91ffef804' and name = 'Ограниченный доступ' and delete_ts is null;

insert into SEC_CONSTRAINT (ID,CREATE_TS,CREATED_BY,VERSION, ENTITY_NAME,JOIN_CLAUSE,WHERE_CLAUSE,GROUP_ID)
select '8847523e-4035-11e2-983c-93910de3e507', CURRENT_TIMESTAMP, USER, 1, 'df$TypicalResolution', null, '({E}.global = true OR {E}.substitutedCreator.id = :session$userId)',
id from SEC_GROUP where id <> '7dfe5c72-073f-4e1e-9cf4-1b1bad9c0093' and name = 'Делопроизводители' and delete_ts is null;

insert into SEC_CONSTRAINT (ID,CREATE_TS,CREATED_BY,VERSION, ENTITY_NAME,JOIN_CLAUSE,WHERE_CLAUSE,GROUP_ID)
select '8ce85a54-4035-11e2-93ae-27ba989b01e9', CURRENT_TIMESTAMP, USER, 1, 'df$TypicalResolution', null, '({E}.global = true OR {E}.substitutedCreator.id = :session$userId)',
id from SEC_GROUP where id <> '8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb' and name = 'Руководитель подразделения' and delete_ts is null;

insert into SEC_CONSTRAINT (ID,CREATE_TS,CREATED_BY,VERSION, ENTITY_NAME,JOIN_CLAUSE,WHERE_CLAUSE,GROUP_ID)
select '91020d74-4035-11e2-989b-3366d8647d18', CURRENT_TIMESTAMP, USER, 1, 'df$TypicalResolution', null, '({E}.global = true OR {E}.substitutedCreator.id = :session$userId)',
id from SEC_GROUP where id <> '9fa89a54-9ffa-11e1-b13e-9f4a54bff17e' and name = 'Руководитель департамента' and delete_ts is null;
