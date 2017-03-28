--$Id: 05-160-updateEmployee.sql 8577 2013-03-21 12:38:59Z panasyuk $
--Description:
insert into DF_POSITION(ID,CREATE_TS,NAME,VERSION) select newId(),now(),pos.n,1 from (select max(regexp_replace(trim(position), '[[:space:]]+', ' ', 'g'))n from df_employee where position is not null and trim(position) <> '' group by lower(regexp_replace(trim(position), '[[:space:]]+', ' ', 'g'))) pos^

alter table DF_EMPLOYEE add POSITION_ID uuid^
alter table DF_EMPLOYEE add constraint FK_DF_EMPLOYEE_DF_POSITION foreign key (POSITION_ID) references DF_POSITION(ID)^

update DF_EMPLOYEE e set POSITION_ID=(select p.ID from DF_POSITION p where upper(p.NAME) = upper(regexp_replace(trim(e.position), '[[:space:]]+', ' ', 'g')))^
alter table DF_EMPLOYEE drop column POSITION^