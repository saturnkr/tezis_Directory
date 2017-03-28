create index IDX_WF_ATTACHMENT_FILE_ID
  on wf_attachment(file_id);

create index IDX_WF_ATTACHMENT_CORRESPONDENT_ID
  on wf_attachment(correspondent_id);

create index IDX_WF_ATTACHMENT_ORGANIZATION_ID
  on wf_attachment(organization_id);

create index IDX_WF_ATTACHMENT_RECOGNIZED_FILE_ID
  on wf_attachment(recognized_file_id);

create index IDX_WF_ATTACHMENT_TASK_GROUP_ID
  on wf_attachment(task_group_id);