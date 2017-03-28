-- $Id: 150706-1610-dropParentCardAccessColumns.sql 20673 2015-07-09 14:33:21Z mishunin $
-- Description:

update wf_card set parent_card_access = (select parent_card_access from tm_task where wf_card.id = tm_task.card_id)
    where id in (select card_id from tm_task);
update wf_card set parent_card_access = (select parent_card_access from tm_task_pattern where wf_card.id = tm_task_pattern.card_id)
    where id in (select card_id from tm_task_pattern);
update wf_card set parent_card_access = (select parent_card_access from tm_task_version where wf_card.id = tm_task_version.card_id)
    where id in (select card_id from tm_task_version);

alter table tm_task drop column parent_card_access;
alter table tm_task_pattern drop column parent_card_access;
alter table tm_task_version drop column parent_card_access;

