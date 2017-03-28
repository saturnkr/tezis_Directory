--$Id: 01-140-addAvailableForAllColumn.sql 5460 2012-07-06 09:00:11Z subbotin $
--Description:
ALTER TABLE df_doc ADD available_for_all tinyint^
UPDATE df_doc SET available_for_all=global WHERE is_template=0^