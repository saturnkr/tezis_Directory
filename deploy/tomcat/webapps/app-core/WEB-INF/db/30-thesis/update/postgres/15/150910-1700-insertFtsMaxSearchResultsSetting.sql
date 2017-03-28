--$Id: 150910-1700-insertFtsMaxSearchResultsSetting.sql 21622 2015-09-10 13:48:07Z gaslov $

insert into sys_config select newid(), now(), 'system', 1, null, null, 'cuba.fts.maxSearchResults', '10000'
where not exists (select 1 from sys_config where name = 'cuba.fts.maxSearchResults')