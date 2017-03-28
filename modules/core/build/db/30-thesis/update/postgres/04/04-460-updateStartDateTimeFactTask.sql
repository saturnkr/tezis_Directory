--$Id: 04-460-updateStartDateTimeFact.sql 4121 2012-04-04 14:06:08Z subbotin $

update tm_task t set start_datetime_fact = (select max(create_ts) from wf_assignment a where a.name = 'Started' and a.card_id = t.card_id)
where t.card_id in (select tin.card_id from tm_task tin inner join wf_card c on c.id = tin.card_id where tin.start_datetime_fact is null and c.state != ',New,')^