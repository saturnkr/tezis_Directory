alter table DF_DOC add CREATE_DATE date;

update DF_DOC set CREATE_DATE = (select CREATE_TS from WF_CARD where ID = CARD_ID);