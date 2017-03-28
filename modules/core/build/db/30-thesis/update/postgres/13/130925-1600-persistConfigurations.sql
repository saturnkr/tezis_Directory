--$Id: 130925-1600-persistConfigurations.sql 12865 2013-10-29 13:12:36Z saiyan $
--$Description : persists entity default values in database

--insert into SYS_CONFIG(id, create_ts, created_by, version, name, value) values
--('a64df96a-25d9-11e3-b75e-93ea4236d5e4', now(), 'admin', 1, 'com.haulmont.thesis.core.config.organizationDefault', 'df$Organization-a851beaf-6890-4ab2-b847-b7a810c4c2b9'),
--('0d8f9e98-25db-11e3-8c50-4f96a0994af2', now(), 'admin', 1, 'com.haulmont.thesis.core.config.currencyDefault', 'df$Currency-409bd4d2-cfa2-11e0-84b0-13f6ef08af82'),
--('150b663e-25db-11e3-9d36-e3b0db5c9947', now(), 'admin', 1, 'com.haulmont.thesis.core.config.priorityDefault', 'tm$Priority-2562cb31-0ebc-477b-a124-1cc618108be3'),
--('1dacf0be-25db-11e3-9db8-671686f3c707', now(), 'admin', 1, 'com.haulmont.thesis.core.config.taskTypeDefault', 'tm$TaskType-836d02a0-68a9-4aa5-b11a-08e9b32c589b'),
--('23dea3c4-25db-11e3-acc4-df8f5c432b46', now(), 'admin', 1, 'com.haulmont.thesis.core.config.incomeNumeratorDefault', 'df$Numerator-bebc21e2-fce0-40c6-9202-7cffff7cf88e'),
--('2b651a1a-25db-11e3-9ee7-bfa91abd62c7', now(), 'admin', 1, 'com.haulmont.thesis.core.config.outcomeNumeratorDefault', 'df$Numerator-5618547c-a4c9-4bfd-a71e-d884cf49df57'),
--('30654a26-25db-11e3-84a5-a391cca407b5', now(), 'admin', 1, 'com.haulmont.thesis.core.config.internalNumeratorDefault', 'df$Numerator-36708c7f-e232-4451-a239-3f5a8fa10726'),
--('35c57702-25db-11e3-92d7-c76ffa73b284', now(), 'admin', 1, 'com.haulmont.thesis.core.config.defaultDocKind', 'df$DocKind-c40ea551-d399-4a11-b6be-347ca5f27837')^

DO
$BODY$
BEGIN
------------------- Default organization ----------------------------------
if exists (select * from sys_config where name = 'docflow.organizationDefault' and value is not null and value <> '')
then
    insert into SYS_CONFIG(id, create_ts, created_by, version, name, value) values
    ('a64df96a-25d9-11e3-b75e-93ea4236d5e4', now(), 'admin', 1, 'com.haulmont.thesis.core.config.organizationDefault', 'df$Organization-' ||
     (select c.value from SYS_CONFIG c where c.name = 'docflow.organizationDefault')
    );
else
    insert into SYS_CONFIG(id, create_ts, created_by, version, name, value) values
    ('a64df96a-25d9-11e3-b75e-93ea4236d5e4', now(), 'admin', 1, 'com.haulmont.thesis.core.config.organizationDefault', 'df$Organization-a851beaf-6890-4ab2-b847-b7a810c4c2b9');
end if;
------------------ Default currency ---------------------------------------
if exists (select * from sys_config where name = 'docflow.currencyDefault' and value is not null and value <> '')
then
    insert into SYS_CONFIG(id, create_ts, created_by, version, name, value) values
    ('0d8f9e98-25db-11e3-8c50-4f96a0994af2', now(), 'admin', 1, 'com.haulmont.thesis.core.config.currencyDefault', 'df$Currency-' ||
     (select c.value from SYS_CONFIG c where c.name = 'docflow.currencyDefault')
    );
else
    insert into SYS_CONFIG(id, create_ts, created_by, version, name, value ) values
    ('0d8f9e98-25db-11e3-8c50-4f96a0994af2', now(), 'admin', 1, 'com.haulmont.thesis.core.config.currencyDefault', 'df$Currency-409bd4d2-cfa2-11e0-84b0-13f6ef08af82');
end if;
----------------- Default priority -------------------------------------------
if exists (select * from sys_config where name = 'taskman.priorityDefault' and value is not null and value <> '')
then
    insert into SYS_CONFIG(id, create_ts, created_by, version, name, value) values
    ('150b663e-25db-11e3-9d36-e3b0db5c9947', now(), 'admin', 1, 'com.haulmont.thesis.core.config.priorityDefault', 'tm$Priority-' ||
     (select c.value from SYS_CONFIG c where c.name = 'taskman.priorityDefault')
    );
else
    insert into SYS_CONFIG(id, create_ts, created_by, version, name, value) values
    ('150b663e-25db-11e3-9d36-e3b0db5c9947', now(), 'admin', 1, 'com.haulmont.thesis.core.config.priorityDefault', 'tm$Priority-2562cb31-0ebc-477b-a124-1cc618108be3');
end if;
--------------- Task type default ---------------------------------
if exists (select * from sys_config where name = 'taskman.taskTypeDefault' and value is not null and value <> '')
then
    insert into SYS_CONFIG(id, create_ts, created_by, version, name, value) values
    ('1dacf0be-25db-11e3-9db8-671686f3c707', now(), 'admin', 1, 'com.haulmont.thesis.core.config.taskTypeDefault', 'tm$TaskType-' ||
     (select c.value from SYS_CONFIG c where c.name = 'taskman.taskTypeDefault')
    );
else
    insert into SYS_CONFIG(id, create_ts, created_by, version, name, value) values
    ('1dacf0be-25db-11e3-9db8-671686f3c707', now(), 'admin', 1, 'com.haulmont.thesis.core.config.taskTypeDefault', 'tm$TaskType-836d02a0-68a9-4aa5-b11a-08e9b32c589b');
end if;
------------- Income numerator ----------------------------------------
if exists (select * from sys_config where name = 'taskman.incomeNumeratorDefault' and value is not null and value <> '')
then
    insert into SYS_CONFIG(id, create_ts, created_by, version, name, value) values
    ('23dea3c4-25db-11e3-acc4-df8f5c432b46', now(), 'admin', 1, 'com.haulmont.thesis.core.config.incomeNumeratorDefault', 'df$Numerator-' ||
     (select c.value from SYS_CONFIG c where c.name = 'taskman.incomeNumeratorDefault')
    );
else
    insert into SYS_CONFIG(id, create_ts, created_by, version, name, value) values
    ('23dea3c4-25db-11e3-acc4-df8f5c432b46', now(), 'admin', 1, 'com.haulmont.thesis.core.config.incomeNumeratorDefault', 'df$Numerator-bebc21e2-fce0-40c6-9202-7cffff7cf88e');
end if;
------------ Outcome numerator ----------------------------
if exists (select * from sys_config where name = 'taskman.outcomeNumeratorDefault' and value is not null and value <> '')
then
    insert into SYS_CONFIG(id, create_ts, created_by, version, name, value) values
    ('2b651a1a-25db-11e3-9ee7-bfa91abd62c7', now(), 'admin', 1, 'com.haulmont.thesis.core.config.outcomeNumeratorDefault', 'df$Numerator-' ||
     (select c.value from SYS_CONFIG c where c.name = 'taskman.outcomeNumeratorDefault')
    );
else
    insert into SYS_CONFIG(id, create_ts, created_by, version, name, value) values
    ('2b651a1a-25db-11e3-9ee7-bfa91abd62c7', now(), 'admin', 1, 'com.haulmont.thesis.core.config.outcomeNumeratorDefault', 'df$Numerator-5618547c-a4c9-4bfd-a71e-d884cf49df57');
end if;
------------ Internal numerator --------------------------------------
if exists (select * from sys_config where name = 'taskman.internalNumeratorDefault' and value is not null and value <> '')
then
    insert into SYS_CONFIG(id, create_ts, created_by, version, name, value) values
    ('30654a26-25db-11e3-84a5-a391cca407b5', now(), 'admin', 1, 'com.haulmont.thesis.core.config.internalNumeratorDefault', 'df$Numerator-' ||
     (select c.value from SYS_CONFIG c where c.name = 'taskman.internalNumeratorDefault')
    );
else
    insert into SYS_CONFIG(id, create_ts, created_by, version, name, value) values
    ('30654a26-25db-11e3-84a5-a391cca407b5', now(), 'admin', 1, 'com.haulmont.thesis.core.config.internalNumeratorDefault', 'df$Numerator-36708c7f-e232-4451-a239-3f5a8fa10726');
end if;
-------------- Default doc kind --------------------------------------------
if exists (select * from sys_config where name = 'taskman.defaultDocKind' and value is not null and value <> '')
then
    insert into SYS_CONFIG(id, create_ts, created_by, version, name, value) values
    ('35c57702-25db-11e3-92d7-c76ffa73b284', now(), 'admin', 1, 'com.haulmont.thesis.core.config.defaultDocKind', 'df$DocKind-' ||
     (select c.value from SYS_CONFIG c where c.name = 'taskman.defaultDocKind')
    );
else
    insert into SYS_CONFIG(id, create_ts, created_by, version, name, value) values
    ('35c57702-25db-11e3-92d7-c76ffa73b284', now(), 'admin', 1, 'com.haulmont.thesis.core.config.defaultDocKind', 'df$DocKind-c40ea551-d399-4a11-b6be-347ca5f27837');
end if;

END;
$BODY$
