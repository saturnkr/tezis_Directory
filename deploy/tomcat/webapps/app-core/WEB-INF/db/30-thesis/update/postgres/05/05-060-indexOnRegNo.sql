--$Id:$

drop index if exists IDX_DF_DOC_REG_NO^

create index IDX_DF_DOC_REG_NO on DF_DOC(REG_NO);