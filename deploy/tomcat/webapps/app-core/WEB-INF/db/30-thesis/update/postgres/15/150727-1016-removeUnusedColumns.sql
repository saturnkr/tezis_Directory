alter table WF_ATTACHMENT drop column if exists CONTRACTOR_ID;
alter table TM_TASK_INFO drop column if exists NAME;
alter table TM_TASK_GROUP_TASK drop column if exists PERCENT_COMPLETION;
alter table DF_MEETING_DOC drop column if exists DATE_START;
alter table DF_EMPLOYEE_DEPARTMENT_POSITION_RELATION drop column if exists VERSION;
alter table DF_DOC_EXTRA_FIELD drop column if exists VERSION;