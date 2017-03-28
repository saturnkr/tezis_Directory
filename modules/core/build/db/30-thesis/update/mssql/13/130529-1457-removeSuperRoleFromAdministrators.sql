-- $Id$
update SEC_ROLE set ROLE_TYPE = 0 where ROLE_TYPE = 10;

delete ur from SEC_USER_ROLE ur where ur.ROLE_ID = (select ID from SEC_ROLE where NAME = 'SimpleUser')
and exists (select 1 from SEC_USER_ROLE where ROLE_ID = (select ID from SEC_ROLE where NAME = 'Administrators') and USER_ID = ur.USER_ID);
