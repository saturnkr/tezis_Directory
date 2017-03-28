--$Id: 140128-1440-addDefaultContractDocKindInConfig.sql 14689 2014-01-31 11:13:27Z chekashkin $
--$Description:

insert into SYS_CONFIG(id, create_ts, created_by, version, name, value) values
('ab123702-25db-11e3-92d7-c12ffa73b67a', current_timestamp, 'admin', 1, 'com.haulmont.thesis.core.config.defaultContractDocKind', 'df$DocKind-9cd678e3-7978-4f53-a503-a36bce3a76d6')^