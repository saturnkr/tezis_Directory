--$Id$
--Description:

update DF_CONTRACT set NOTIFIED_OWNER = 0 where NOTIFIED_OWNER is null;
update DF_CONTRACT set NOTIFIED_CREATOR = 0 where NOTIFIED_CREATOR is null;