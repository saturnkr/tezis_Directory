--$Id: 130511-1220-addDocKindTabName.sql 9565 2013-05-11 11:13:45Z saiyan $
--$Description : adds field Tab name to store user setting of additional fields tab name

alter table DF_DOC_KIND add TAB_NAME varchar(30)^

update DF_DOC_KIND set TAB_NAME = 'Доп. поля'^