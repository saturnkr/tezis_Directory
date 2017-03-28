-- $Id: 03-170-TaskTypeCategory.sql 2550 2011-09-01 12:49:46Z gorbunkov $
--todo test this script
alter table TM_TASK_TYPE add CATEGORY_ID uuid;
alter table TM_TASK_TYPE add constraint TM_TASK_TYPE_CATEGORY_ID foreign key (CATEGORY_ID) references SYS_CATEGORY(ID);

insert into SYS_CATEGORY(ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, DISCRIMINATOR)
select task_type.ID, task_type.NAME, 'tm$Task', false, now(), USER, 2 from TM_TASK_TYPE task_type;

alter table TM_TASK_TYPE drop NAME;

update TM_TASK_TYPE set CATEGORY_ID = ID;

alter table TM_TASK drop constraint FK_TM_TASK_TASK_TYPE;

alter table TM_TASK_VERSION drop constraint FK_TM_TASK_VERSION_TASK_TYPE;
alter table TM_TASK_PATTERN drop constraint FK_TM_TASK_PATTERN_TASK_TYPE;

alter table TM_TASK_TYPE drop constraint TM_TASK_TYPE_PKEY;
alter table TM_TASK_TYPE add primary key (CATEGORY_ID);
alter table TM_TASK_TYPE drop ID;

alter table TM_TASK add constraint FK_TM_TASK_TASK_TYPE foreign key (TASK_TYPE_ID) references TM_TASK_TYPE (CATEGORY_ID);

alter table TM_TASK_PATTERN add constraint FK_TM_TASK_PATTERN_TASK_TYPE foreign key (TASK_TYPE_ID) references TM_TASK_TYPE(CATEGORY_ID)^

alter table TM_TASK_VERSION add constraint FK_TM_TASK_VERSION_TASK_TYPE foreign key (TASK_TYPE_ID) references TM_TASK_TYPE(CATEGORY_ID)^
