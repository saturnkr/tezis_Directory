-- $Id: 150703-1720-renameCardAclColumnTypeToCode.sql 20636 2015-07-07 11:03:26Z mishunin $
-- Description:

alter table ts_card_acl rename column type TO code;