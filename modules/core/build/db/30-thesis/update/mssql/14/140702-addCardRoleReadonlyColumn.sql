-- $Id: 140702-addCardRoleReadonlyColumn.sql 16635 2014-07-10 07:23:42Z chekashkin $
-- Description:

alter table wf_card_role add readonly tinyint^

update wf_card_role set readonly = 0 where readonly is null^