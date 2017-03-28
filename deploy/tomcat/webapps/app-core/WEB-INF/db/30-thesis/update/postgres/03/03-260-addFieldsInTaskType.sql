-- $Id: 03-260-addFieldsInTaskType.sql 4121 2012-03-01 11:09:08Z pavlov $
-- Description:

alter table TM_TASK_TYPE add CODE varchar(50);
alter table TM_TASK_TYPE add DESCRIPTION varchar(200);
alter table TM_TASK_TYPE add FIELDS_XML varchar(7000);