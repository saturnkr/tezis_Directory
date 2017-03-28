alter table DF_ORGANIZATION add column TYPE varchar(1)^
update DF_ORGANIZATION set TYPE = 'T'^

alter table TM_TASK_GROUP add column TYPE varchar(1)^
update TM_TASK_GROUP set TYPE = 'T'^