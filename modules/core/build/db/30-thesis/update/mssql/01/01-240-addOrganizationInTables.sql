-- $Id: 01-240-addOrganizationInTables.sql 13411 2013-11-22 11:36:12Z tsarevskiy $
-- Description:

alter table DF_TYPICAL_RESOLUTION add ORGANIZATION_ID uniqueidentifier^
alter table TM_START_TASK_SCHEDULE_ACTION add ORGANIZATION_ID uniqueidentifier^
alter table DF_OFFICE_FILE add ORGANIZATION_ID uniqueidentifier^
alter table DF_CATEGORY add ORGANIZATION_ID uniqueidentifier^
alter table TM_TASK_VERSION add ORGANIZATION_ID uniqueidentifier^
alter table TM_TASK_PATTERN add ORGANIZATION_ID uniqueidentifier^
alter table TM_TASK_PATTERN_GROUP add ORGANIZATION_ID uniqueidentifier^
alter table TM_TASK add ORGANIZATION_ID uniqueidentifier^
alter table TM_PROJECT add ORGANIZATION_ID uniqueidentifier^
alter table TM_PROJECT_GROUP add ORGANIZATION_ID uniqueidentifier^
alter table TM_TASK_GROUP add ORGANIZATION_ID uniqueidentifier^

if not exists(select * from sys.columns
            where Name = N'ORGANIZATION_ID' and Object_ID = Object_ID(N'SEC_USER'))
begin
  alter table SEC_USER add ORGANIZATION_ID uniqueidentifier;
  alter table SEC_USER add constraint FK_SEC_USER_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID);
end^

alter table WF_USER_GROUP add ORGANIZATION_ID uniqueidentifier^

alter table DF_CATEGORY add constraint FK_DF_CATEGORY_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
create index IDX_DF_CATEGORY_ORGANIZATION on DF_CATEGORY (ORGANIZATION_ID)^
alter table DF_OFFICE_FILE add constraint FK_DF_OFFICE_FILE_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
create index IDX_DF_OFFICE_FILE_ORGANIZATION on DF_OFFICE_FILE (ORGANIZATION_ID)^
alter table DF_TYPICAL_RESOLUTION add constraint FK_DF_TYPICAL_RESOLUTION_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
create index IDX_DF_TYPICAL_RESOLUTION_ORGANIZATION on DF_TYPICAL_RESOLUTION (ORGANIZATION_ID)^
alter table TM_PROJECT add constraint FK_TM_PROJECT_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
create index IDX_TM_PROJECT_ORGANIZATION on TM_PROJECT (ORGANIZATION_ID)^
alter table TM_PROJECT_GROUP add constraint FK_TM_PROJECT_GROUP_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
create index IDX_TM_PROJECT_GROUP_ORGANIZATION on TM_PROJECT_GROUP (ORGANIZATION_ID)^
alter table TM_START_TASK_SCHEDULE_ACTION add constraint FK_TM_START_TASK_SCHEDULE_ACTION_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
create index IDX_TM_START_TASK_SCHEDULE_ACTION_ORGANIZATION on TM_START_TASK_SCHEDULE_ACTION (ORGANIZATION_ID)^
alter table TM_TASK add constraint FK_TM_TASK_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
create index IDX_TM_TASK_ORGANIZATION on TM_TASK (ORGANIZATION_ID)^
alter table TM_TASK_PATTERN add constraint FK_TM_TASK_PATTERN_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
create index IDX_TM_TASK_PATTERN_ORGANIZATION on TM_TASK_PATTERN (ORGANIZATION_ID)^
alter table TM_TASK_VERSION add constraint FK_TM_TASK_VERSION_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
create index IDX_TM_TASK_VERSION_ORGANIZATION on TM_TASK_VERSION (ORGANIZATION_ID)^
alter table TM_TASK_GROUP add constraint FK_TM_TASK_GROUP_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
create index IDX_TM_TASK_GROUP_ORGANIZATION on TM_TASK_GROUP (ORGANIZATION_ID)^
alter table TM_TASK_PATTERN_GROUP add constraint FK_TM_TASK_PATTERN_GROUP_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
create index IDX_TM_TASK_PATTERN_GROUP_ORGANIZATION on TM_TASK_PATTERN_GROUP (ORGANIZATION_ID)^
create index IDX_SEC_USER_ORGANIZATION on SEC_USER (ORGANIZATION_ID)^
alter table WF_USER_GROUP add constraint FK_WF_USER_GROUP_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)^
create index IDX_WF_USER_GROUP_ORGANIZATION on WF_USER_GROUP (ORGANIZATION_ID)^

update t set t.ORGANIZATION_ID =
(select o.id from DF_ORGANIZATION o where o.id in
	(select c.ORGANIZATION_ID from DF_CORRESPONDENT c where c.TYPE = 'E' and  c.id in
		(select e.CORRESPONDENT_ID from DF_EMPLOYEE e where e.USER_ID in
			(select u.ID from SEC_USER u where u.LOGIN_LC = t.CREATED_BY
			)
		)
	)
)
from DF_CATEGORY t
where t.ORGANIZATION_ID is null^

update t set t.ORGANIZATION_ID =
(select o.id from DF_ORGANIZATION o where o.id in
	(select c.ORGANIZATION_ID from DF_CORRESPONDENT c where c.TYPE = 'E' and  c.id in
		(select e.CORRESPONDENT_ID from DF_EMPLOYEE e where e.USER_ID in
			(select u.ID from SEC_USER u where u.LOGIN_LC = t.CREATED_BY
			)
		)
	)
)
from TM_PROJECT t
where t.ORGANIZATION_ID is null^

update t set t.ORGANIZATION_ID =
(select o.id from DF_ORGANIZATION o where o.id in
	(select c.ORGANIZATION_ID from DF_CORRESPONDENT c where c.TYPE = 'D' and  c.id in
		(select e.DEPARTMENT_ID from DF_EMPLOYEE e where e.USER_ID in
			(select u.ID from SEC_USER u where u.LOGIN_LC = t.CREATED_BY
			)
		)
	)
)
from TM_PROJECT_GROUP t
where t.ORGANIZATION_ID is null^


update t set t.ORGANIZATION_ID =
(select o.id from DF_ORGANIZATION o where o.id in
	(select c.ORGANIZATION_ID from DF_CORRESPONDENT c where c.TYPE = 'D' and  c.id in
		(select e.DEPARTMENT_ID from DF_EMPLOYEE e where e.USER_ID in
			(select u.ID from SEC_USER u where u.LOGIN_LC in (select cr.created_by from wf_card cr where cr.id = t.card_id)
			)
		)
	)
)
from TM_TASK t
where t.ORGANIZATION_ID is null^


update t set t.ORGANIZATION_ID =
(select o.id from DF_ORGANIZATION o where o.id in
	(select c.ORGANIZATION_ID from DF_CORRESPONDENT c where c.TYPE = 'D' and  c.id in
		(select e.DEPARTMENT_ID from DF_EMPLOYEE e where e.USER_ID in
			(select u.ID from SEC_USER u where u.LOGIN_LC in (select cr.created_by from wf_card cr where cr.id = t.card_id)
			)
		)
	)
)
from TM_TASK_PATTERN t
where t.ORGANIZATION_ID is null^

update t set t.ORGANIZATION_ID =
(select o.id from DF_ORGANIZATION o where o.id in
	(select c.ORGANIZATION_ID from DF_CORRESPONDENT c where c.TYPE = 'D' and  c.id in
		(select e.DEPARTMENT_ID from DF_EMPLOYEE e where e.USER_ID in
			(select u.ID from SEC_USER u where u.LOGIN_LC = t.CREATED_BY
			)
		)
	)
)
from TM_TASK_GROUP t
where t.ORGANIZATION_ID is null^

update t set t.ORGANIZATION_ID =
(select o.id from DF_ORGANIZATION o where o.id in
	(select c.ORGANIZATION_ID from DF_CORRESPONDENT c where c.TYPE = 'D' and  c.id in
		(select e.DEPARTMENT_ID from DF_EMPLOYEE e where e.USER_ID in
			(select u.ID from SEC_USER u where u.LOGIN_LC = t.CREATED_BY
			)
		)
	)
)
from TM_TASK_PATTERN_GROUP t
where t.ORGANIZATION_ID is null^

update u set u.ORGANIZATION_ID =
(select c.ORGANIZATION_ID from DF_CORRESPONDENT c where c.TYPE = 'D' and  c.id in
	(select e.DEPARTMENT_ID from DF_EMPLOYEE e where e.USER_ID = u.ID
	)
)
from SEC_USER u
where u.ORGANIZATION_ID is null^

update t set t.ORGANIZATION_ID =
(select o.id from DF_ORGANIZATION o where o.id in
	(select c.ORGANIZATION_ID from DF_CORRESPONDENT c where c.TYPE = 'D' and  c.id in
		(select e.DEPARTMENT_ID from DF_EMPLOYEE e where e.USER_ID in
			(select u.ID from SEC_USER u where u.LOGIN_LC = t.CREATED_BY
			)
		)
	)
)
from WF_USER_GROUP t
where t.ORGANIZATION_ID is null^

update t set t.ORGANIZATION_ID =
(select o.id from DF_ORGANIZATION o where o.id in
	(select c.ORGANIZATION_ID from DF_CORRESPONDENT c where c.TYPE = 'D' and  c.id in
		(select e.DEPARTMENT_ID from DF_EMPLOYEE e where e.USER_ID in
			(select u.ID from SEC_USER u where u.LOGIN_LC = t.CREATED_BY
			)
		)
	)
)
from DF_CORRESPONDENT t
where t.type in ('R', 'C', 'I') and t.ORGANIZATION_ID is null^

update t set t.ORGANIZATION_ID =
(select o.id from DF_ORGANIZATION o where o.id in
	(select c.ORGANIZATION_ID from DF_CORRESPONDENT c where c.TYPE = 'D' and  c.id in
		(select e.DEPARTMENT_ID from DF_EMPLOYEE e where e.USER_ID in
			(select u.ID from SEC_USER u where (u.id = t.SUBSTITUTED_CREATOR_ID and t.SUBSTITUTED_CREATOR_ID is not null or t.SUBSTITUTED_CREATOR_ID is null and u.LOGIN_LC = t.CREATED_BY)
			)
		)
	)
)
from DF_OFFICE_FILE t
where t.ORGANIZATION_ID is null^

update t set t.ORGANIZATION_ID =
(select o.id from DF_ORGANIZATION o where o.id in
	(select c.ORGANIZATION_ID from DF_CORRESPONDENT c where c.TYPE = 'D' and  c.id in
		(select e.DEPARTMENT_ID from DF_EMPLOYEE e where e.USER_ID in
			(select u.ID from SEC_USER u where (u.id = t.SUBSTITUTED_CREATOR_ID and t.SUBSTITUTED_CREATOR_ID is not null or t.SUBSTITUTED_CREATOR_ID is null and u.LOGIN_LC = t.CREATED_BY)
			)
		)
	)
)
from DF_OFFICE_FILE_NOMENCLATURE t
where t.ORGANIZATION_ID is null^

update t set t.ORGANIZATION_ID =
(select o.id from DF_ORGANIZATION o where o.id in
	(select c.ORGANIZATION_ID from DF_CORRESPONDENT c where c.TYPE = 'D' and  c.id in
		(select e.DEPARTMENT_ID from DF_EMPLOYEE e where e.USER_ID in
			(select u.ID from SEC_USER u where (u.id = t.SUBSTITUTED_CREATOR_ID and t.SUBSTITUTED_CREATOR_ID is not null or t.SUBSTITUTED_CREATOR_ID is null and u.LOGIN_LC = t.CREATED_BY)
			)
		)
	)
)
from DF_TYPICAL_RESOLUTION t
where t.ORGANIZATION_ID is null^

update t set t.ORGANIZATION_ID =
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
from DF_DOC t
where t.ORGANIZATION_ID is null^

exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='df$Organization.browse', @p_type=10, @p_value=0^
exec create_or_update_sec_permission @r_name='Administrators', @p_target='df$Organization.browse', @p_type=10, @p_value=1^