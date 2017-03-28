-- $Id: 150313-1924-updateTaskStates.sql 19434 2015-03-13 15:32:38Z mishunin $
-- Description:

update wf_card set state = ',New,' where state is null and id in (select card_id from tm_task);