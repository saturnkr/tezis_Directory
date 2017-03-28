-- $Id: 121204-1020-updateCardNullCreator.sql 6911 2012-12-04 08:50:35Z zudin $

update wf_card c SET creator_id = 'b18e3c10-0328-11e2-969a-fb0e8fd8c622'
where c.id in (select card_id from tm_task) and creator_id is null;

update wf_card c SET substituted_creator_id = 'b18e3c10-0328-11e2-969a-fb0e8fd8c622'
where c.id in (select card_id from tm_task) and substituted_creator_id is null;