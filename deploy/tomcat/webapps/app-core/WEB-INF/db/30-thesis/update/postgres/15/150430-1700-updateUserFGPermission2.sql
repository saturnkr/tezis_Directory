--$Id: 150430-1700-updateUserFGPermission2.sql 20039 2015-05-08 12:25:35Z saiyan $

select create_or_update_sec_permission('SimpleUser', 'sec$User:timeZone', 30, 1)^
select create_or_update_sec_permission('SimpleUser', 'sec$User:timeZoneAuto', 30, 1)^
