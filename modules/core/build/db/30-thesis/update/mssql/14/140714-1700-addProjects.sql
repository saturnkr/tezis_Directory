alter table DF_DOC add PROJECT_ID uniqueidentifier;
alter table DF_DOC add constraint FK_DF_DOC_PROJECT foreign key(PROJECT_ID) references TM_PROJECT(ID)^

update D set D.PROJECT_ID =
(select top(1) C.PROJECT_ID from TM_CARD_PROJECT C where C.CARD_ID = D.CARD_ID)
from DF_DOC D^

alter table TM_TASK add PROJECT_ID uniqueidentifier;
alter table DF_DOC add constraint FK_TM_TASK_PROJECT foreign key(PROJECT_ID) references TM_PROJECT(ID)^

update T set T.PROJECT_ID =
(select top(1) C.PROJECT_ID from TM_CARD_PROJECT C where C.CARD_ID = T.CARD_ID)
from TM_TASK T^