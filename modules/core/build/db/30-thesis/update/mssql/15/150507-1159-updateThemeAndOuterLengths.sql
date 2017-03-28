-- $Id: 150507-1159-updateThemeAndOuterLengths.sql 20367 2015-06-15 10:27:49Z kozyaikin $
-- Description:
alter table DF_DOC alter column THEME varchar(650);
alter table DF_MEETING_PARTICIPANT alter column OUTER_ varchar(max);