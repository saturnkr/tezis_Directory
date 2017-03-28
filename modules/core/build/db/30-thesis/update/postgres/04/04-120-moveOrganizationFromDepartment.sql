-- $Id: 04-120-moveOrganizationFromDepartment.sql 3163 2011-11-08 12:00:24Z gorbunkov $

alter table DF_CORRESPONDENT add ORGANIZATION_ID uuid;
alter table DF_CORRESPONDENT add constraint FK_DF_CORRESPONDENT_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION(ID);

update DF_CORRESPONDENT cor set ORGANIZATION_ID = d.ORGANIZATION_ID
from DF_DEPARTMENT d where d.CORRESPONDENT_ID = cor.ID;

alter table DF_DEPARTMENT drop column ORGANIZATION_ID;