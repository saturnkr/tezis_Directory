--$Id: 04-420-updateSecUserSubstitution.sql 4267 2012-03-16 06:57:30Z shishov $

update SEC_USER_SUBSTITUTION set NOTIFY_BY_CARD_INFO = false where NOTIFY_BY_CARD_INFO is null
^

update SEC_USER_SUBSTITUTION set NOTIFY_BY_EMAIL = false where NOTIFY_BY_EMAIL is null
^