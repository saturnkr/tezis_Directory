-- $Id: 01-40-updateDefaultDocflow.sql 20627 2015-07-06 09:41:19Z mishunin $
-- Description:
update WF_PROC set name = 'Согласование (устар.)', card_types = ',df$SimpleDoc,df$Contract,', combined_stages_enabled = false where jbpm_process_key = 'EndorsementFull';
update WF_PROC_ROLE set name = 'Утверждающий', role_id = (select id from SEC_ROLE where name = 'doc_approver') where code = 'Approver' and proc_id = (select id from WF_PROC where jbpm_process_key = 'EndorsementFull') and updated_by is null;
update WF_PROC_ROLE set name = 'Создатель' where code = 'CARD_CREATOR' and proc_id = (select id from WF_PROC where jbpm_process_key = 'EndorsementFull') and updated_by is null;
update WF_PROC_ROLE set name = 'Инициатор', role_id = (select id from SEC_ROLE where name = 'doc_initiator') where code = 'Initiator' and proc_id = (select id from WF_PROC where jbpm_process_key = 'EndorsementFull') and updated_by is null;
update WF_PROC_ROLE set name = 'Согласующий', role_id = (select id from SEC_ROLE where name = 'doc_endorsement'), is_multi_user = 'true' where code = 'Endorsement' and proc_id = (select id from WF_PROC where jbpm_process_key = 'EndorsementFull') and updated_by is null;
update WF_PROC_ROLE set name = 'Согласующий (п)', role_id = (select id from SEC_ROLE where name = 'doc_endorsement'), order_filling_type = 'S', is_multi_user = 'true' where code = 'EndorsementSeq' and proc_id = (select id from WF_PROC where jbpm_process_key = 'EndorsementFull');
