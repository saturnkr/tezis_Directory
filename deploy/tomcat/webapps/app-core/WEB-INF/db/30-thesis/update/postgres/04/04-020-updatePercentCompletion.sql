-- $Id: 04-020-updatePercentCompletion.sql 2989 2011-10-22 08:09:48Z zudin $
-- Description:

update TM_TASK set PERCENT_COMPLETION = 0 where PERCENT_COMPLETION is null;
