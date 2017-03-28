-- $Id: 03-330-addSecPermissions.sql 11283 2013-08-12 09:34:32Z pavlov $

insert into SEC_PERMISSION (id, type, target, value, role_id)
values (newid(), 10, 'tm$TaskGroupPattern.browse', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c')^
insert into SEC_PERMISSION (id, type, target, value, role_id)
values (newid(), 10, 'tm$TaskGroupPattern.browse', 1, 'f7ff1ec7-802d-4a42-a7db-1a97e17f893f')^