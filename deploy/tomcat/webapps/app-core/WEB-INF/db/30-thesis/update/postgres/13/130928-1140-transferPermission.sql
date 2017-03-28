--$Id: 130928-1140-transferPermission.sql 12075 2013-09-28 09:47:50Z zudin $
--$Description:

select create_or_update_sec_permission('Administrators', 'transferOfficeFile', 10, 1)^
select create_or_update_sec_permission('SimpleUser', 'transferOfficeFile', 10, 0)^