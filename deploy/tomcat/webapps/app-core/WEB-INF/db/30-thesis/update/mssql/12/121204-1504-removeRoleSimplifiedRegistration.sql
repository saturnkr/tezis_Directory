-- $Id: 121204-1504-removeRoleSimplifiedRegistration.sql 11283 2013-08-12 09:34:32Z pavlov $
-- Description:

delete from sec_permission  where role_id = '6d380898-297f-11e2-b2d9-278fef9a3a98';
delete from sec_user_role  where role_id = '6d380898-297f-11e2-b2d9-278fef9a3a98';
delete from sec_role where id = '6d380898-297f-11e2-b2d9-278fef9a3a98';

exec create_or_update_sec_permission @r_name='doc_secretary', @p_target='df$FastRegistration', @p_type=10, @p_value=1^
