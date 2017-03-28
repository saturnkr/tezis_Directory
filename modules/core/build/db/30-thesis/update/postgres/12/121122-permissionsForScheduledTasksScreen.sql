-- $Id$

select create_or_update_sec_permission('Administrators', 'core$ScheduledTask.browse', 10, 1)^
select create_or_update_sec_permission('SimpleUser', 'core$ScheduledTask.browse', 10, 0)^