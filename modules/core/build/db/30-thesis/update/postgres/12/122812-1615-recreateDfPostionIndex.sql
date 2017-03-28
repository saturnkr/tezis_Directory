--$Id$
--Description

create or replace function remove_duplicates() returns void
as
$$
declare
    rec record;
begin
    for rec in select id, first_value(id) OVER (PARTITION BY upper(name) ORDER BY create_ts desc) first_id from df_position
	where upper(name) IN (SELECT upper(name) FROM df_position GROUP BY upper(name)  HAVING count(name) > 1)
    loop
	if(rec.id <> rec.first_id) then
		update df_employee set position_id = rec.first_id where position_id = rec.id;
		delete from df_position where id = rec.id;
	end if;
    end loop;
end;
$$
LANGUAGE plpgsql^
select remove_duplicates();
^
drop function remove_duplicates();

drop index if exists IDX_DF_POSITION_UNIQUENESS;
create unique index IDX_DF_POSITION_UNIQUENESS on DF_POSITION (upper(NAME)) where DELETE_TS IS NULL^