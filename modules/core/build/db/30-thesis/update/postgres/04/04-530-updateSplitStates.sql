--$Id: 04-530-updateSplitStates.sql 5010 2012-05-16 12:20:09Z shishov $

update SEC_USER_SETTING set VALUE = replace(VALUE, 'false', 'true') where NAME = 'foldersState'^