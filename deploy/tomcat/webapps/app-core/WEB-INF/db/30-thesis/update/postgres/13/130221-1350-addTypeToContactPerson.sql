--$Id: 130221-1350-addTypeToContactPerson.sql 8042 2013-02-21 11:41:10Z shishov $
--$Description:

alter table DF_CONTACT_PERSON add column TYPE varchar(1);
update DF_CONTACT_PERSON set TYPE = 'T';