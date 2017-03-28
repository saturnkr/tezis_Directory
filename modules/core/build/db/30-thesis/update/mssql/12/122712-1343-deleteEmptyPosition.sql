--$Id: 122712-1343-deleteEmptyPosition.sql 7304 2012-12-27 13:56:15Z kozyaikin $
--Description
DECLARE @dfpId uniqueidentifier;

select @dfpId= id from  DF_POSITION where name is null or name='';
update DF_EMPLOYEE set position_id=null where position_id in(@dfpId)^
delete from DF_POSITION where name is null or name=''^