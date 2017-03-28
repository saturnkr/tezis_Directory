-- $Id$
-- $Description:

delete from WF_PROC_APP_FOLDER
where FOLDER_ID in (select ID from SYS_FOLDER where NAME = 'AppFolder_doc.streamProcessing');

delete from SYS_APP_FOLDER
where FOLDER_ID in (select ID from SYS_FOLDER where NAME = 'AppFolder_doc.streamProcessing');

delete from SYS_FOLDER where NAME = 'AppFolder_doc.streamProcessing';