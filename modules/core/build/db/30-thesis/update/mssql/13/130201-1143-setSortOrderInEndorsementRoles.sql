-- $Id$
-- Description:

update wf_proc_role set sort_order = 1 where code = 'Initiator' and proc_id = (select id from wf_proc where code = 'Endorsement') and delete_ts is null;
update wf_proc_role set sort_order = 2 where code = 'Endorsement' and proc_id = (select id from wf_proc where code = 'Endorsement') and delete_ts is null;
update wf_proc_role set sort_order = 3 where code = 'Approver' and proc_id = (select id from wf_proc where code = 'Endorsement') and delete_ts is null;
update wf_proc_role set sort_order = 4 where code = 'CARD_CREATOR' and proc_id = (select id from wf_proc where code = 'Endorsement') and delete_ts is null;
update wf_proc_role set sort_order = 5 where code = 'CARD_ACCESS' and proc_id = (select id from wf_proc where code = 'Endorsement') and delete_ts is null;
