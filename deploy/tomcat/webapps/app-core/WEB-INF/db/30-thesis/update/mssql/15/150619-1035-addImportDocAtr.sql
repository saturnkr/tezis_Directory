-- $Id: 150619-1035-addImportDocAtr.sql 20428 2015-06-19 06:45:07Z timokhov $
-- Description:
insert INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type) values
(newId(), current_timestamp, 'admin', 1, 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Тема', 'theme', 'String');
insert INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type) values
(newId(), current_timestamp, 'admin', 1, 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Основание для приказа', 'orderCause', 'String');
insert INTO df_import_data_attr(id, create_ts, created_by, version, import_data_type_id, cell_name, property_name, field_type) values
(newId(), current_timestamp, 'admin', 1, 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Текст приказа', 'orderText', 'String');