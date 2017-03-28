-- $Id: 121214-1130-createCardAcl.sql 7483 2013-01-22 08:31:41Z pavlov $
-- Description:

create table TS_CARD_ACL (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    CARD_ID uuid,
    ENTITY varchar(100),
    USER_ID uuid,
    CARD_ROLE_ID uuid,
    ORGANIZATION_ID uuid,
    GLOBAL boolean,
    DESCRIPTION varchar(1000),
    primary key (ID)
);

alter table TS_CARD_ACL add constraint FK_TS_CARD_ACL_WF_CARD foreign key (CARD_ID) references WF_CARD(ID);
alter table TS_CARD_ACL add constraint FK_TS_CARD_ACL_SEC_USER foreign key (USER_ID) references SEC_USER(ID);
alter table TS_CARD_ACL add constraint FK_TS_CARD_ACL_WF_CARD_ROLE foreign key (CARD_ROLE_ID) references WF_CARD_ROLE(ID);
alter table TS_CARD_ACL add constraint FK_TS_CARD_ACL_DF_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION(ID);


create or replace function insertAclEntry()
returns void
as $$
declare
    rec record;
    cardId uuid;
begin
    for rec in select cr.user_id as user_id, cr.card_id as card_id, cr.id as card_role_id, pr.name as card_role_name
    from wf_card_role cr join wf_proc_role pr on pr.id = cr.proc_role_id where cr.user_id is not null and cr.delete_ts is null
    and not exists (select 1 from tm_task_pattern t where t.card_id = cr.card_id)
    and not exists (select 1 from df_doc d where d.card_id = cr.card_id and d.is_template = true)
    loop
        insert into TS_CARD_ACL (id, create_ts, created_by, card_id, user_id, card_role_id, description) values(newid(), now(), USER, rec.card_id, rec.user_id, rec.card_role_id, rec.card_role_name);
    end loop;

    for rec in select c.substituted_creator_id as substituted_creator_id, c.creator_id as creator_id, c.id as card_id from wf_card c
    loop
        if (rec.substituted_creator_id <> rec.creator_id and rec.creator_id is not null) then
          insert into TS_CARD_ACL (id, create_ts, created_by, card_id, user_id, description) values(newid(), now(), USER, rec.card_id, rec.creator_id, 'Создатель');
        end if;
        insert into TS_CARD_ACL (id, create_ts, created_by, card_id, user_id, description) values(newid(), now(), USER, rec.card_id, rec.substituted_creator_id, 'Создатель');
    end loop;

    for cardId in select d.card_id from df_doc d where d.global = true
    loop
        insert into TS_CARD_ACL (id, create_ts, created_by, card_id, GLOBAL) values(newid(), now(), USER, cardId, true );
    end loop;

    for cardId in select d.card_id from tm_task_pattern d where d.global = true
    loop
        insert into TS_CARD_ACL (id, create_ts, created_by, card_id, GLOBAL) values(newid(), now(), USER, cardId, true );
    end loop;
end;
$$
LANGUAGE plpgsql^
select insertAclEntry();
^
drop function insertAclEntry();

create index IDX_TS_CARD_ACL_WF_CARD on TS_CARD_ACL(CARD_ID);
create index IDX_TS_CARD_ACL_SEC_USER on TS_CARD_ACL(USER_ID);
create index IDX_TS_CARD_ACL_WF_CARD_ROLE on TS_CARD_ACL(CARD_ROLE_ID);
create index IDX_TS_CARD_ACL_DF_ORGANIZATION on TS_CARD_ACL(ORGANIZATION_ID);
create index IDX_TS_CARD_ACL_GLOBAL on TS_CARD_ACL(GLOBAL) where GLOBAL = true;
^