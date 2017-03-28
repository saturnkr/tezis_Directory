--$Id: 04-390-updateSecUserSubstitute.sql 4253 2012-03-15 06:50:20Z shishov $

alter table SEC_USER_SUBSTITUTION add NOTIFY_BY_EMAIL boolean^

update SEC_USER_SUBSTITUTION set NOTIFY_BY_EMAIL = false^