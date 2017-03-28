-- $Id: 01-090-migrateParentTaskAndDropNotUsedColumn.sql 125 2010-04-28 07:48:15Z pavlov $
-- Description: Migrate Parent Task And Drop Not Used Column

update WF_CARD set PARENT_CARD_ID = PARENT_TASK_ID
from TM_TASK where CARD_ID = ID and PARENT_TASK_ID is not null;

alter table TM_TASK drop column PARENT_TASK_ID;

alter table DF_DOC drop column PARENT_DOC_ID;

alter table DF_DOC drop column PARENT_TASK_ID;