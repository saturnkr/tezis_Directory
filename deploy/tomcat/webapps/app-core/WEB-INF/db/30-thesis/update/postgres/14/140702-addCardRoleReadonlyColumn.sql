-- $Id: 140702-addCardRoleReadonlyColumn.sql 16604 2014-07-04 08:11:17Z chekashkin $
-- Description:

alter table wf_card_role add column readonly boolean;

update wf_card_role set readonly = false where readonly is null^