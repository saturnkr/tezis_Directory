--$Id: 130930-1517-addCorrespondentNameIndex.sql 12105 2013-09-30 11:41:53Z panasyuk $
--$Description:

create index IDX_DF_CORRESPONDENT on DF_CORRESPONDENT (NAME);