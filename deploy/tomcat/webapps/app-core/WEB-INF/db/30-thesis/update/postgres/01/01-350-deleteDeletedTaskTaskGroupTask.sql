-- $Id: 01-350-deleteDeletedTaskTaskGroupTask.sql 563 2010-08-10 08:28:42Z novikov $
-- Description:

delete from TM_TASK_GROUP_TASK tgt where tgt.task_id in (select c.id from WF_CARD c where c.delete_ts is not null) and tgt.delete_ts is null