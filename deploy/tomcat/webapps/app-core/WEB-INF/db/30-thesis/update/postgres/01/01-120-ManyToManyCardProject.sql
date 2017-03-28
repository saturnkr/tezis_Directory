-- $Id: 01-120-ManyToManyCardProject.sql 158 2010-05-05 14:38:30Z pavlov $
-- Description: Create ManyToMany relationship between Card and Project

create table TM_CARD_PROJECT (
    CARD_ID uuid,
    PROJECT_ID uuid
);

alter table TM_CARD_PROJECT add constraint FK_TM_CP_CARD foreign key (CARD_ID) references WF_CARD(ID);
alter table TM_CARD_PROJECT add constraint FK_TM_CP_PROJECT foreign key (PROJECT_ID) references TM_PROJECT(ID);

alter table TM_TASK drop column PROJECT_ID;
alter table TM_TASK_PATTERN drop column PROJECT_ID;
alter table TM_TASK_VERSION drop column PROJECT_ID;

alter table DF_DOC drop column PROJECT_ID;