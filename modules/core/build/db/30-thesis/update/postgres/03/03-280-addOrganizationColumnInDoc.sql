-- $Id: 03-280-addOrganizationColumnInDoc.sql 4121 2012-03-01 11:09:08Z pavlov $

alter table DF_DOC add column ORGANIZATION_ID uuid^
alter table DF_DOC add constraint FK_DF_DOC_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION(ID)^

update DF_DOC set ORGANIZATION_ID = (
    select C.ORGANIZATION_ID from DF_CONTRACT C where (C.ORGANIZATION_ID is not null) and C.CARD_ID = DF_DOC.CARD_ID
)^

alter table DF_CONTRACT drop column ORGANIZATION_ID^