--$Id: 131108-1340-missingIndexes.sql 13790 2013-12-09 14:11:57Z pavlov $
--$Description:

drop index if exists IDX_DF_SHORT_URL_LONG_URL_DELETE_TS^
create index IDX_DF_SHORT_URL_LONG_URL_DELETE_TS on DF_SHORT_URL(LONG_URL, DELETE_TS)^

DROP INDEX IF EXISTS IDX_DF_SHORT_URL_SHORT_URL_DELETE_TS^
CREATE INDEX IDX_DF_SHORT_URL_SHORT_URL_DELETE_TS ON DF_SHORT_URL(SHORT_URL, DELETE_TS)^

drop index if exists idx_df_edp_relation_employee^
create index idx_df_edp_relation_employee on df_employee_department_position_relation(employee_id)^

drop index if exists idx_df_edp_relation_department_delete_ts^
create index idx_df_edp_relation_department_delete_ts on df_employee_department_position_relation(department_id, delete_ts)^

drop index if exists idx_df_department_parent^
create index idx_df_department_parent on df_department(parent_department_id)^

drop index if exists idx_df_doc_office_data_addressee_dod^
create index idx_df_doc_office_data_addressee_dod on df_doc_office_data_addressee(doc_office_data_id)^
