--$Id: 140926-1400-updateCardAclForeignKey.sql 18253 2014-12-09 10:59:24Z saiyan $



DO $$
begin
    if exists (SELECT
                   tc.constraint_name, tc.table_name, kcu.column_name,
                   ccu.table_name AS foreign_table_name,
                   ccu.column_name AS foreign_column_name
               FROM
                   information_schema.table_constraints AS tc
                   JOIN information_schema.key_column_usage AS kcu
                     ON tc.constraint_name = kcu.constraint_name
                   JOIN information_schema.constraint_column_usage AS ccu
                     ON ccu.constraint_name = tc.constraint_name
               WHERE upper(constraint_type) = 'FOREIGN KEY' AND upper(tc.table_name)='TS_CARD_ACL' and UPPER(tc.CONSTRAINT_NAME) = 'FK_TS_CARD_ACL_DF_DEPARTMENT')

               then

    alter table TS_CARD_ACL drop constraint FK_TS_CARD_ACL_DF_DEPARTMENT;

    end if;
end;
$$

^

alter table TS_CARD_ACL add constraint FK_TS_CARD_ACL_DF_DEPARTMENT foreign key (DEPARTMENT_ID) references DF_CORRESPONDENT(id)^