-- $Id: 130918-1607-setDocKindPortalPublishFalse.sql 12498 2013-10-14 07:46:44Z gorbunkov $

update DF_DOC_KIND set PORTAL_PUBLISH_ALLOWED = false;