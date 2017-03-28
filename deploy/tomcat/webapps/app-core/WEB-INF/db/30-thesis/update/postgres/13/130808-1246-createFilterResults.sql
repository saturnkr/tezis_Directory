-- $Id: 130808-1246-createFilterResults.sql 11640 2013-09-03 13:50:18Z zudin $
-- Description

create sequence TS_FILTER_RESULT_SEQ;

create table TS_FILTER_RESULT (
    ID bigint not null default nextval('TS_FILTER_RESULT_SEQ'),
	SESSION_ID uuid not null,
	FILTER_KEY integer not null,
	ENTITY_ID uuid not null,
	primary key (ID)
);

create index IDX_TS_FILTER_RESULT_ENTITY_FIELD_NAME_SESSION_KEY on TS_FILTER_RESULT (ENTITY_ID, SESSION_ID, FILTER_KEY);

create index IDX_TS_FILTER_RESULT_SESSION_KEY on TS_FILTER_RESULT (SESSION_ID, FILTER_KEY);
