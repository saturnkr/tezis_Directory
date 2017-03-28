--$Id: 150430-1700-updateUserFGPermission.sql 20010 2015-04-30 13:02:56Z saiyan $

delete from sec_permission where target = 'tm$User.edit:fieldGroup';

exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='tm$User.edit:fieldGroupLeft', @p_type=50, @p_value=1^
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='tm$User.edit:fieldGroupRight', @p_type=50, @p_value=1^
