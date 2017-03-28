--$Id: 140801-1546-removeUnusableColumns.sql 16928 2014-08-01 12:38:17Z kozyaikin $

alter table DF_EMPLOYEE drop column TYPE;
alter table DF_CONTRACTOR drop column TYPE;