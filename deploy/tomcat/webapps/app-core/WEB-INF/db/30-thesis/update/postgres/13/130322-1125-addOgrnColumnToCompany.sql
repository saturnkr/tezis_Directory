--$Id: 130322-1125-addOgrnColumnToCompany.sql 9405 2013-04-26 13:48:30Z chekashkin $
--$Description: adds OGRN column to DF_COMPANY

create or replace function dropOgrnIfExists() returns void as
$$
begin
    if exists(select * from information_schema.columns
        where table_name = 'df_company' and column_name = 'ogrn') THEN
            alter table DF_COMPANY drop column OGRN;
	end if;
end;
$$
language 'plpgsql';
^
select dropOgrnIfExists();
^
alter table DF_COMPANY add OGRN varchar(13);
^
drop function dropOgrnIfExists();