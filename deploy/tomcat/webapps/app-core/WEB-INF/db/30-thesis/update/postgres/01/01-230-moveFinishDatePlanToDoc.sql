-- $Id: 01-230-moveFinishDatePlanToDoc.sql 386 2010-06-22 08:10:14Z gorbunkov $
-- Description: move FINISH_DATE_PLAN column to DF_DOC

alter table DF_DOC_OFFICE_DATA drop FINISH_DATE_PLAN;

alter table DF_DOC add FINISH_DATE_PLAN date;