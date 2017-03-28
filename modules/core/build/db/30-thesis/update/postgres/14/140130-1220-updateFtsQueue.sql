--$Id: 140130-1220-updateFtsQueue.sql 15096 2014-02-24 08:37:12Z zudin $
--$Description:

update sys_fts_queue set entity_name = 'ts$CardAttachment' where entity_name = 'wf$CardAttachment';
update sys_fts_queue set entity_name = 'sys$FileDescriptor' where entity_name = 'core$FileDescriptor';
update sys_fts_queue set entity_name = 'df$CorrespondentAttachment' where entity_name = 'df$ContractorAttachment'