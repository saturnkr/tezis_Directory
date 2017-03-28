exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='wf$UserNotifiedBySms.browse', @p_type=10, @p_value=0^
exec create_or_update_sec_permission @r_name='Administrators', @p_target='wf$UserNotifiedBySms.browse', @p_type=10, @p_value=1^
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='wf$SendingSms.browse', @p_type=10, @p_value=0^
exec create_or_update_sec_permission @r_name='Administrators', @p_target='wf$SendingSms.browse', @p_type=10, @p_value=1^