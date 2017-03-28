 -- $Id: 02-230-addRowIntoSecPermission.sql 11283 2013-08-12 09:34:32Z pavlov $
-- Description
DELETE FROM SEC_PERMISSION WHERE TARGET='report$Report.browse' AND TYPE=10 AND ROLE_ID='96fa7fe9-397d-4bac-b14a-eec2d94de68c'^

INSERT INTO SEC_PERMISSION (ID,  TYPE, TARGET, VALUE, ROLE_ID)
VALUES ('566e2541-b36b-4ea6-ad37-47b95a7381e2', 10, 'report$Report.browse',0,'96fa7fe9-397d-4bac-b14a-eec2d94de68c')^