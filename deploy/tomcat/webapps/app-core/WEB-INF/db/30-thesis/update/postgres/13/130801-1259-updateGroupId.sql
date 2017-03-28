-- $Id: 130801-1259-updateGroupId.sql 17210 2014-08-26 11:02:06Z kozyaikin $
-- Description:

DO
$BODY$
BEGIN
if not exists (select * from SEC_GROUP where ID = '9fa89a54-9ffa-11e1-b13e-9f4a54bff17e') and
       exists (select * from SEC_GROUP where NAME = 'Руководитель департамента')
then
	insert into SEC_GROUP (select '9fa89a54-9ffa-11e1-b13e-9f4a54bff17e', create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, name, parent_id
	from SEC_GROUP where NAME = 'Руководитель департамента');

	update SEC_GROUP set PARENT_ID = '9fa89a54-9ffa-11e1-b13e-9f4a54bff17e'
	where PARENT_ID = (select ID from SEC_GROUP where NAME = 'Руководитель департамента' and ID <> '9fa89a54-9ffa-11e1-b13e-9f4a54bff17e');

	update SEC_GROUP_HIERARCHY set GROUP_ID = '9fa89a54-9ffa-11e1-b13e-9f4a54bff17e'
	where GROUP_ID = (select ID from SEC_GROUP where NAME = 'Руководитель департамента' and ID <> '9fa89a54-9ffa-11e1-b13e-9f4a54bff17e');

	update SEC_GROUP_HIERARCHY set PARENT_ID = '9fa89a54-9ffa-11e1-b13e-9f4a54bff17e'
    	where PARENT_ID = (select ID from SEC_GROUP where NAME = 'Руководитель департамента' and ID <> '9fa89a54-9ffa-11e1-b13e-9f4a54bff17e');

	update SEC_USER set GROUP_ID = '9fa89a54-9ffa-11e1-b13e-9f4a54bff17e'
	where GROUP_ID = (select ID from SEC_GROUP where NAME = 'Руководитель департамента' and ID <> '9fa89a54-9ffa-11e1-b13e-9f4a54bff17e');

	update SEC_CONSTRAINT set GROUP_ID = '9fa89a54-9ffa-11e1-b13e-9f4a54bff17e'
	where GROUP_ID = (select ID from SEC_GROUP where NAME = 'Руководитель департамента' and ID <> '9fa89a54-9ffa-11e1-b13e-9f4a54bff17e');

	update SEC_SESSION_ATTR set GROUP_ID = '9fa89a54-9ffa-11e1-b13e-9f4a54bff17e'
	where GROUP_ID = (select ID from SEC_GROUP where NAME = 'Руководитель департамента' and ID <> '9fa89a54-9ffa-11e1-b13e-9f4a54bff17e');

	delete from SEC_GROUP where NAME = 'Руководитель департамента' and ID <> '9fa89a54-9ffa-11e1-b13e-9f4a54bff17e';
end if;

if not exists (select * from SEC_GROUP where ID = '8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb') and
       exists (select * from SEC_GROUP where NAME = 'Руководитель подразделения')
then
	insert into SEC_GROUP (select '8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb', create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, name, parent_id
	from SEC_GROUP where NAME = 'Руководитель подразделения');

	update SEC_GROUP set PARENT_ID = '8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb'
    where PARENT_ID = (select ID from SEC_GROUP where NAME = 'Руководитель подразделения' and ID <> '8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb');

	update SEC_GROUP_HIERARCHY set GROUP_ID = '8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb'
	where GROUP_ID = (select ID from SEC_GROUP where NAME = 'Руководитель подразделения' and ID <> '8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb');

	update SEC_GROUP_HIERARCHY set PARENT_ID = '8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb'
    	where PARENT_ID = (select ID from SEC_GROUP where NAME = 'Руководитель подразделения' and ID <> '8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb');

	update SEC_USER set GROUP_ID = '8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb'
	where GROUP_ID = (select ID from SEC_GROUP where NAME = 'Руководитель подразделения' and ID <> '8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb');

	update SEC_CONSTRAINT set GROUP_ID = '8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb'
	where GROUP_ID = (select ID from SEC_GROUP where NAME = 'Руководитель подразделения' and ID <> '8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb');

	update SEC_SESSION_ATTR set GROUP_ID = '8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb'
	where GROUP_ID = (select ID from SEC_GROUP where NAME = 'Руководитель подразделения' and ID <> '8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb');

	delete from SEC_GROUP where NAME = 'Руководитель подразделения' and ID <> '8d9ba07c-9ffa-11e1-b99d-8fc5b41c7fbb';
end if;
END;
$BODY$