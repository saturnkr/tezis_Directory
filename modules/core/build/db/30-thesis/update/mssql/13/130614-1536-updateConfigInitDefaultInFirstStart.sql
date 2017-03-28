--$Id: 130614-1536-updateConfigInitDefaultInFirstStart.sql 12225 2013-10-03 12:03:56Z zudin $
--Description:

update sys_config set value = 'true' where name  = 'thesis.initDefaultInFirstStart';