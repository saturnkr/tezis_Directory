select create_or_update_sec_permission('Administrators', 'wf$UserNotifiedBySms.browse', 10, 1)^
select create_or_update_sec_permission('SimpleUser', 'wf$UserNotifiedBySms.browse', 10, 0)^
select create_or_update_sec_permission('Administrators', 'wf$SendingSms.browse', 10, 1)^
select create_or_update_sec_permission('SimpleUser', 'wf$SendingSms.browse', 10, 0)^