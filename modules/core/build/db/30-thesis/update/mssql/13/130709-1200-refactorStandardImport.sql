--$Id: 130709-1200-refactorStandardImport.sql 13325 2013-11-19 10:47:31Z saiyan $
--$Description: replace property DocKind with meta class name

if exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'DF_IMPORT_DATA_TYPE' and COLUMN_NAME = 'DOC_TYPE_ID')
BEGIN
if exists (SELECT * FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS WHERE CONSTRAINT_NAME ='FK_DF_IMPORT_DATA_TYPE_DOC_TYPE')
    BEGIN
        alter table DF_IMPORT_DATA_TYPE drop FK_DF_IMPORT_DATA_TYPE_DOC_TYPE ;
    END;
alter table DF_IMPORT_DATA_TYPE drop column doc_type_id;
END;

if not exists (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'DF_IMPORT_DATA_TYPE' and COLUMN_NAME = 'META_CLASS_NAME')
alter table DF_IMPORT_DATA_TYPE add META_CLASS_NAME varchar(50) ^

--- transaction was divided cause mysql doesn't support create column and column write in one transaction

update DF_IMPORT_DATA_TYPE set META_CLASS_NAME = 'df$SimpleDoc' where id = 'ff801f90-a389-11e2-a895-f7261fdb7f5a';

update DF_IMPORT_DATA_TYPE set META_CLASS_NAME = 'df$Contract' where id = '33433e50-a38c-11e2-9506-a71c3d8f3fe2'  ^



