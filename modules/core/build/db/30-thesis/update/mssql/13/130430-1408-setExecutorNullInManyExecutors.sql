--$Id: 130430-1408-setExecutorNullInManyExecutors.sql 9452 2013-04-30 10:39:57Z tsarevskiy $
--$Description:

update TM_TASK set EXECUTOR_ID = null where CARD_ID in (select ID from WF_CARD where STATE = ',Assigned,')
and START_TASK_TYPE = 1 and EXECUTOR_ID is not null;