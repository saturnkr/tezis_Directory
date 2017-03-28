-- $Id: 04-480-updateForRoleReferenceEditor.sql 11283 2013-08-12 09:34:32Z pavlov $
update sec_permission set value=0 where (target='tm$TaskType.browse' or target='tm$TaskPattern.browse')
and role_id=(select id from sec_role where name='ReferenceEditor') and value=1