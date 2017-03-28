-- $Id: 150522-addCodeToSysFilterByState.sql 20180 2015-05-25 09:42:59Z mishunin $
-- Description:

update sec_filter set code='SysFilter.ByProcRole' where name = 'По участию в процессе и состоянию';