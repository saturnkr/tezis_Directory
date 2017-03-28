alter table DF_CONTRACTOR_ACCOUNT add column NAME varchar(200)^
alter table DF_CONTRACTOR_ACCOUNT add column CORRESPONDENT varchar(200)^
alter table DF_CONTRACTOR_ACCOUNT add column INDIRECT_CALC_BANK_ID uuid^
alter table DF_CONTRACTOR_ACCOUNT add constraint FK_DF_CONTRACTOR_ACCOUNT_DF_BANK foreign key (INDIRECT_CALC_BANK_ID) references DF_BANK (ID)^

alter table DF_ORGANIZATION_ACCOUNT add column NAME varchar(200)^
alter table DF_ORGANIZATION_ACCOUNT add column CORRESPONDENT varchar(200)^
alter table DF_ORGANIZATION_ACCOUNT add column INDIRECT_CALC_BANK_ID uuid^
alter table DF_ORGANIZATION_ACCOUNT add constraint FK_DF_ORGANIZATION_ACCOUNT_DF_BANK foreign key (INDIRECT_CALC_BANK_ID) references DF_BANK (ID)^