--$Id: 130522-1305-addColumnToCardACL.sql 9895 2013-05-27 07:26:19Z kozyaikin $
--Description:
create or replace function insertAclColumn()
returns void
as $$
    BEGIN
        alter table  TS_CARD_ACL add DEPARTMENT_ID uuid;
    EXCEPTION
        WHEN duplicate_column THEN RAISE NOTICE 'column DEPARTMENT_ID already exists in TS_CARD_ACL.';
    END;
$$
LANGUAGE plpgsql^
select insertAclColumn()^
drop function insertAclColumn()^

create or replace function alterAclEntry()
returns void
as $$
    BEGIN
        alter table TS_CARD_ACL add constraint FK_TS_CARD_ACL_DF_DEPARTMENT foreign key (DEPARTMENT_ID) references DF_DEPARTMENT(correspondent_id);
    EXCEPTION
        WHEN duplicate_object THEN RAISE NOTICE 'foreign key FK_TS_CARD_ACL_DF_DEPARTMENT already exists in TS_CARD_ACL.';
    END;
$$
LANGUAGE plpgsql^
select alterAclEntry()^
drop function alterAclEntry()^

create or replace function insertIndexAclEntry()
returns void
as $$
    BEGIN
        create index IDX_TS_CARD_ACL_DF_DEPARTMENT on TS_CARD_ACL(DEPARTMENT_ID);
    EXCEPTION
        WHEN duplicate_table THEN RAISE NOTICE 'index IDX_TS_CARD_ACL_DF_DEPARTMENT already exists in TS_CARD_ACL.';
    END;
$$
LANGUAGE plpgsql^
select insertIndexAclEntry()^
drop function insertIndexAclEntry()^


