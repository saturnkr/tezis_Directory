--$Id: 150512-1240-dropColumnDescDocOfficeData.sql 20049 2015-05-12 08:58:34Z stekolschikov $

alter table DF_DOC_OFFICE_DATA drop column if exists TYPE;