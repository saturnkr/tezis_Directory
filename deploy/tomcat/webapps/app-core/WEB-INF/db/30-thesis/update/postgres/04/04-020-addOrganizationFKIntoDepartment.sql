alter table DF_DEPARTMENT add column ORGANIZATION_ID uuid
^

alter table DF_DEPARTMENT add constraint FK_ORGANIZATION foreign key (ORGANIZATION_ID) references DF_ORGANIZATION (ID)
^