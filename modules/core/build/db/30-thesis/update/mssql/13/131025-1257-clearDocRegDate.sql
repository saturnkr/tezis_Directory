-- $Id: 131025-1257-clearDocRegDate.sql 12780 2013-10-25 09:43:32Z zudin $
-- Description:

update DF_DOC set REG_DATE = null where REGISTERED = 0 and REG_NO is null;