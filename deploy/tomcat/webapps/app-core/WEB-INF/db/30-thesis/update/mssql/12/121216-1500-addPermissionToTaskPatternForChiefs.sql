-- $Id: 121216-1500-addPermissionToTaskPatternForChiefs.sql 7483 2013-01-22 08:31:41Z pavlov $
-- Description:

DECLARE @idDep uniqueidentifier;
DECLARE @idPod uniqueidentifier;
set @idDep = (select TOP 1 g.ID from SEC_GROUP g where g.NAME like '%Руководитель департамента%');
set @idPod = (select TOP 1 g.ID from SEC_GROUP g where g.NAME like '%Руководитель подразделения%');

INSERT INTO sec_constraint (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id)
VALUES (newid(), current_timestamp,'admin', 1,current_timestamp, 'admin',null,null, 'tm$TaskPattern',', ts$CardAcl acl','{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)', @idDep);
INSERT INTO sec_constraint (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id)
VALUES (newid(), current_timestamp,'admin', 1,current_timestamp, 'admin',null,null, 'tm$TaskPattern',', ts$CardAcl acl','{E}.id = acl.card.id and (acl.user.id = :session$userId or acl.global = true)', @idPod);
^