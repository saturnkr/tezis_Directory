--$Id: 04-350-addEndorsementProcessFields.sql 4121 2012-03-01 11:09:08Z pavlov $

alter table DF_DOC add column ENDORSEMENT_START_DATE date
^

alter table DF_DOC add column ENDORSEMENT_END_DATE date
^

alter table DF_DOC add column APPROVAL_DATE date
^
