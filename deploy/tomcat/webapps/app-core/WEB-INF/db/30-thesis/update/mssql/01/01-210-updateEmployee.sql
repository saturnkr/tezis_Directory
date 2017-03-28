--$Id: 01-210-updateEmployee.sql 7734 2013-02-07 12:31:00Z murzin $
--Description:
insert into DF_POSITION(ID,CREATE_TS,NAME,VERSION) select newId(),current_timestamp,pos.n,1 from (select max(position) n from df_employee where position is not null and ltrim(rtrim(position)) <> '' group by lower(position)) pos^

alter table DF_EMPLOYEE add POSITION_ID uniqueidentifier^
alter table DF_EMPLOYEE add constraint FK_DF_EMPLOYEE_DF_POSITION foreign key (POSITION_ID) references DF_POSITION(ID)^

update DF_EMPLOYEE set POSITION_ID=(select p.ID from DF_POSITION p where upper(p.NAME) = upper(POSITION))^
alter table DF_EMPLOYEE drop column POSITION^