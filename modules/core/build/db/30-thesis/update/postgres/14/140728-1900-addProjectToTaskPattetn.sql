--$Id: 140728-1900-addProjectToTaskPattetn.sql 16867 2014-07-28 14:57:15Z saiyan $

alter table TM_TASK_PATTERN add PROJECT_ID UUID;

alter table TM_TASK_PATTERN add constraint FK_TASK_PATTERN_PROJECT foreign key(PROJECT_ID) references TM_PROJECT(ID);