-- $Id: 02-150-addDependentReferenceToTask.sql 1654 2011-03-29 06:06:57Z chernov $
-- Description:

alter table TM_TASK add column PRIMARY_TASK_ID uuid;
alter table TM_TASK add constraint FK_TM_TASK_TASK foreign key (PRIMARY_TASK_ID) references TM_TASK(CARD_ID);