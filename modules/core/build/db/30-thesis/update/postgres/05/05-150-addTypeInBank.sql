--$Id: 05-150-addTypeInBank.sql 6004 2012-09-20 12:39:41Z kozyaikin $
--Description:
ALTER TABLE DF_BANK ADD COLUMN TYPE varchar(2)^
UPDATE DF_BANK set TYPE='SB'^