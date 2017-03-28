--$Id: 140124-1100-updateSmsProviderConfig.sql 14535 2014-01-24 06:58:18Z saiyan $
--$Description : update package for default sms provider class

update SYS_CONFIG set VALUE = 'com.haulmont.thesis.core.app.SmsTrafficProvider'
where NAME = 'workflow.sms.smsProviderClassName' and VALUE = 'com.haulmont.taskman.core.app.SmsTrafficProvider';