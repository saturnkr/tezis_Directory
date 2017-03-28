-- $Id: 03-090-addCurrencyInContract.sql 4121 2012-03-01 11:09:08Z pavlov $

alter table DF_CONTRACT add column CURRENCY_ID uuid^
alter table DF_CONTRACT add constraint FK_DF_CONTRACT_CURRENCY foreign key (CURRENCY_ID) references DF_CURRENCY(ID)^
insert into DF_CURRENCY (ID, NAME, CODE) values ('409bd4d2-cfa2-11e0-84b0-13f6ef08af82', 'Рубль', 'RUB')^
update DF_CONTRACT set CURRENCY_ID = '409bd4d2-cfa2-11e0-84b0-13f6ef08af82'^