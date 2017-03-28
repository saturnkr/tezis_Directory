-- $Id: 01-320-setTaskExecutorInitiatorReferences.sql 1169 2010-11-25 09:49:38Z novikov $
-- Description: functions fill executor_id and initiator_id where given roles exists, but references aren't set

CREATE OR REPLACE FUNCTION update_task_executors() RETURNS integer AS $$
DECLARE
    v_task_id uuid;
    v_executor_id uuid;
    count int = 0;
BEGIN
    FOR v_task_id, v_executor_id IN SELECT t.card_id, cr.user_id FROM tm_task t, wf_card_role cr WHERE cr.card_id = t.card_id and t.executor_id is null and cr.code = '20-Executor' and cr.user_id is not null LOOP
	RAISE WARNING 'Updating tm_task with card_id = %, executor_id is %', quote_literal(v_task_id), quote_literal(v_executor_id);
	UPDATE TM_TASK SET EXECUTOR_ID=v_executor_id WHERE card_id=v_task_id;
        count := count + 1;
    END LOOP;
    RETURN count;
END;
$$ LANGUAGE plpgsql^

select update_task_executors()^
drop function if exists update_task_executors()^

CREATE OR REPLACE FUNCTION update_task_initiators() RETURNS integer AS $$
DECLARE
    v_task_id uuid;
    v_initiator_id uuid;
BEGIN
    FOR v_task_id, v_initiator_id IN SELECT t.card_id, cr.user_id FROM tm_task t, wf_card_role cr WHERE cr.card_id = t.card_id and t.initiator_id is null and cr.code = '10-Initiator' and cr.user_id is not null LOOP
	RAISE WARNING 'Updating tm_task with card_id = %, initiator_id is %', quote_literal(v_task_id), quote_literal(v_initiator_id);
	UPDATE TM_TASK SET INITIATOR_ID=v_initiator_id WHERE CARD_ID=v_task_id;
    END LOOP;
    RETURN 0;
END;
$$ LANGUAGE plpgsql^

select update_task_initiators()^
drop function if exists update_task_initiators()^