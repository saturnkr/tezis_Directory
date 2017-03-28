--$Id: 130927-1600-removeWrongCreatedFiles.sql 12056 2013-09-27 12:16:20Z pavlov $
--$Description :


delete from sys_file  where name is null and id not in (select file_id from wf_attachment);