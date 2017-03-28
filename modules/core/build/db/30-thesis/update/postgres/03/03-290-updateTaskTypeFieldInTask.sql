-- $Id: 03-290-updateTaskTypeFieldInTask.sql 2848 2011-10-10 07:31:44Z chernov $
-- Description:

update TM_TASK set TASK_TYPE_ID = '836d02a0-68a9-4aa5-b11a-08e9b32c589b' where TASK_TYPE_ID is null;