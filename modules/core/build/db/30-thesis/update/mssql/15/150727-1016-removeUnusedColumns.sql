if exists(select 1 from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'WF_ATTACHMENT' AND COLUMN_NAME = 'CONTRACTOR_ID')
alter table WF_ATTACHMENT drop column CONTRACTOR_ID;

if exists(select 1 from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'TM_TASK_INFO' AND COLUMN_NAME = 'NAME')
alter table TM_TASK_INFO drop column NAME;

if exists(select 1 from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'TM_TASK_GROUP_TASK' AND COLUMN_NAME = 'PERCENT_COMPLETION')
alter table TM_TASK_GROUP_TASK drop column PERCENT_COMPLETION;

if exists(select 1 from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'DF_MEETING_DOC' AND COLUMN_NAME = 'DATE_START')
alter table DF_MEETING_DOC drop column DATE_START;

if exists(select 1 from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'DF_EMPLOYEE_DEPARTMENT_POSITION_RELATION' AND COLUMN_NAME = 'VERSION')
alter table DF_EMPLOYEE_DEPARTMENT_POSITION_RELATION drop column VERSION;

if exists(select 1 from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'DF_DOC_EXTRA_FIELD' AND COLUMN_NAME = 'VERSION')
alter table DF_DOC_EXTRA_FIELD drop column VERSION;