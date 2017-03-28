-- $Id$
-- Description:

create or replace function drop_has_attachment_if_exist() returns void as
$$
begin
    if not exists(select * from information_schema.columns
        where
            table_catalog = current_database() and table_schema = current_schema()
            and upper(table_name) = 'DF_EMPLOYEE' and upper(column_name) = 'HAS_ATTACHMENTS') THEN
            alter table DF_EMPLOYEE add column HAS_ATTACHMENTS boolean;
			if exists(select * from information_schema.columns
				where
					table_catalog = current_database() and table_schema = current_schema()
					and upper(table_name) = 'DF_CORRESPONDENT' and upper(column_name) = 'HAS_ATTACHMENTS') THEN
					update DF_EMPLOYEE set HAS_ATTACHMENTS = true where CORRESPONDENT_ID in
					(select ID from DF_CORRESPONDENT where HAS_ATTACHMENTS is true);
			end if;
	end if;
end;
$$
language 'plpgsql';
^
select drop_has_attachment_if_exist();
^
drop function drop_has_attachment_if_exist();

update DF_EMPLOYEE SET has_attachments = false where has_attachments is null;
update df_organization SET has_attachments = false where has_attachments is null^