-- $Id: 02-080-modifyTaskStates.sql 1151 2010-11-22 15:24:46Z gorbunkov $
-- Description: adds commas to start and end of card's 'state' column

CREATE OR REPLACE FUNCTION modify_task_states() RETURNS integer AS $$
DECLARE
    v_card_id uuid;
    v_card_state varchar;
    count int = 0;
BEGIN
    FOR v_card_id, v_card_state IN SELECT c.id, c.state FROM wf_card c WHERE (position(',' in c.state) <> 1) LOOP
	UPDATE wf_card SET state=','||v_card_state||',' WHERE id=v_card_id;
        count := count + 1;
    END LOOP;
    RETURN count;
END;
$$ LANGUAGE plpgsql^

select modify_task_states()^

drop function modify_task_states()^