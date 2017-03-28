-- $Id: 150728-1915-migrateInitAccessCardToBaseCardAcl.sql 20903 2015-07-29 07:04:13Z mishunin $
-- Description:

alter table TS_CARD_ACL add BASE_ACL_ID uniqueidentifier;
alter table TS_CARD_ACL add constraint FK_TS_CARD_ACL_BASE_CARD_ACL foreign key (BASE_ACL_ID) references TS_CARD_ACL(ID)^

update cardAcl set cardAcl.BASE_ACL_ID =
(select top(1) parentAcl.ID from TS_CARD_ACL parentAcl where cardAcl.INIT_ACCESS_CARD_ID = parentAcl.CARD_ID and cardAcl.USER_ID = parentAcl.USER_ID)
from TS_CARD_ACL cardAcl^

alter table TS_CARD_ACL drop constraint FK_TS_CARD_ACL_INIT_CARD_ID;
alter table TS_CARD_ACL drop column INIT_ACCESS_CARD_ID;