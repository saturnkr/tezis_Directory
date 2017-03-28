-- $Id: 151015-1633-addMeetingDocMeetingCommentField.sql 21666 2015-10-15 16:33:51Z timokhov $
alter table DF_MEETING_DOC add MEETING_COMMENT varchar(1000);