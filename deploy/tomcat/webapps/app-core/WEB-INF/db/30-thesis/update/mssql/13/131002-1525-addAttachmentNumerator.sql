-- $Id$
-- $Description:


insert into DF_NUMERATOR (id, create_ts, created_by, version, name, script)
values (newid(), current_timestamp, USER, 1, 'Вложения',
'String docNum= "док_"
 if(binding.variables.containsKey("resNum")) {
     docNum=  docNum+ resNum.getRegNumber()
 }
 return docNum'
)^
