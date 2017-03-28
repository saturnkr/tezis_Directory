--$Id: 131022-1521-addAssignmentToResolutionWaiting.sql 17498 2014-09-19 13:25:43Z novikova $
--Description:

alter table DF_RESOLUTION_WAITING_COMPLETE add ASSIGNMENT_ID uuid;

alter table DF_RESOLUTION_WAITING_COMPLETE add constraint FK_DF_RESOLUTION_WAITING_ASSIGNMENT foreign key (ASSIGNMENT_ID) references WF_ASSIGNMENT(ID);