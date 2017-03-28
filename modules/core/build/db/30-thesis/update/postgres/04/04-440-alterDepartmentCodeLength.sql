-- $Id: 04-440-alterDepartmentCodeLength.sql 8566 2013-03-21 09:34:05Z tsarevskiy $
-- Description:
ALTER TABLE df_department ALTER COLUMN code TYPE varchar(20);
