--$Id: 05-090-addAvailableForAllColumn.sql 5444 2012-07-04 10:49:19Z kozyaikin $
--Description:
ALTER TABLE df_doc ADD COLUMN available_for_all boolean^
UPDATE df_doc SET available_for_all=global WHERE is_template=false^