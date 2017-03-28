-- $Id: 150506-1200-addMeetingDocDocType.sql 20170 2015-05-22 14:35:38Z kozyaikin $
-- Description:
insert into DF_DOC_TYPE (ID, CREATE_TS, CREATED_BY, NAME, DISCRIMINATOR)
values ('5aa5ef34-af44-11df-b1c6-af3783a11da6', current_timestamp, 'admin', 'df$MeetingDoc', 130)^