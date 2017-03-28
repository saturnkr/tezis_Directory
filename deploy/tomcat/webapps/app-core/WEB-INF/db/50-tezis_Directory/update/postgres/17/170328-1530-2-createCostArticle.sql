alter table TEZISDIRECTORY_COST_ARTICLE add constraint FK_TEZISDIRECTORY_COST_ARTICLE_HOLDER_ID foreign key (HOLDER_ID) references SEC_USER(ID);
alter table TEZISDIRECTORY_COST_ARTICLE add constraint FK_TEZISDIRECTORY_COST_ARTICLE_COMMERCIAL_ID foreign key (COMMERCIAL_ID) references SEC_USER(ID);
create index IDX_TEZISDIRECTORY_COST_ARTICLE_COMMERCIAL on TEZISDIRECTORY_COST_ARTICLE (COMMERCIAL_ID);
create index IDX_TEZISDIRECTORY_COST_ARTICLE_HOLDER on TEZISDIRECTORY_COST_ARTICLE (HOLDER_ID);