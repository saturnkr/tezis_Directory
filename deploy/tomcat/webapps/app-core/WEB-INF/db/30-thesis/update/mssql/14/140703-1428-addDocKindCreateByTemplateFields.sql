-- $Id: 140703-1428-addDocKindCreateByTemplateFields.sql 16635 2014-07-10 07:23:42Z chekashkin $
-- Description:

alter table df_doc_kind add CREATE_ONLY_BY_TEMPLATE tinyint^
alter table df_doc_kind add DISABLE_ADD_PROCESS_ACTORS tinyint^

update df_doc_kind set create_only_by_template = 0 where create_only_by_template is null^
update df_doc_kind set disable_add_process_actors = 0 where disable_add_process_actors is null^