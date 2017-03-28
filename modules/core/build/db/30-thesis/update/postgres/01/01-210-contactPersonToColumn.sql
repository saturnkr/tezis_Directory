-- $Id: 01-210-contactPersonToColumn.sql 359 2010-06-11 08:31:43Z pavlov $
-- Description: add contact person to column in doc for office

alter table DF_DOC add OFFICE_CONTACT_PERSON_TO_ID uuid;

alter table DF_DOC add constraint FK_DF_DOC_OFFICE_CONTACT_PERSON_TO foreign key (OFFICE_CONTACT_PERSON_TO_ID) references DF_CONTACT_PERSON (ID);