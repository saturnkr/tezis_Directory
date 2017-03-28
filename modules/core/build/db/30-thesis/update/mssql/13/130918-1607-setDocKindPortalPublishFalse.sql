-- $Id: 130918-1607-setDocKindPortalPublishFalse.sql 12658 2013-10-18 08:36:55Z gorbunkov $

update DF_DOC_KIND set PORTAL_PUBLISH_ALLOWED = 0;