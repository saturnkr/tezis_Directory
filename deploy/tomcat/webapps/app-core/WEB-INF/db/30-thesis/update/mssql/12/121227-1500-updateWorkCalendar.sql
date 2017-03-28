--$Id$
--$Description: work calendar 2013

delete from WF_CALENDAR where WORK_DAY is not null;
insert into WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) values (newid(), CURRENT_TIMESTAMP, 'admin', {d '2013-01-01'});
insert into WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) values (newid(), CURRENT_TIMESTAMP, 'admin', {d '2013-01-02'});
insert into WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) values (newid(), CURRENT_TIMESTAMP, 'admin', {d '2013-01-03'});
insert into WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) values (newid(), CURRENT_TIMESTAMP, 'admin', {d '2013-01-04'});
insert into WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) values (newid(), CURRENT_TIMESTAMP, 'admin', {d '2013-01-07'});
insert into WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) values (newid(), CURRENT_TIMESTAMP, 'admin', {d '2013-01-08'});
insert into WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) values (newid(), CURRENT_TIMESTAMP, 'admin', {d '2013-03-08'});
insert into WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) values (newid(), CURRENT_TIMESTAMP, 'admin', {d '2013-05-01'});
insert into WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) values (newid(), CURRENT_TIMESTAMP, 'admin', {d '2013-05-02'});
insert into WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) values (newid(), CURRENT_TIMESTAMP, 'admin', {d '2013-05-03'});
insert into WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) values (newid(), CURRENT_TIMESTAMP, 'admin', {d '2013-05-09'});
insert into WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) values (newid(), CURRENT_TIMESTAMP, 'admin', {d '2013-05-10'});
insert into WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) values (newid(), CURRENT_TIMESTAMP, 'admin', {d '2013-06-12'});
insert into WF_CALENDAR (ID, CREATE_TS, CREATED_BY, WORK_DAY) values (newid(), CURRENT_TIMESTAMP, 'admin', {d '2013-11-04'});