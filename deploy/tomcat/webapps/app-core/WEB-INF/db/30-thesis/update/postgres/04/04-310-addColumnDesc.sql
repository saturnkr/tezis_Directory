-- $Id: 04-310-addColumnDesc.sql 3826 2012-02-01 11:25:35Z shatokhin $
-- Description:

alter table DF_DOC_OFFICE_DATA add TYPE integer^

update  DF_DOC_OFFICE_DATA set TYPE = 10;