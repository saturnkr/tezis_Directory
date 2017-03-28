create or replace function update_the_db() returns void as
$$
begin
    if not exists(select * from information_schema.columns
        where
            table_catalog = current_database() and table_schema = current_schema()
            and upper(table_name) = 'DF_DOC_OFFICE_DATA' and upper(column_name) = 'EMPLOYEE_EXECUTOR_ID') then
            alter table DF_DOC_OFFICE_DATA add EMPLOYEE_EXECUTOR_ID uuid;
            alter table DF_DOC_OFFICE_DATA add constraint FK_DF_DOC_OFFICE_DATA_EMPLOYEE_EXECUTOR foreign key (EMPLOYEE_EXECUTOR_ID) references DF_EMPLOYEE (CORRESPONDENT_ID);
    end if;
end;
$$
language 'plpgsql';
^
select update_the_db();
^
create or replace function update_the_db() returns void as
$$
begin
    if not exists(select * from information_schema.columns
        where
            table_catalog = current_database() and table_schema = current_schema()
            and upper(table_name) = 'DF_DOC_OFFICE_DATA' and upper(column_name) = 'EMPLOYEE_SIGNED_BY_ID') then
            alter table DF_DOC_OFFICE_DATA add EMPLOYEE_SIGNED_BY_ID uuid;
            alter table DF_DOC_OFFICE_DATA add constraint FK_DF_DOC_OFFICE_DATA_EMPLOYEE_SIGNED_BY foreign key (EMPLOYEE_SIGNED_BY_ID) references DF_EMPLOYEE (CORRESPONDENT_ID);
    end if;
end;
$$
language 'plpgsql';
^
select update_the_db();
^
drop function update_the_db();
