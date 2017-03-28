--$id$

insert into SEC_PERMISSION (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, TYPE, TARGET, VALUE, ROLE_ID)
select newid(), null, null, null, null, null, null, null, 40, 'thesis.userGroup.edit.global', 1, ID from SEC_ROLE where NAME in ('Administrators', 'ReferenceEditor')
^

insert into SEC_PERMISSION (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, TYPE, TARGET, VALUE, ROLE_ID)
select newid(), null, null, null, null, null, null, null, 40, 'thesis.userGroup.edit.global', 0, ID from SEC_ROLE where NAME = 'SimpleUser'
^

delete from SEC_PERMISSION where ROLE_ID in (select ID from SEC_ROLE where NAME = 'SimpleUser') and TYPE = 20 and TARGET like 'wf$UserGroup%'
^

insert into SEC_CONSTRAINT (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, ENTITY_NAME, JOIN_CLAUSE, WHERE_CLAUSE, GROUP_ID)
select newid(), now(), null, 1, null, null, null, null, 'wf$UserGroup', null, '({E}.substitutedCreator.id = :session$userId or {E}.global = true)', ID from SEC_GROUP where ID <> '0fa2b1a5-1d68-4d69-9fbd-dff348347f93'
^