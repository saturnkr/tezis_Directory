--$Id: 141110-1800-updateRemoteCardState.sql 18071 2014-11-10 14:47:31Z saiyan $

alter table TS_REMOTE_CARD_STATE add UPDATE_TS datetime;
alter table TS_REMOTE_CARD_STATE add UPDATED_BY varchar(50)^