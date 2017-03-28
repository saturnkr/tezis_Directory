-- $Id: 01-270-extendUserSubst.sql 468 2010-07-19 06:11:15Z krivopustov $
-- Description:

alter table SEC_USER_SUBSTITUTION add NOTIFY_BY_CARD_INFO boolean
^

update SEC_USER_SUBSTITUTION set NOTIFY_BY_CARD_INFO = false
^
