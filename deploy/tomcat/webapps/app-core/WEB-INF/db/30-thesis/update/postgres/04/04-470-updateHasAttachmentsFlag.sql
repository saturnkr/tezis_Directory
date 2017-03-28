-- $Id: 04-470-updateHasAttachmentsFlag.sql 4550 2012-04-05 10:09:21Z Novikov $

update WF_CARD set HAS_ATTACHMENTS = true
where HAS_ATTACHMENTS <> true and ID in (select a.CARD_ID from WF_ATTACHMENT a where a.DELETE_TS is null);
