--$Id: 01-200-addTypeInBank.sql 6007 2012-09-20 14:07:26Z kozyaikin $
--Description:
ALTER TABLE DF_BANK ADD TYPE varchar(2)^
UPDATE DF_BANK set TYPE='SB'^