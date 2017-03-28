-- $Id: 150729-1151-addProcReassignEnabledColumn.sql 20913 2015-07-29 10:23:36Z chekashkin $
-- Description:

alter table WF_PROC add column PARTICIPANTS_CHANGE_ENABLED boolean;
update WF_PROC set PARTICIPANTS_CHANGE_ENABLED = false where PARTICIPANTS_CHANGE_ENABLED is null;
update WF_PROC set PARTICIPANTS_CHANGE_ENABLED = true where jbpm_process_key = 'Acquaintance';