--$Id: 140113-1350-updateWorkCalendar.sql 18620 2015-01-16 08:41:27Z kovalenko $
--$Description: work calendar 2014

delete from WF_CALENDAR where WORK_DAY is not null;
insert into WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) values (newid(), now(), 'admin', '2014-01-01');
insert into WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) values (newid(), now(), 'admin', '2014-01-02');
insert into WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) values (newid(), now(), 'admin', '2014-01-03');
insert into WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) values (newid(), now(), 'admin', '2014-01-06');
insert into WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) values (newid(), now(), 'admin', '2014-01-07');
insert into WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) values (newid(), now(), 'admin', '2014-01-08');
insert into WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) values (newid(), now(), 'admin', '2014-03-10');
insert into WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) values (newid(), now(), 'admin', '2014-05-01');
insert into WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) values (newid(), now(), 'admin', '2014-05-02');
insert into WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) values (newid(), now(), 'admin', '2014-05-09');
insert into WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) values (newid(), now(), 'admin', '2014-06-12');
insert into WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) values (newid(), now(), 'admin', '2014-06-13');
insert into WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) values (newid(), now(), 'admin', '2014-11-03');
insert into WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) values (newid(), now(), 'admin', '2014-11-04');
