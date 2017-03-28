-- $Id: 01-200-executorAndSignedByColumns.sql 320 2010-06-04 12:50:30Z gorbunkov $
-- Description: new fields for office

alter table DF_DOC add OFFICE_EXECUTOR_ID uuid;
alter table DF_DOC add OFFICE_SIGNED_BY_ID uuid;

alter table DF_DOC add constraint FK_DF_DOC_OFFICE_EXECUTOR foreign key (OFFICE_EXECUTOR_ID) references DF_CONTACT_PERSON (ID);
alter table DF_DOC add constraint FK_DF_DOC_OFFICE_SIGNED_BY foreign key (OFFICE_SIGNED_BY_ID) references DF_CONTACT_PERSON (ID);