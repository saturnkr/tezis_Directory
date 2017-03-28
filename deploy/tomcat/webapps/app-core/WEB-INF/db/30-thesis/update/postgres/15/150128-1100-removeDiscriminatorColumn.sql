-- $Id:
-- Description:

alter table df_office_file drop column if exists type;
alter table tm_task_group drop column if exists type;
alter table df_contact_person drop column if exists type;
alter table df_organization drop column if exists type;