--$Id: 130701-refactorStandardImport.sql 13246 2013-11-14 11:42:44Z kudrenko $
--$Description: replace property DocKind with meta class name

 alter table DF_IMPORT_DATA_TYPE drop column if exists doc_type_id
 ^
 create or replace function add_meta_class_name_column() returns void as $_$
 begin
 if not exists (select * from information_schema.COLUMNS
                where
                    table_schema = 'public'
                and table_name = 'df_import_data_type'
                and column_name = 'meta_class_name'
                )
 then
 alter table DF_IMPORT_DATA_TYPE add column META_CLASS_NAME varchar(50);
 end if;
 end;
 $_$ language plpgsql
 ^
 select add_meta_class_name_column()
 ^
 update DF_IMPORT_DATA_TYPE set META_CLASS_NAME = 'df$SimpleDoc' where id = 'ff801f90-a389-11e2-a895-f7261fdb7f5a';

 update DF_IMPORT_DATA_TYPE set META_CLASS_NAME = 'df$Contract' where id = '33433e50-a38c-11e2-9506-a71c3d8f3fe2'
 ^
