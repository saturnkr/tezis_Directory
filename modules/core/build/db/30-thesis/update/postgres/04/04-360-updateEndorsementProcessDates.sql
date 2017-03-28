--$Id: 04-360-updateEndorsementProcessDates.sql 4121 2012-03-01 11:09:08Z pavlov $

alter table DF_DOC alter column ENDORSEMENT_START_DATE type timestamp
^

alter table DF_DOC alter column ENDORSEMENT_END_DATE type timestamp
^

alter table DF_DOC alter column APPROVAL_DATE type timestamp
^
