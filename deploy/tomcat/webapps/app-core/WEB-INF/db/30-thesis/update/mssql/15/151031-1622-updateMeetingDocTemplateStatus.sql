-- $Id: 151031-1622-updateMeetingDocTemplateStatus.sql 22408 2015-11-02 07:34:35Z timokhov $
update DF_MEETING_DOC set status = 0 where card_id in (select card_id from DF_DOC where is_template = 1);