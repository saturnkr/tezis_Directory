-- $Id: 02-210-addRowsIntoSecPermission.sql 1695 2011-04-01 11:33:49Z ternovsky $
-- Description
INSERT INTO SEC_PERMISSION (ID, TYPE, TARGET, VALUE, ROLE_ID)
VALUES ('8758c060-5c4d-11e0-8696-33f82bb15aff', 40, 'cuba.gui.appFolder.global',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c')^
INSERT INTO SEC_PERMISSION (ID,  TYPE, TARGET, VALUE, ROLE_ID)
VALUES ('8f80f37a-5c4d-11e0-af0f-63f861b2275a', 40, 'cuba.gui.searchFolder.global',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c')^