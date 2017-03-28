-- $Id: 131031-1355-clearDocRegDateFix.sql 12925 2013-10-31 10:09:26Z zudin $
-- Description:

update DF_DOC set REG_DATE = null where REGISTERED = 'false' and (REG_NO = '' or REG_NO is null);