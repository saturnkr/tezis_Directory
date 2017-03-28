update SA set action_name = TP.pattern_name from tm_schedule_action as SA
join tm_start_task_schedule_action as STSA on STSA.schedule_action_id = SA.id
join tm_task_pattern as TP on TP.card_id = STSA.task_pattern_id
