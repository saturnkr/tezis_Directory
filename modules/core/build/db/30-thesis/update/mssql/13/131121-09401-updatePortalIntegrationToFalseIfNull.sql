--$Id: 131121-09401-updatePortalIntegrationToFalseIfNull.sql 13378 2013-11-21 05:56:18Z fedorchenko $
--$Description:
update DF_DOC_KIND set PORTAL_PUBLISH_ALLOWED = 0 where PORTAL_PUBLISH_ALLOWED is null^