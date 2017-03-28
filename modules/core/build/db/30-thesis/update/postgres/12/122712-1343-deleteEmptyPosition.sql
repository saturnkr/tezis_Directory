--$Id: 122712-1343-deleteEmptyPosition.sql 7299 2012-12-27 12:10:19Z kozyaikin $
--Description

update DF_EMPLOYEE set position_id=null where position_id in(select id from  DF_POSITION where name is null or name='')^
delete from DF_POSITION where name is null or name=''^