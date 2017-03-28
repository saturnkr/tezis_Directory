-- $Id: 140414-1011-updateDepartmentCardAcl.sql 15701 2014-04-14 09:25:15Z kozyaikin $
-- Description:

INSERT INTO TS_CARD_ACL (id, create_ts, created_by, card_id, department_id, global)
     SELECT newid() ,now(), 'admin', d.card_id, d.department_id, false from df_Doc d where not d.department_id  is null^