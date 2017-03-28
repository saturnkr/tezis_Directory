-- $Id$
-- Description:

create or replace function drop_has_task_group_task_if_exist() returns void as
$$
begin
    if not exists(select * from information_schema.columns
        where
            table_catalog = current_database() and table_schema = current_schema()
            and upper(table_name) = 'TM_TASK_GROUP_TASK' and upper(column_name) = 'OBSERVER_ID') THEN
            alter table TM_TASK_GROUP_TASK add column OBSERVER_ID UUID;
	end if;
end;
$$
language 'plpgsql';
^
select drop_has_task_group_task_if_exist();
^
drop function drop_has_task_group_task_if_exist();