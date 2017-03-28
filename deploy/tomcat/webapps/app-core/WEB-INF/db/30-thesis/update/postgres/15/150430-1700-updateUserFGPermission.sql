--$Id: 150430-1700-updateUserFGPermission.sql 20010 2015-04-30 13:02:56Z saiyan $

delete from sec_permission where target = 'tm$User.edit:fieldGroup';

select create_or_update_sec_permission('SimpleUser', 'tm$User.edit:fieldGroupLeft', 50, 1)^
select create_or_update_sec_permission('SimpleUser', 'tm$User.edit:fieldGroupRight', 50, 1)^
