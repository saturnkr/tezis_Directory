-- $Id: 150820-1202-updateUserEmailSecPermision.sql 21346 2015-08-20 08:07:46Z timokhov $
-- Description:
select create_or_update_sec_permission('SimpleUser', 'sec$User:email', 30, 2)^

