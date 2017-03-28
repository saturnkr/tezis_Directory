-- $Id: 140305-1143-addOrganizationInReservationNumber.sql 15271 2014-03-05 12:33:42Z kozyaikin $
-- Description:

alter table DF_RESERVATION_NUMBER  add ORGANIZATION_ID uuid^

alter table DF_RESERVATION_NUMBER add constraint FK_DF_RESERVATION_NUMBER_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION(ID)^