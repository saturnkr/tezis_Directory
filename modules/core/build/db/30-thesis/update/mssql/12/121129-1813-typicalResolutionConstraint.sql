-- $Id$

insert into SEC_CONSTRAINT (ID,CREATE_TS,CREATED_BY,VERSION, ENTITY_NAME,JOIN_CLAUSE,WHERE_CLAUSE,GROUP_ID) values ('9ad75104-3a2e-11e2-8457-bfea7e013ec1', CURRENT_TIMESTAMP, USER, 1, 'df$TypicalResolution', null, '({E}.global = true OR {E}.substitutedCreator.id = :session$userId)', '0fa2b1a5-1d68-4d69-9fbd-dff348347f93');