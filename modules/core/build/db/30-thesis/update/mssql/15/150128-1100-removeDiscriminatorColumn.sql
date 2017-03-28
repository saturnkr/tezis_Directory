-- $Id:
-- Description:

if exists(select 1 from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'df_office_file' AND COLUMN_NAME = 'type')
alter table df_office_file drop column type;

if exists(select 1 from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'tm_task_group' AND COLUMN_NAME = 'type')
alter table tm_task_group drop column type;

if exists(select 1 from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'df_contact_person' AND COLUMN_NAME = 'type')
alter table df_contact_person drop column type;

if exists(select 1 from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'df_organization' AND COLUMN_NAME = 'type')
alter table df_organization drop column type;