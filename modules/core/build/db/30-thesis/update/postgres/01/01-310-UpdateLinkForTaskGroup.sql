-- $Id: 01-310-UpdateLinkForTaskGroup.sql 397 2010-08-01 10:56:55Z novikov $
-- Description:

CREATE OR REPLACE FUNCTION curupdate()
RETURNS integer
AS $$
DECLARE
    varTG uuid;
    vart uuid;
    cur CURSOR IS select t.TASK_GROUP_ID, t.CARD_ID from TM_TASK t where t.TASK_GROUP_ID is not null;
    r integer:=0;
BEGIN
  OPEN cur;
  loop
     FETCH cur INTO varTg, varT;
     EXIT WHEN not FOUND ;
     if varTg is not null and varT is not null then
       insert into TM_TASK_GROUP_TASK (ID, TASK_GROUP_ID,TASK_ID)VALUES(newId(),varTG,varT);
       update TM_TASK set TASK_GROUP_ID =null where CARD_ID = varT;
     end if;
   end loop;
   CLOSE cur;
   return r;
END;
$$
LANGUAGE plpgsql^
select curupdate()^
drop function if exists curupdate()^