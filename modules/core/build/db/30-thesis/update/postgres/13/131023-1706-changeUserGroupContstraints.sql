-- $Id: 131023-1706-changeUserGroupContstraints.sql 12740 2013-10-23 13:24:28Z chekashkin $
-- Description:

update SEC_CONSTRAINT set ENTITY_NAME = 'wf$UserGroup' where ENTITY_NAME = 'tm$UserGroup';