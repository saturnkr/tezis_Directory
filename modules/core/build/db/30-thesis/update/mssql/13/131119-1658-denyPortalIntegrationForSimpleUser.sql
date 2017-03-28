--$Id: 131119-1658-denyPortalIntegrationForSimpleUser.sql 13331 2013-11-19 13:18:56Z fedorchenko $
--$Description:
exec create_or_update_sec_permission @r_name='SimpleUser', @p_target='portalIntegration', @p_type=10, @p_value=0;