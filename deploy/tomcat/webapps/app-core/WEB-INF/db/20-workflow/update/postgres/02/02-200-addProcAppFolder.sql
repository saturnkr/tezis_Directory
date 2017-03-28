-- $Id$
-- Description:

CREATE TABLE WF_PROC_APP_FOLDER
(
  FOLDER_ID uuid,
  PROC_CONDITIONS_XML text
)^

alter table WF_PROC_APP_FOLDER add constraint FK_WF_PROC_APP_FOLDER_APP_FOLDER foreign key (FOLDER_ID) references SYS_APP_FOLDER (FOLDER_ID);