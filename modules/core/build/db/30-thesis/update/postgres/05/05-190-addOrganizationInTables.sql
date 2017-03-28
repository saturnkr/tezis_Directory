-- $Id: 05-190-addOrganizationInTables.sql 12781 2013-10-25 09:55:02Z saiyan $
-- Description:


alter table DF_TYPICAL_RESOLUTION add ORGANIZATION_ID uuid^
alter table TM_START_TASK_SCHEDULE_ACTION add ORGANIZATION_ID uuid^
alter table DF_OFFICE_FILE add ORGANIZATION_ID uuid^
alter table DF_CATEGORY add ORGANIZATION_ID uuid^
alter table TM_TASK_VERSION add ORGANIZATION_ID uuid^
alter table TM_TASK_PATTERN add ORGANIZATION_ID uuid^
alter table TM_TASK_PATTERN_GROUP add ORGANIZATION_ID uuid^
alter table TM_TASK add ORGANIZATION_ID uuid^
alter table TM_PROJECT add ORGANIZATION_ID uuid^
alter table TM_PROJECT_GROUP add ORGANIZATION_ID uuid^
alter table TM_TASK_GROUP add ORGANIZATION_ID uuid^

create or replace function add_organization_column_to_user() returns void as $_$
BEGIN
IF NOT EXISTS (select * from information_schema.COLUMNS
               where
               	    table_schema = 'public'
               and	table_name = 'sec_user'
               and	column_name = 'organization_id')
THEN
alter table SEC_USER add ORGANIZATION_ID uuid ;
alter table SEC_USER add constraint FK_SEC_USER_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID);
END IF;

END;
$_$ LANGUAGE plpgsql^

select add_organization_column_to_user()^
drop function add_organization_column_to_user()^


alter table WF_USER_GROUP add ORGANIZATION_ID uuid^

alter table DF_CATEGORY add constraint FK_DF_CATEGORY_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
alter table DF_OFFICE_FILE add constraint FK_DF_OFFICE_FILE_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
alter table DF_TYPICAL_RESOLUTION add constraint FK_DF_TYPICAL_RESOLUTION_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
alter table TM_PROJECT add constraint FK_TM_PROJECT_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
alter table TM_PROJECT_GROUP add constraint FK_TM_PROJECT_GROUP_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
alter table TM_START_TASK_SCHEDULE_ACTION add constraint FK_TM_START_TASK_SCHEDULE_ACTION_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
alter table TM_TASK add constraint FK_TM_TASK_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
alter table TM_TASK_PATTERN add constraint FK_TM_TASK_PATTERN_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
alter table TM_TASK_VERSION add constraint FK_TM_TASK_VERSION_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
alter table TM_TASK_GROUP add constraint FK_TM_TASK_GROUP_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
alter table TM_TASK_PATTERN_GROUP add constraint FK_TM_TASK_PATTERN_GROUP_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
alter table WF_USER_GROUP add constraint FK_WF_USER_GROUP_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^


update DF_CATEGORY t set ORGANIZATION_ID =
(select o.id from DF_ORGANIZATION o where o.id in
	(select c.ORGANIZATION_ID from DF_CORRESPONDENT c where c.TYPE = 'E' and  c.id in
		(select e.CORRESPONDENT_ID from DF_EMPLOYEE e where e.USER_ID in
			(select u.ID from SEC_USER u where u.LOGIN_LC = t.CREATED_BY
			)
		)
	)
)
where
ORGANIZATION_ID is null^

update TM_PROJECT t set ORGANIZATION_ID =
(select o.id from DF_ORGANIZATION o where o.id in
	(select c.ORGANIZATION_ID from DF_CORRESPONDENT c where c.TYPE = 'E' and  c.id in
		(select e.CORRESPONDENT_ID from DF_EMPLOYEE e where e.USER_ID in
			(select u.ID from SEC_USER u where u.LOGIN_LC = t.CREATED_BY
			)
		)
	)
)
where
ORGANIZATION_ID is null^

update TM_PROJECT_GROUP t set ORGANIZATION_ID =
(select o.id from DF_ORGANIZATION o where o.id in
	(select c.ORGANIZATION_ID from DF_CORRESPONDENT c where c.TYPE = 'D' and  c.id in
		(select e.DEPARTMENT_ID from DF_EMPLOYEE e where e.USER_ID in
			(select u.ID from SEC_USER u where u.LOGIN_LC = t.CREATED_BY
			)
		)
	)
)
where
ORGANIZATION_ID is null^


update TM_TASK t set ORGANIZATION_ID =
(select o.id from DF_ORGANIZATION o where o.id in
	(select c.ORGANIZATION_ID from DF_CORRESPONDENT c where c.TYPE = 'D' and  c.id in
		(select e.DEPARTMENT_ID from DF_EMPLOYEE e where e.USER_ID in
			(select u.ID from SEC_USER u where u.LOGIN_LC in (select cr.created_by from wf_card cr where cr.id = t.card_id)
			)
		)
	)
)
where
ORGANIZATION_ID is null^


update TM_TASK_PATTERN t set ORGANIZATION_ID =
(select o.id from DF_ORGANIZATION o where o.id in
	(select c.ORGANIZATION_ID from DF_CORRESPONDENT c where c.TYPE = 'D' and  c.id in
		(select e.DEPARTMENT_ID from DF_EMPLOYEE e where e.USER_ID in
			(select u.ID from SEC_USER u where u.LOGIN_LC in (select cr.created_by from wf_card cr where cr.id = t.card_id)
			)
		)
	)
)
where
ORGANIZATION_ID is null^

update TM_TASK_GROUP t set ORGANIZATION_ID =
(select o.id from DF_ORGANIZATION o where o.id in
	(select c.ORGANIZATION_ID from DF_CORRESPONDENT c where c.TYPE = 'D' and  c.id in
		(select e.DEPARTMENT_ID from DF_EMPLOYEE e where e.USER_ID in
			(select u.ID from SEC_USER u where u.LOGIN_LC = t.CREATED_BY
			)
		)
	)
)
where
ORGANIZATION_ID is null^

update TM_TASK_PATTERN_GROUP t set ORGANIZATION_ID =
(select o.id from DF_ORGANIZATION o where o.id in
	(select c.ORGANIZATION_ID from DF_CORRESPONDENT c where c.TYPE = 'D' and  c.id in
		(select e.DEPARTMENT_ID from DF_EMPLOYEE e where e.USER_ID in
			(select u.ID from SEC_USER u where u.LOGIN_LC = t.CREATED_BY
			)
		)
	)
)
where
ORGANIZATION_ID is null^

update SEC_USER u set ORGANIZATION_ID =
(select c.ORGANIZATION_ID from DF_CORRESPONDENT c where c.TYPE = 'D' and  c.id in
	(select e.DEPARTMENT_ID from DF_EMPLOYEE e where e.USER_ID = u.ID
	)
)

where
ORGANIZATION_ID is null^

update WF_USER_GROUP t set ORGANIZATION_ID =
(select o.id from DF_ORGANIZATION o where o.id in
	(select c.ORGANIZATION_ID from DF_CORRESPONDENT c where c.TYPE = 'D' and  c.id in
		(select e.DEPARTMENT_ID from DF_EMPLOYEE e where e.USER_ID in
			(select u.ID from SEC_USER u where u.LOGIN_LC = t.CREATED_BY
			)
		)
	)
)
where
ORGANIZATION_ID is null^

update DF_CORRESPONDENT t set ORGANIZATION_ID =
(select o.id from DF_ORGANIZATION o where o.id in
	(select c.ORGANIZATION_ID from DF_CORRESPONDENT c where c.TYPE = 'D' and  c.id in
		(select e.DEPARTMENT_ID from DF_EMPLOYEE e where e.USER_ID in
			(select u.ID from SEC_USER u where u.LOGIN_LC = t.CREATED_BY
			)
		)
	)
)
where
type in ('R', 'C', 'I') and ORGANIZATION_ID is null^

update DF_OFFICE_FILE t set ORGANIZATION_ID =
(select o.id from DF_ORGANIZATION o where o.id in
	(select c.ORGANIZATION_ID from DF_CORRESPONDENT c where c.TYPE = 'D' and  c.id in
		(select e.DEPARTMENT_ID from DF_EMPLOYEE e where e.USER_ID in
			(select u.ID from SEC_USER u where (u.id = t.SUBSTITUTED_CREATOR_ID and t.SUBSTITUTED_CREATOR_ID is not null or t.SUBSTITUTED_CREATOR_ID is null and u.LOGIN_LC = t.CREATED_BY)
			)
		)
	)
)
where ORGANIZATION_ID is null^

update DF_OFFICE_FILE_NOMENCLATURE t set ORGANIZATION_ID =
(select o.id from DF_ORGANIZATION o where o.id in
	(select c.ORGANIZATION_ID from DF_CORRESPONDENT c where c.TYPE = 'D' and  c.id in
		(select e.DEPARTMENT_ID from DF_EMPLOYEE e where e.USER_ID in
			(select u.ID from SEC_USER u where (u.id = t.SUBSTITUTED_CREATOR_ID and t.SUBSTITUTED_CREATOR_ID is not null or t.SUBSTITUTED_CREATOR_ID is null and u.LOGIN_LC = t.CREATED_BY)
			)
		)
	)
)
where ORGANIZATION_ID is null^

update DF_TYPICAL_RESOLUTION t set ORGANIZATION_ID =
(select o.id from DF_ORGANIZATION o where o.id in
	(select c.ORGANIZATION_ID from DF_CORRESPONDENT c where c.TYPE = 'D' and  c.id in
		(select e.DEPARTMENT_ID from DF_EMPLOYEE e where e.USER_ID in
			(select u.ID from SEC_USER u where (u.id = t.SUBSTITUTED_CREATOR_ID and t.SUBSTITUTED_CREATOR_ID is not null or t.SUBSTITUTED_CREATOR_ID is null and u.LOGIN_LC = t.CREATED_BY)
			)
		)
	)
)
where ORGANIZATION_ID is null^

update DF_DOC t set ORGANIZATION_ID =
(select o.id from DF_ORGANIZATION o where o.id in
	(select c.ORGANIZATION_ID from DF_CORRESPONDENT c where c.TYPE = 'D' and  c.id in
		(select e.DEPARTMENT_ID from DF_EMPLOYEE e where e.USER_ID in
			(select u.ID from SEC_USER u where u.ID in
				(select d.SUBSTITUTED_CREATOR_ID from wf_card d where d.id = t.CARD_ID
				)
			)
		)
	)
)
where ORGANIZATION_ID is null^


select create_or_update_sec_permission('SimpleUser', 'df$Organization.browse', 10, 0)^
select create_or_update_sec_permission('Administrators', 'df$Organization.browse', 10, 1)^

