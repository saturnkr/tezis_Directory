-- $Id: 30-340-addColumnSexInEmployee.sql 2989 2011-10-22 08:09:48Z zudin $
-- Description:

alter table DF_EMPLOYEE add column SEX_NEW varchar(1);

update DF_EMPLOYEE set SEX_NEW = case when SEX is true then 'M' else 'F' end;

alter table DF_EMPLOYEE drop column SEX;

alter table DF_EMPLOYEE rename column SEX_NEW to SEX^