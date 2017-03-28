alter table TM_TASK add CREATE_TS timestamp default current_timestamp;
update TM_TASK set create_ts = c.create_ts from wf_card c where c.id = TM_TASK.card_id;

alter table TM_TASK_PATTERN add CREATE_TS timestamp default current_timestamp;
update TM_TASK_PATTERN set create_ts = c.create_ts from wf_card c where c.id = TM_TASK_PATTERN.card_id;

alter table TM_TASK_VERSION add CREATE_TS timestamp default current_timestamp;
update TM_TASK_VERSION set create_ts = c.create_ts from wf_card c where c.id = TM_TASK_VERSION.card_id;

alter table DF_INDIVIDUAL add CREATE_TS timestamp default current_timestamp;
update DF_INDIVIDUAL set create_ts = i.create_ts from DF_CONTRACTOR i where i.CORRESPONDENT_ID = DF_INDIVIDUAL.CONTRACTOR_ID;

alter table DF_COMPANY add CREATE_TS timestamp default current_timestamp;
update DF_COMPANY set create_ts = i.create_ts from DF_CONTRACTOR i where i.CORRESPONDENT_ID = DF_COMPANY.CONTRACTOR_ID;

alter table DF_DOC add CREATE_TS timestamp default current_timestamp;
update DF_DOC set create_ts = c.create_ts from wf_card c where c.id = DF_DOC.card_id;

alter table DF_SIMPLE_DOC add CREATE_TS timestamp default current_timestamp;
update DF_SIMPLE_DOC set create_ts = c.create_ts from wf_card c where c.id = DF_SIMPLE_DOC.card_id;

alter table DF_CONTRACT add CREATE_TS timestamp default current_timestamp;
update DF_CONTRACT set create_ts = c.create_ts from wf_card c where c.id = DF_CONTRACT.card_id;