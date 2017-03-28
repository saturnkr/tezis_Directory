 -- $Id$
 ^
exec create_or_update_sec_permission @r_name='ReferenceEditor', @p_target='df$CorrespondentAttachment:create', @p_type=20, @p_value=1^
exec create_or_update_sec_permission @r_name='ReferenceEditor', @p_target='df$CorrespondentAttachment:update', @p_type=20, @p_value=1^
exec create_or_update_sec_permission @r_name='ReferenceEditor', @p_target='df$CorrespondentAttachment:delete', @p_type=20, @p_value=1^

exec create_or_update_sec_permission @r_name='Administrators', @p_target='df$CorrespondentAttachment:create', @p_type=20, @p_value=1^
exec create_or_update_sec_permission @r_name='Administrators', @p_target='df$CorrespondentAttachment:update', @p_type=20, @p_value=1^
exec create_or_update_sec_permission @r_name='Administrators', @p_target='df$CorrespondentAttachment:delete', @p_type=20, @p_value=1^

exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='df$CorrespondentAttachment:create', @p_type=20, @p_value=0^
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='df$CorrespondentAttachment:update', @p_type=20, @p_value=0^
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='df$CorrespondentAttachment:delete', @p_type=20, @p_value=0^

exec create_or_update_sec_permission @r_name='ReferenceEditor', @p_target='df$OrganizationAttachment:create', @p_type=20, @p_value=1^
exec create_or_update_sec_permission @r_name='ReferenceEditor', @p_target='df$OrganizationAttachment:update', @p_type=20, @p_value=1^
exec create_or_update_sec_permission @r_name='ReferenceEditor', @p_target='df$OrganizationAttachment:delete', @p_type=20, @p_value=1^

exec create_or_update_sec_permission @r_name='Administrators', @p_target='df$OrganizationAttachment:create', @p_type=20, @p_value=1^
exec create_or_update_sec_permission @r_name='Administrators', @p_target='df$OrganizationAttachment:update', @p_type=20, @p_value=1^
exec create_or_update_sec_permission @r_name='Administrators', @p_target='df$OrganizationAttachment:delete', @p_type=20, @p_value=1^

exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='df$OrganizationAttachment:create', @p_type=20, @p_value=0^
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='df$OrganizationAttachment:update', @p_type=20, @p_value=0^
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='df$OrganizationAttachment:delete', @p_type=20, @p_value=0^