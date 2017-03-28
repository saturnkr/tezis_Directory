--$Id: 140812-1250-updateExtendedMetaClassName.sql 17050 2014-08-12 11:51:35Z stekolschikov $

update DF_DOC_TYPE
set NAME = 'df$Contract', DISCRIMINATOR = '120'
where ID = 'ae67f5f6-35aa-11df-a04a-3345dd531def';

update DF_DOC_TYPE
set NAME = 'df$SimpleDoc', DISCRIMINATOR = '110'
where ID = '1665ef30-2b44-11df-b1c6-bf8783a93da6';

update DF_IMPORT_DATA_TYPE
set META_CLASS_NAME = 'df$Contract'
where ID = '33433e50-a38c-11e2-9506-a71c3d8f3fe2';

update DF_IMPORT_DATA_TYPE
set META_CLASS_NAME = 'df$SimpleDoc'
where ID = 'ff801f90-a389-11e2-a895-f7261fdb7f5a';