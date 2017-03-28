--$Id: 130516-fixOfficeFileUniqueIndex.sql 13334 2013-11-19 16:13:16Z saiyan $
--$Description: fixes idx_df_office_file_uniq in postgres database. tx ilya chekashkin for building this script.

create or replace function remove_duplicates() returns void
as
$$
declare
    rec record;
begin
    for rec in
        select ID, first_value(ID) OVER (PARTITION BY (office_file_nomenclature_id, volume_no) ORDER BY create_ts desc) first_id
        from df_office_file
        where (office_file_nomenclature_id, volume_no) IN
            (SELECT office_file_nomenclature_id, volume_no
             FROM df_office_file GROUP BY office_file_nomenclature_id, volume_no HAVING count(*) > 1)
             and DELETE_TS is null
    loop
        if(rec.id <> rec.first_id) then
        update df_doc_office_data set office_file_id = rec.first_id where office_file_id = rec.id;
        update df_office_file set DELETE_TS = now(), DELETED_BY = 'system' where id = rec.id;
        end if;
    end loop;
end;
$$
LANGUAGE plpgsql
^
select remove_duplicates()
^

drop function remove_duplicates();

drop index if exists idx_df_office_file_uniq;
create unique index idx_df_office_file_uniq on DF_OFFICE_FILE (VOLUME_NO, OFFICE_FILE_NOMENCLATURE_ID) where DELETE_TS is null^