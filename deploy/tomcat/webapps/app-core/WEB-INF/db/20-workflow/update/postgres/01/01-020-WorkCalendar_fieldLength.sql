-- $Id$
-- Description: Change fields length in WF_CALENDAR

ALTER TABLE WF_CALENDAR
 ALTER COLUMN WORK_START TYPE varchar(5),
 ALTER COLUMN WORK_END TYPE varchar(5);