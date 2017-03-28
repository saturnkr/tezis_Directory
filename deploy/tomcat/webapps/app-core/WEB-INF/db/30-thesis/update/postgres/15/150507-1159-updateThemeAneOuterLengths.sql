-- $Id: 150507-1159-updateThemeAneOuterLengths.sql 20361 2015-06-15 07:51:15Z kozyaikin $
-- Description:
alter table DF_DOC alter column THEME type varchar(650);
alter table DF_MEETING_PARTICIPANT alter column OUTER_ type varchar(10000);