-- $Id: 02-130-CreateIndexes.sql 1455 2011-02-10 08:57:36Z krivopustov $
-- Description:

create index idx_df_doc_office_data_doc on df_doc_office_data (doc_id)^

create index idx_tm_card_project_card on tm_card_project (card_id)^

create index idx_tm_task_finish_date_plan on tm_task (finish_date_plan)^

create index idx_tm_schedule_trigger_active on tm_schedule_trigger (active)^

create index idx_df_doc_transfer_log_doc_office_data on df_doc_transfer_log (doc_office_data_id)^

create index idx_df_doc_office_data_response_to_doc on df_doc_office_data (response_to_doc_id)^

create index idx_df_doc_version_of on df_doc (version_of_id)^

create index idx_df_doc_is_template on df_doc (is_template)^

create index idx_tm_task_version_task on tm_task_version (task_id)^
