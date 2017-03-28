-- $Id: 04-250-updateCalendar.sql 3963 2012-02-10 14:27:25Z pavlov $
-- Description:
delete from WF_CALENDAR where work_day is not null;
insert into WF_CALENDAR (id, create_ts, created_by, work_day) values (newid(), now(), 'admin', '2012-01-02');
insert into WF_CALENDAR (id, create_ts, created_by, work_day) values (newid(), now(), 'admin', '2012-01-03');
insert into WF_CALENDAR (id, create_ts, created_by, work_day) values (newid(), now(), 'admin', '2012-01-04');
insert into WF_CALENDAR (id, create_ts, created_by, work_day) values (newid(), now(), 'admin', '2012-01-05');
insert into WF_CALENDAR (id, create_ts, created_by, work_day) values (newid(), now(), 'admin', '2012-01-06');
insert into WF_CALENDAR (id, create_ts, created_by, work_day) values (newid(), now(), 'admin', '2012-01-09');
insert into WF_CALENDAR (id, create_ts, created_by, work_day) values (newid(), now(), 'admin', '2012-02-23');
insert into WF_CALENDAR (id, create_ts, created_by, work_day) values (newid(), now(), 'admin', '2012-03-08');
insert into WF_CALENDAR (id, create_ts, created_by, work_day) values (newid(), now(), 'admin', '2012-03-09');
insert into WF_CALENDAR (id, create_ts, created_by, work_day, WORK_START_TIME, WORK_END_TIME)
values (newid(), now(), 'admin', '2012-03-11', '09:00', '13:00');
insert into WF_CALENDAR (id, create_ts, created_by, work_day, WORK_START_TIME, WORK_END_TIME)
values (newid(), now(), 'admin', '2012-03-11', '14:00', '18:00');
insert into WF_CALENDAR (id, create_ts, created_by, work_day, WORK_START_TIME, WORK_END_TIME)
values (newid(), now(), 'admin', '2012-04-28', '09:00', '13:00');
insert into WF_CALENDAR (id, create_ts, created_by, work_day, WORK_START_TIME, WORK_END_TIME)
values (newid(), now(), 'admin', '2012-04-28', '14:00', '18:00');
insert into WF_CALENDAR (id, create_ts, created_by, work_day) values (newid(), now(), 'admin', '2012-04-30');
insert into WF_CALENDAR (id, create_ts, created_by, work_day) values (newid(), now(), 'admin', '2012-05-01');
insert into WF_CALENDAR (id, create_ts, created_by, work_day) values (newid(), now(), 'admin', '2012-05-09');
insert into WF_CALENDAR (id, create_ts, created_by, work_day, WORK_START_TIME, WORK_END_TIME)
values (newid(), now(), 'admin', '2012-06-09', '09:00', '13:00');
insert into WF_CALENDAR (id, create_ts, created_by, work_day, WORK_START_TIME, WORK_END_TIME)
values (newid(), now(), 'admin', '2012-06-09', '14:00', '18:00');
insert into WF_CALENDAR (id, create_ts, created_by, work_day) values (newid(), now(), 'admin', '2012-06-11');
insert into WF_CALENDAR (id, create_ts, created_by, work_day) values (newid(), now(), 'admin', '2012-06-12');
insert into WF_CALENDAR (id, create_ts, created_by, work_day) values (newid(), now(), 'admin', '2012-11-05');
insert into WF_CALENDAR (id, create_ts, created_by, work_day, WORK_START_TIME, WORK_END_TIME)
values (newid(), now(), 'admin', '2012-12-29', '09:00', '13:00');
insert into WF_CALENDAR (id, create_ts, created_by, work_day, WORK_START_TIME, WORK_END_TIME)
values (newid(), now(), 'admin', '2012-12-29', '14:00', '18:00');
insert into WF_CALENDAR (id, create_ts, created_by, work_day) values (newid(), now(), 'admin', '2012-12-31');