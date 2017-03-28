-- $Id: 03-120-updateProcRoleIsMulty.sql 2530 2011-08-30 06:45:41Z novikov $
--Description:

update wf_proc_role set is_multi_user = false where code in ('10-Initiator', '30-Controller', 'Approver', 'Secretary')
and proc_id in (select id from wf_proc where jbpm_process_key in ('EndorsementFull', 'Endorsement', 'TaskManagement',
'Registration', 'Resolution', 'Acquaintance'));