-- $Id: 03-020-clearStartIfFailedInSheduledTask.sql 2029 2011-05-31 05:54:10Z novikov $
-- Description:

update tm_schedule_task set start_if_failed = false^
alter table TM_SCHEDULE_ACTION_LOG alter column MESSAGE type text;
alter table TM_SCHEDULE_ACTION_LOG add IS_ERROR boolean;