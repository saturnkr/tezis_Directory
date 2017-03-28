-- $Id: 01-500-updateScheduleTaskAndOfficeFileNomenclature.sql 3787 2012-01-30 10:37:30Z pavlov $
-- Description:

alter table TM_SCHEDULE_TASK add SUBSTITUTED_CREATOR_ID uuid;

alter table TM_SCHEDULE_TASK add constraint FK_TM_SCHEDULE_TASK_TO_SEC_USER
foreign key (SUBSTITUTED_CREATOR_ID) references SEC_USER(ID);

-------------------------------------------------------------------------------------------------------------
alter table DF_OFFICE_FILE_NOMENCLATURE add SUBSTITUTED_CREATOR_ID uuid;

alter table DF_OFFICE_FILE_NOMENCLATURE add constraint FK_DF_OFFICE_FILE_NOMENCLATURE_TO_SEC_USER
foreign key (SUBSTITUTED_CREATOR_ID) references SEC_USER(ID);

alter table DF_OFFICE_FILE add SUBSTITUTED_CREATOR_ID uuid;
alter table DF_OFFICE_FILE add constraint FK_DF_OFFICE_FILE_TO_SEC_USER
foreign key (SUBSTITUTED_CREATOR_ID) references SEC_USER(ID);