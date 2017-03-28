-- $Id: 01-060-updateHasAttachmentsFlag.sql 5021 2012-05-17 11:34:42Z Novikov $

update WF_CARD set HAS_ATTACHMENTS = 1
where HAS_ATTACHMENTS <> 1 and ID in (select a.CARD_ID from WF_ATTACHMENT a where a.DELETE_TS is null);