-- $Id: 121214-1130-createCardAcl.sql 7483 2013-01-22 08:31:41Z pavlov $
-- Description:

create table TS_CARD_ACL (
    ID uniqueidentifier not null,
    CREATE_TS datetime,
    CREATED_BY varchar(50),
    CARD_ID uniqueidentifier,
    ENTITY varchar(100),
    USER_ID uniqueidentifier,
    CARD_ROLE_ID uniqueidentifier,
    ORGANIZATION_ID uniqueidentifier,
    GLOBAL tinyint,
    DESCRIPTION varchar(1000),
    primary key nonclustered (ID),
       constraint FK_TS_CARD_ACL_WF_CARD foreign key (CARD_ID) references WF_CARD(ID),
       constraint FK_TS_CARD_ACL_SEC_USER foreign key (USER_ID) references SEC_USER(ID),
       constraint FK_TS_CARD_ACL_WF_CARD_ROLE foreign key (CARD_ROLE_ID) references WF_CARD_ROLE(ID),
       constraint FK_TS_CARD_ACL_DF_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION(ID)
);

create clustered index IDX_TS_CARD_ACL_CREATE_TS on TS_CARD_ACL (CREATE_TS);
^

CREATE PROCEDURE insertAclEntry
AS
BEGIN
    DECLARE
		@rec CURSOR,
		@card_id uniqueidentifier,
		@user_id uniqueidentifier,
		@card_role_id uniqueidentifier,
		@card_role_name varchar(400),
		@substituted_creator_id uniqueidentifier,
		@creator_id uniqueidentifier;

	SET @rec = CURSOR SCROLL
    for select cr.user_id as user_id, cr.card_id as card_id, cr.id as card_role_id, pr.name as card_role_name
    from wf_card_role cr join wf_proc_role pr on pr.id = cr.proc_role_id
    where cr.user_id is not null and cr.delete_ts is null
    and not exists (select 1 from tm_task_pattern t where t.card_id = cr.card_id)
    and not exists (select 1 from df_doc d where d.card_id = cr.card_id and d.is_template = 1)
    OPEN @rec
    FETCH NEXT FROM @rec INTO @user_id, @card_id, @card_role_id, @card_role_name

    WHILE @@FETCH_STATUS = 0
	BEGIN
                insert into TS_CARD_ACL(id, create_ts, created_by, card_id, user_id, card_role_id, description)
                values(newid(), CURRENT_TIMESTAMP, USER, @card_id, @user_id, @card_role_id, @card_role_name);

		FETCH NEXT FROM @rec INTO @user_id, @card_id, @card_role_id, @card_role_name
	END
	CLOSE @rec;

	SELECT @card_id = null, @user_id = null, @card_role_id = null, @card_role_name = null, @substituted_creator_id = null, @creator_id  = null;


	SET @rec = CURSOR SCROLL
    for select c.substituted_creator_id as substituted_creator_id, c.creator_id as creator_id, c.id as card_id from wf_card c
    OPEN @rec
    FETCH NEXT FROM @rec INTO @substituted_creator_id, @creator_id, @card_id

    WHILE @@FETCH_STATUS = 0
	BEGIN
		if (@creator_id is not null)
		begin
			insert into TS_CARD_ACL (id, create_ts, created_by, card_id, user_id,  description)
			values(newid(), CURRENT_TIMESTAMP, USER, @card_id, @creator_id, 'Создатель');
        end;

        if (@substituted_creator_id is not null and @creator_id <> @substituted_creator_id)
		begin
			insert into TS_CARD_ACL (id, create_ts, created_by, card_id, user_id,  description)
			values(newid(), CURRENT_TIMESTAMP, USER, @card_id, @substituted_creator_id, 'Создатель');
        end;

		FETCH NEXT FROM @rec INTO @substituted_creator_id, @creator_id, @card_id
	END
	CLOSE @rec;

	SELECT @card_id = null, @user_id = null, @card_role_id = null, @card_role_name = null, @substituted_creator_id = null, @creator_id  = null;


	SET @rec = CURSOR SCROLL
    for select d.card_id from df_doc d where d.global = 1
    OPEN @rec
    FETCH NEXT FROM @rec INTO @card_id

    WHILE @@FETCH_STATUS = 0
	BEGIN
		insert into TS_CARD_ACL (id, create_ts, created_by, card_id, user_id,  global)
		values(newid(), CURRENT_TIMESTAMP, USER, @card_id, null, 1);

		FETCH NEXT FROM @rec INTO @card_id
	END
	CLOSE @rec;

	SELECT @card_id = null, @user_id = null, @card_role_id = null, @card_role_name = null, @substituted_creator_id = null, @creator_id  = null;


	SET @rec = CURSOR SCROLL
    for select d.card_id from tm_task_pattern d where d.global = 1
    OPEN @rec
    FETCH NEXT FROM @rec INTO @card_id

    WHILE @@FETCH_STATUS = 0
	BEGIN
		insert into TS_CARD_ACL (id, create_ts, created_by, card_id, user_id,  global)
		values(newid(), CURRENT_TIMESTAMP, USER, @card_id, null, 1);

		FETCH NEXT FROM @rec INTO @card_id
	END
	CLOSE @rec;

	SELECT @card_id = null, @user_id = null, @card_role_id = null, @card_role_name = null, @substituted_creator_id = null, @creator_id  = null;

END;

^
exec insertAclEntry;
^
drop procedure insertAclEntry;

create index IDX_TS_CARD_ACL_WF_CARD on TS_CARD_ACL(CARD_ID);
create index IDX_TS_CARD_ACL_SEC_USER on TS_CARD_ACL(USER_ID);
create index IDX_TS_CARD_ACL_WF_CARD_ROLE on TS_CARD_ACL(CARD_ROLE_ID);
create index IDX_TS_CARD_ACL_DF_ORGANIZATION on TS_CARD_ACL(ORGANIZATION_ID);
create index IDX_TS_CARD_ACL_GLOBAL on TS_CARD_ACL(GLOBAL);
^