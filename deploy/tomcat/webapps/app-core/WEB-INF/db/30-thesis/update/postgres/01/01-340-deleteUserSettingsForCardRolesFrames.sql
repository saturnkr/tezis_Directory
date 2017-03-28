-- $Id: 01-340-deleteUserSettingsForCardRolesFrames.sql 563 2010-08-10 08:28:42Z pavlov $
-- Description: delete user settings for card roles frame

delete from sec_user_setting  where value like '%cardRolesFrame.rolesTable%';