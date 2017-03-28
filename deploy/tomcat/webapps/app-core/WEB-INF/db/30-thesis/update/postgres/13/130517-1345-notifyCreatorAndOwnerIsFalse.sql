--$Id$
--Description:

update DF_CONTRACT set NOTIFIED_OWNER = false where NOTIFIED_OWNER is null;
update DF_CONTRACT set NOTIFIED_CREATOR = false where NOTIFIED_CREATOR is null;