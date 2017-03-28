--$Id: 131119-1658-denyPortalIntegrationForSimpleUser.sql 13331 2013-11-19 13:18:56Z fedorchenko $
--$Description:
select create_or_update_sec_permission('SimpleUser', 'portalIntegration', 10, 0);