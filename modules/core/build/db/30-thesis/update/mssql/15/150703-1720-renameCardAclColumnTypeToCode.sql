-- $Id: 150703-1720-renameCardAclColumnTypeToCode.sql 20627 2015-07-06 09:41:19Z mishunin $
-- Description:

exec sp_rename 'TS_CARD_ACL.TYPE', 'CODE', 'COLUMN';