--$Id: 130614-1536-updateConfigInitDefaultInFirstStart.sql 10323 2013-06-14 11:50:44Z zudin $
--Description:

update sys_config set value = true where name  = 'thesis.initDefaultInFirstStart';