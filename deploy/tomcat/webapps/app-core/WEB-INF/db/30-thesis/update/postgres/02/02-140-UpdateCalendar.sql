-- $Id: 02-140-UpdateCalendar.sql 1680 2011-03-31 09:30:38Z novikov $
-- Description:
delete from WF_CALENDAR where work_day is not null;
insert into WF_CALENDAR (id, create_ts, created_by, work_day) values (newid(), now(), 'admin', '2011-01-03');
insert into WF_CALENDAR (id, create_ts, created_by, work_day) values (newid(), now(), 'admin', '2011-01-04');
insert into WF_CALENDAR (id, create_ts, created_by, work_day) values (newid(), now(), 'admin', '2011-01-05');
insert into WF_CALENDAR (id, create_ts, created_by, work_day) values (newid(), now(), 'admin', '2011-01-06');
insert into WF_CALENDAR (id, create_ts, created_by, work_day) values (newid(), now(), 'admin', '2011-01-07');
insert into WF_CALENDAR (id, create_ts, created_by, work_day) values (newid(), now(), 'admin', '2011-01-10');
insert into WF_CALENDAR (id, create_ts, created_by, work_day) values (newid(), now(), 'admin', '2011-02-23');
insert into WF_CALENDAR (id, create_ts, created_by, work_day, work_start, work_end)
values (newid(), now(), 'admin', '2011-03-05', '09:00', '13:00');
insert into WF_CALENDAR (id, create_ts, created_by, work_day, work_start, work_end)
values (newid(), now(), 'admin', '2011-03-05', '14:00', '18:00');
insert into WF_CALENDAR (id, create_ts, created_by, work_day) values (newid(), now(), 'admin', '2011-03-07');
insert into WF_CALENDAR (id, create_ts, created_by, work_day) values (newid(), now(), 'admin', '2011-03-08');
insert into WF_CALENDAR (id, create_ts, created_by, work_day) values (newid(), now(), 'admin', '2011-05-02');
insert into WF_CALENDAR (id, create_ts, created_by, work_day) values (newid(), now(), 'admin', '2011-05-09');
insert into WF_CALENDAR (id, create_ts, created_by, work_day) values (newid(), now(), 'admin', '2011-06-13');
insert into WF_CALENDAR (id, create_ts, created_by, work_day) values (newid(), now(), 'admin', '2011-11-04');

