--$Id$
--Description

if exists (select NAME from SYSINDEXES where NAME = 'IDX_DF_POSITION_UNIQUENESS') drop index DF_POSITION.IDX_DF_POSITION_UNIQUENESS^

if not exists(select * from sys.columns
            where Name = N'UPPER_NAME' and Object_ID = Object_ID(N'DF_POSITION'))
begin
  alter table DF_POSITION add UPPER_NAME AS (UPPER(NAME));
end^

create unique index IDX_DF_POSITION_UNIQUENESS on DF_POSITION (UPPER_NAME, DELETE_TS);