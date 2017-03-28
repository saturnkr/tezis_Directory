-- $Id: 02-090-AddParentCardInTaskGroup.sql 1394 2011-01-19 11:04:13Z novikov $
-- Description:
ALTER TABLE TM_TASK_GROUP add PARENT_CARD_ID uuid;
alter table TM_TASK_GROUP add constraint FK_TM_TASK_GROUP_PARENT_CARD foreign key (PARENT_CARD_ID) references WF_CARD(ID);