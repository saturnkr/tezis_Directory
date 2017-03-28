-- $Id: 01-080-addTaskName.sql 125 2010-04-28 07:48:15Z pavlov $
-- Description: Add Task Name

alter table TM_TASK add TASK_NAME varchar(255);
alter table TM_TASK_PATTERN add TASK_NAME varchar(255);
alter table TM_TASK_VERSION add TASK_NAME varchar(255);

update TM_TASK set TASK_NAME = DESCRIPTION
from WF_CARD where id = card_id;

update WF_CARD set DESCRIPTION = TASK_NAME || ' [' || NUM || ']'
from TM_TASK where id = card_id;

update TM_TASK_PATTERN set TASK_NAME = DESCRIPTION
from WF_CARD where id = card_id;

update WF_CARD set DESCRIPTION = TASK_NAME || ' [' || NUM || ']'
from TM_TASK_PATTERN where id = card_id;

update TM_TASK_VERSION set TASK_NAME = DESCRIPTION
from WF_CARD where id = card_id;

update WF_CARD set DESCRIPTION = TASK_NAME || ' [' || NUM || ']'
from TM_TASK_VERSION where id = card_id;