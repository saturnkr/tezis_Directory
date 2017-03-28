--$Id: 130523-1200-addEndorsedFieldToDoc.sql 10056 2013-06-03 06:01:27Z pavlov $
--Description:

alter table DF_DOC add column ENDORSED boolean^

update DF_DOC set ENDORSED = (case when APPROVAL_DATE is null then FALSE else TRUE end)^