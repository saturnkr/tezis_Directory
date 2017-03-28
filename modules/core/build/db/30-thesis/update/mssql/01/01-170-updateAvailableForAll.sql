--$Id: 01-170-updateAvailableForAll.sql 5585 2012-07-19 13:12:51Z kozyaikin $
UPDATE df_doc SET available_for_all=0 WHERE available_for_all is NULL^