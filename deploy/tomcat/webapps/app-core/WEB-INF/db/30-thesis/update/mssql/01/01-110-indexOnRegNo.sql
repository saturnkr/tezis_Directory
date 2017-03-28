--$Id$

if exists (select NAME from SYSINDEXES where NAME = 'DX_DF_DOC_REG_NO') drop index DF_DOC.DX_DF_DOC_REG_NO^

create index IDX_DF_DOC_REG_NO on DF_DOC(REG_NO);