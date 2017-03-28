-- $Id: 03-250-addSecPermissionForDocReceivingMethod.sql 2666 2011-09-19 13:53:28Z ternovsky $

insert into SEC_PERMISSION (ID, TYPE, TARGET, VALUE, ROLE_ID) values (newid(), 20, 'df$DocReceivingMethod:create', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c')^
insert into SEC_PERMISSION (ID, TYPE, TARGET, VALUE, ROLE_ID) values (newid(), 20, 'df$DocReceivingMethod:update', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c')^
insert into SEC_PERMISSION (ID, TYPE, TARGET, VALUE, ROLE_ID) values (newid(), 20, 'df$DocReceivingMethod:delete', 0, '96fa7fe9-397d-4bac-b14a-eec2d94de68c')^

insert into SEC_PERMISSION (ID, TYPE, TARGET, VALUE, ROLE_ID) values (newid(), 20, 'df$DocReceivingMethod:create', 1, '0038f3db-ac9c-4323-83e7-356996cc63ae')^
insert into SEC_PERMISSION (ID, TYPE, TARGET, VALUE, ROLE_ID) values (newid(), 20, 'df$DocReceivingMethod:update', 1, '0038f3db-ac9c-4323-83e7-356996cc63ae')^
insert into SEC_PERMISSION (ID, TYPE, TARGET, VALUE, ROLE_ID) values (newid(), 20, 'df$DocReceivingMethod:delete', 1, '0038f3db-ac9c-4323-83e7-356996cc63ae')^

insert into SEC_PERMISSION (ID, TYPE, TARGET, VALUE, ROLE_ID) values (newid(), 20, 'df$DocReceivingMethod:create', 1, '7091f5ef-a77a-450a-834a-39406885676e')^
insert into SEC_PERMISSION (ID, TYPE, TARGET, VALUE, ROLE_ID) values (newid(), 20, 'df$DocReceivingMethod:update', 1, '7091f5ef-a77a-450a-834a-39406885676e')^
insert into SEC_PERMISSION (ID, TYPE, TARGET, VALUE, ROLE_ID) values (newid(), 20, 'df$DocReceivingMethod:delete', 1, '7091f5ef-a77a-450a-834a-39406885676e')^