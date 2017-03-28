-- $Id: 04-520-reindexDoc.sql 4959 2012-05-12 08:57:28Z zudin $

drop index if exists IDX_DF_DOC_DATE;
create index IDX_DF_DOC_DATE on DF_DOC(DATE)^

drop index if exists IDX_DF_DOC_DATETIME;
create index IDX_DF_DOC_DATETIME on DF_DOC(DATETIME)^

drop index if exists IDX_DF_DOC_REG_DATE;
create index IDX_DF_DOC_REG_DATE on DF_DOC(REG_DATE)^

drop index if exists IDX_DF_DOC_NUMBER;
create index IDX_DF_DOC_NUMBER on DF_DOC(NUMBER)^