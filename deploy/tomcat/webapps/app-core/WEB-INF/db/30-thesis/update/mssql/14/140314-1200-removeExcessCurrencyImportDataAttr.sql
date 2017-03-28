--$Id: 140314-1200-removeExcessCurrencyImportDataAttr.sql 15339 2014-03-14 07:17:35Z saiyan $
--$Description: removes duplicate currency import data attr

delete from df_import_data_attr where import_data_type_id = '33433e50-a38c-11e2-9506-a71c3d8f3fe2' and property_name = 'currency';

insert into df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', 1, '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Валюта', 'currency', 'df$Currency');