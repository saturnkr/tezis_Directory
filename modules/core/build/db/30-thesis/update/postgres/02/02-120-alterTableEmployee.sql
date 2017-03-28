-- $Id: 02-120-alterTableEmployee.sql 1474 2011-02-14 12:13:59Z novikov $
-- Description:

alter table DF_EMPLOYEE add column SEX boolean;

update DF_EMPLOYEE set SEX = true;