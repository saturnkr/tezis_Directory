-- $Id: 03-230-InsertEnablePermission.sql 2643 2011-09-14 13:39:07Z ternovsky $
-- Description:
INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id) VALUES (newid(),now(),USER,1,20,'df$TypicalResolution:create',1,'c06c0cee-2f21-4241-8d6f-76b4cd462f96');
INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id) VALUES (newid(),now(),USER,1,20,'df$TypicalResolution:update',1,'c06c0cee-2f21-4241-8d6f-76b4cd462f96');
INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id) VALUES (newid(),now(),USER,1,20,'df$TypicalResolution:delete',1,'c06c0cee-2f21-4241-8d6f-76b4cd462f96');

INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id) VALUES (newid(),now(),USER,1,20,'df$TypicalResolution:create',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id) VALUES (newid(),now(),USER,1,20,'df$TypicalResolution:update',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id) VALUES (newid(),now(),USER,1,20,'df$TypicalResolution:delete',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');

INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id) VALUES (newid(),now(),USER,1,20,'wf$AttachmentType:create',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id) VALUES (newid(),now(),USER,1,20,'wf$AttachmentType:update',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
INSERT INTO sec_permission (id,create_ts,created_by,version,type,target,value,role_id) VALUES (newid(),now(),USER,1,20,'wf$AttachmentType:delete',1,'0038f3db-ac9c-4323-83e7-356996cc63ae');
