-- $Id: 150728-1915-migrateInitAccessCardToBaseCardAcl.sql 20903 2015-07-29 07:04:13Z mishunin $
-- Description:

alter table TS_CARD_ACL add BASE_ACL_ID uuid;
alter table TS_CARD_ACL add constraint FK_TS_CARD_ACL_BASE_CARD_ACL foreign key (BASE_ACL_ID) references TS_CARD_ACL(ID);

update TS_CARD_ACL acl set BASE_ACL_ID = (select ID from TS_CARD_ACL parentAcl where acl.INIT_ACCESS_CARD_ID = parentAcl.CARD_ID and acl.USER_ID = parentAcl.USER_ID LIMIT 1);

alter table TS_CARD_ACL drop constraint FK_TS_CARD_ACL_INIT_CARD_ID;
alter table TS_CARD_ACL drop column INIT_ACCESS_CARD_ID;