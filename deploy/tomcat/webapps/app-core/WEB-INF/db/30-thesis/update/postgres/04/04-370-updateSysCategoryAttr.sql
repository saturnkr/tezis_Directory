--$Id: 04-370-updateSysCategoryAttr.sql 11308 2013-08-14 16:09:28Z pavlov $

update sys_category_attr set data_type = 'com.haulmont.cuba.security.entity.User' where data_type = 'com.haulmont.thesis.core.entity.TmUser';