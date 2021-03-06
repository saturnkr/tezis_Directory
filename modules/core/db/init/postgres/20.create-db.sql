-- begin TEZISDIRECTORY_COST_ARTICLE
alter table TEZISDIRECTORY_COST_ARTICLE add constraint FK_TEZISDIRECTORY_COST_ARTICLE_HOLDER_ID foreign key (HOLDER_ID) references SEC_USER(ID)^
alter table TEZISDIRECTORY_COST_ARTICLE add constraint FK_TEZISDIRECTORY_COST_ARTICLE_COMMERCIAL_ID foreign key (COMMERCIAL_ID) references SEC_USER(ID)^
create index IDX_TEZISDIRECTORY_COST_ARTICLE_COMMERCIAL on TEZISDIRECTORY_COST_ARTICLE (COMMERCIAL_ID)^
create index IDX_TEZISDIRECTORY_COST_ARTICLE_HOLDER on TEZISDIRECTORY_COST_ARTICLE (HOLDER_ID)^
-- end TEZISDIRECTORY_COST_ARTICLE
-- begin DF_SIMPLE_DOC
alter table DF_SIMPLE_DOC add constraint FK_DF_SIMPLE_DOC_COSTART_ID foreign key (COSTART_ID) references TEZISDIRECTORY_COST_ARTICLE(ID)^
create index IDX_DF_SIMPLE_DOC_COSTART on DF_SIMPLE_DOC (COSTART_ID)^
-- end DF_SIMPLE_DOC
