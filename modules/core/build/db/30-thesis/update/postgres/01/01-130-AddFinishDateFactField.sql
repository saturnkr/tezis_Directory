-- $Id$
-- Description: add finish_date_fact&&finish_datetime_fact field in tm_task;
--              add finish_date_fact&&finish_datetime field in tm_task_version;
--              add finish_date_fact&&finish_datetime field in tm_task_pattern;
alter table TM_TASK add FINISH_DATETIME_FACT timestamp;
alter table TM_TASK add FINISH_DATE_FACT date;
alter table TM_TASK_VERSION add FINISH_DATETIME_FACT timestamp;
alter table TM_TASK_VERSION add FINISH_DATE_FACT date;
alter table TM_TASK_PATTERN add FINISH_DATETIME_FACT timestamp;
alter table TM_TASK_PATTERN add FINISH_DATE_FACT date;