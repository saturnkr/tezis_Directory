-- $Id: 04-040-setSortOrderInProcRoles.sql 3050 2011-10-26 11:20:23Z chernov $
-- Description: set initial sort_order in wf_proc_role for exists processes

--process Acquaintance
update wf_proc_role set sort_order = 1 where code = 'Initiator' and proc_id = (select id from wf_proc where code = 'Acquaintance') and delete_ts is null;
update wf_proc_role set sort_order = 2 where code = 'Acquaintance' and proc_id = (select id from wf_proc where code = 'Acquaintance') and delete_ts is null;
update wf_proc_role set sort_order = 3 where code = 'CARD_CREATOR' and proc_id = (select id from wf_proc where code = 'Acquaintance') and delete_ts is null;

--process Registration
update wf_proc_role set sort_order = 1 where code = 'Initiator' and proc_id = (select id from wf_proc where code = 'Registration') and delete_ts is null;
update wf_proc_role set sort_order = 2 where code = 'Secretary' and proc_id = (select id from wf_proc where code = 'Registration') and delete_ts is null;
update wf_proc_role set sort_order = 3 where code = 'CARD_CREATOR' and proc_id = (select id from wf_proc where code = 'Registration') and delete_ts is null;

--process Resolution
update wf_proc_role set sort_order = 1 where code = 'Initiator' and proc_id = (select id from wf_proc where code = 'Resolution') and delete_ts is null;
update wf_proc_role set sort_order = 2 where code = 'Approver' and proc_id = (select id from wf_proc where code = 'Resolution') and delete_ts is null;
update wf_proc_role set sort_order = 3 where code = 'CARD_CREATOR' and proc_id = (select id from wf_proc where code = 'Resolution') and delete_ts is null;

--process EndorsementFull
update wf_proc_role set sort_order = 1 where code = 'Initiator' and proc_id = (select id from wf_proc where code = 'EndorsementFull') and delete_ts is null;
update wf_proc_role set sort_order = 2 where code = 'EndorsementSeq' and proc_id = (select id from wf_proc where code = 'EndorsementFull') and delete_ts is null;
update wf_proc_role set sort_order = 3 where code = 'Endorsement' and proc_id = (select id from wf_proc where code = 'EndorsementFull') and delete_ts is null;
update wf_proc_role set sort_order = 4 where code = 'Approver' and proc_id = (select id from wf_proc where code = 'EndorsementFull') and delete_ts is null;
update wf_proc_role set sort_order = 5 where code = 'CARD_CREATOR' and proc_id = (select id from wf_proc where code = 'EndorsementFull') and delete_ts is null;
update wf_proc_role set sort_order = 6 where code = 'CARD_ACCESS' and proc_id = (select id from wf_proc where code = 'EndorsementFull') and delete_ts is null;

--process TaskManagement
update wf_proc_role set sort_order = 1 where code = '10-Initiator' and proc_id = (select id from wf_proc where code = 'TaskManagement') and delete_ts is null;
update wf_proc_role set sort_order = 2 where code = '20-Executor' and proc_id = (select id from wf_proc where code = 'TaskManagement') and delete_ts is null;
update wf_proc_role set sort_order = 3 where code = '30-Controller' and proc_id = (select id from wf_proc where code = 'TaskManagement') and delete_ts is null;
update wf_proc_role set sort_order = 4 where code = '90-Observer' and proc_id = (select id from wf_proc where code = 'TaskManagement') and delete_ts is null;
update wf_proc_role set sort_order = 5 where code = 'CARD_CREATOR' and proc_id = (select id from wf_proc where code = 'TaskManagement') and delete_ts is null;
update wf_proc_role set sort_order = 6 where code = 'CARD_ACCESS' and proc_id = (select id from wf_proc where code = 'TaskManagement') and delete_ts is null;

--update other processes
update wf_proc_role as w set sort_order = 1 + (select count(pr.id) from wf_proc_role pr where pr.code < w.code and pr.proc_id = w.proc_id and pr.delete_ts is null)
where w.sort_order is null and w.delete_ts is null;