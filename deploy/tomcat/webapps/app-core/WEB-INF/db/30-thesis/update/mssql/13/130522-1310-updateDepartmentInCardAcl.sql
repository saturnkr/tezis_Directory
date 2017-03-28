--$Id: 130522-1310-updateDepartmentInCardAcl.sql 9816 2013-05-23 09:21:28Z kozyaikin $
--$Description:
update acl set acl.department_id = e.department_id from ts_card_acl acl inner join DF_EMPLOYEE e ON e.user_id = acl.user_id where e.user_id is not null and e.delete_ts is null;
^