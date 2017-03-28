DROP TABLE DF_IMPORT_DATA_ATTR;
DROP TABLE DF_IMPORT_DATA_TYPE;

create table DF_IMPORT_DATA_TYPE(
    ID uniqueidentifier,
    CREATE_TS datetime,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS datetime,
    UPDATED_BY varchar(50),
    DELETE_TS datetime,
    DELETED_BY varchar(50),
    NAME varchar(100),
    DOC_TYPE_ID uniqueidentifier,
    SCRIPT_FILE_ID uniqueidentifier,
    PATTERN_FILE_ID uniqueidentifier,
    primary key (ID)
);

alter table DF_IMPORT_DATA_TYPE add constraint FK_DF_IMPORT_DATA_TYPE_SCRIPT_FILE foreign key (SCRIPT_FILE_ID) references SYS_FILE (ID);
alter table DF_IMPORT_DATA_TYPE add constraint FK_DF_IMPORT_DATA_TYPE_PATTERN_FILE foreign key (PATTERN_FILE_ID) references SYS_FILE (ID);
alter table DF_IMPORT_DATA_TYPE add constraint FK_DF_IMPORT_DATA_TYPE_DOC_TYPE foreign key (DOC_TYPE_ID) references DF_DOC_TYPE (ID);

insert into DF_IMPORT_DATA_TYPE values ('ff801f90-a389-11e2-a895-f7261fdb7f5a', current_timestamp, 0, null, null, null, null, 'admin', 'Документ' , '1665ef30-2b44-11df-b1c6-bf8783a93da6', null, null);
insert into DF_IMPORT_DATA_TYPE values ('33433e50-a38c-11e2-9506-a71c3d8f3fe2', current_timestamp, 0, null, null, null, null, 'admin', 'Договор' , 'ae67f5f6-35aa-11df-a04a-3345dd531def', null, null);

create table DF_IMPORT_DATA_ATTR(
    ID uniqueidentifier,
    CREATE_TS datetime,
    CREATED_BY varchar(50),
    VERSION integer,
    UPDATE_TS datetime,
    UPDATED_BY varchar(50),
    DELETE_TS datetime,
    DELETED_BY varchar(50),
    IMPORT_DATA_TYPE_ID uniqueidentifier,
    CELL_NAME varchar(100),
    PROPERTY_NAME varchar(100),
    FIELD_TYPE varchar(100),
    primary key (ID)
);

alter table DF_IMPORT_DATA_ATTR add constraint FK_DF_IMPORT_DATA_ATTR_DATA_TYPE foreign key (IMPORT_DATA_TYPE_ID) references DF_IMPORT_DATA_TYPE(ID);

--------------------------------------------------------------------------------------------------

insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Категория', 'docCategory', 'df$Category');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Номер', 'number', 'String');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Вид', 'docKind', 'df$DocKind');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Подразделение', 'department', 'df$Department');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Куратор', 'owner', 'df$Employee');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Дата', 'date', 'Date');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Отправитель', 'sender', 'df$Company');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Рег.номер', 'regNo', 'String');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Адресат', 'docOfficeDataAddressees', 'df$Company');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Содержание', 'comment', 'String');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Дата регистрации', 'regDate', 'Date');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Канцелярский вид', 'docOfficeDocKind', 'DocOfficeDocKind');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', 'ff801f90-a389-11e2-a895-f7261fdb7f5a', 'Файлы', 'attachments', 'wf$CardAttachment');

---------------------------------------------------------------------------------------------------

insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Сумма', 'amount', 'BigDecimal');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Описание', 'comment', 'String');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Ставка, %', 'vatRate', 'BigDecimal');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Конт.лицо', 'contactPerson', 'df$ContactPerson');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Вид', 'docKind', 'df$DocKind');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Активный', 'active', 'Boolean');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Сумма НДС', 'vatAmount', 'BigDecimal');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'НДС в сумме', 'vatInclusive', 'Boolean');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Дата', 'date', 'Date');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Контрагент', 'contractor','df$Company');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Номер', 'number', 'String');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Подразделение', 'department', 'df$Department');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Организация', 'organization', 'df$Organization');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Условия платежа', 'paymentConditions', 'String');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Куратор', 'owner', 'df$Employee');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Начало обязательств', 'liabilityStart', 'Date');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Окончание обязательств', 'liabilityEnd', 'Date');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Канцелярский вид', 'docOfficeDocKind', 'DocOfficeDocKind');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Категория', 'docCategory', 'df$Category');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Файлы', 'attachments', 'wf$CardAttachment');
insert INTO df_import_data_attr(id, create_ts, created_by, import_data_type_id, cell_name, property_name, field_type)
values (newId(), current_timestamp, 'admin', '33433e50-a38c-11e2-9506-a71c3d8f3fe2', 'Валюта', 'currency', 'df$Currency');



exec create_or_update_sec_permission @r_name='Administrators', @p_target='df$ImportDataType.browse', @p_type=10, @p_value=1;
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='df$ImportDataType.browse', @p_type=10, @p_value=0;
