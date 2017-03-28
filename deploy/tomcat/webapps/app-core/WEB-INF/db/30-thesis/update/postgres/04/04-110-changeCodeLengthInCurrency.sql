-- $Id: 04-110-changeCodeLengthInCurrency.sql 3144 2011-11-07 07:56:12Z chernov $
-- Description:

alter table DF_CURRENCY alter column CODE type varchar(10);