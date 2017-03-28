-- $Id: 140203-1624-addSimpleDocPortalErrorField.sql 14755 2014-02-05 13:37:53Z fedorchenko $
-- Description:
alter table DF_SIMPLE_DOC add PORTAL_PUBLISH_ERROR_DESCRIPTION varchar(2000);
