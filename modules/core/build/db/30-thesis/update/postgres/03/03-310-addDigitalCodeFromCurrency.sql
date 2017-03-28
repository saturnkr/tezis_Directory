-- $Id:
-- Description:

alter table DF_CURRENCY add column DIGITAL_CODE varchar(3);

update DF_CURRENCY set DIGITAL_CODE='643' where CODE='RUB'^