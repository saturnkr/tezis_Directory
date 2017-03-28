-- $Id: 02-070-removeThemeNameSetting.sql 1104 2010-11-16 06:07:36Z pavlov $
-- Description: remove all theme name settings

delete from sec_user_setting where name = 'appWindowTheme';