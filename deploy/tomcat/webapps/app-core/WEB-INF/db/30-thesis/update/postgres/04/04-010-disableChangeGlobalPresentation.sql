-- $Id: 04-010-disableChangeGlobalPresentation.sql 2946 2011-10-20 06:11:36Z pavlov $
-- Description:


INSERT INTO SEC_PERMISSION (ID,  TYPE, TARGET, VALUE, ROLE_ID)
VALUES ('ec19b976-fa65-11e0-92be-a345180a50f5', 40, 'cuba.gui.presentations.global',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c')^