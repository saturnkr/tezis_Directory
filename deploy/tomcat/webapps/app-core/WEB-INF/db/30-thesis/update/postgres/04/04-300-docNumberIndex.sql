-- $Id: 04-300-docNumberIndex.sql 3818 2012-01-31 14:29:41Z gorbunkov $
drop index if exists IDX_DF_DOC_NUMBER;
create index IDX_DF_DOC_NUMBER on DF_DOC(NUMBER);