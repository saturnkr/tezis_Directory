--$Id: 130322-1125-addOgrnColumnToCompany.sql 9344 2013-04-24 12:11:35Z chekashkin $
--$Description: adds OGRN column to DF_COMPANY

if exists(select * from sys.columns
            where Name = N'OGRN' and Object_ID = Object_ID(N'DF_COMPANY'))
begin
  alter table DF_COMPANY drop column OGRN;
end ^
alter table DF_COMPANY add OGRN varchar(13);