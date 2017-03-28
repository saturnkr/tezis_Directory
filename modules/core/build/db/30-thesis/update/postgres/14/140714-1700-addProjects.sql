alter table DF_DOC add PROJECT_ID uuid;
alter table DF_DOC add constraint FK_DF_DOC_PROJECT foreign key(PROJECT_ID) references TM_PROJECT(ID);

update DF_DOC as D set PROJECT_ID =
(select C.PROJECT_ID from TM_CARD_PROJECT C where C.CARD_ID = D.CARD_ID limit 1);

alter table TM_TASK add PROJECT_ID uuid;
alter table DF_DOC add constraint FK_TM_TASK_PROJECT foreign key(PROJECT_ID) references TM_PROJECT(ID);

update TM_TASK as T set PROJECT_ID =
(select C.PROJECT_ID from TM_CARD_PROJECT C where C.CARD_ID = T.CARD_ID limit 1);