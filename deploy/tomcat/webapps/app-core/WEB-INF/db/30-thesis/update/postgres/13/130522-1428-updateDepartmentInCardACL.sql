--$Id: 130522-1428-updateDepartmentInCardACL.sql 9816 2013-05-23 09:21:28Z kozyaikin $
--$Description:

update ts_card_acl acl set department_id = e.department_id from DF_EMPLOYEE e where e.user_id = acl.user_id and e.user_id is not null and e.delete_ts is null^

