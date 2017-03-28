-- $Id: 150820-1202-updateUserEmailSecPermision.sql 21346 2015-08-20 08:07:46Z timokhov $
-- Description:
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='sec$User:email', @p_type=30, @p_value=2^

