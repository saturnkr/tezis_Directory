-- $Id: 01-260-alterNameLength.sql 1642 2011-03-28 10:23:43Z pavlov $
-- Description:

ALTER TABLE TM_TASK_GROUP ALTER "name" TYPE character varying(100);
ALTER TABLE TM_PROJECT ALTER "name" TYPE character varying(100);
ALTER TABLE TM_PROJECT_GROUP ALTER "name" TYPE character varying(100);
ALTER TABLE TM_TASK_TYPE ALTER "name" TYPE character varying(100);