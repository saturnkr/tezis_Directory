--$Id: 04-240-addRegFieldsToDoc.sql 3503 2011-12-22 07:46:49Z shishov $

alter table DF_DOC add column REG_NO varchar(50), add column REG_DATE date;

CREATE OR REPLACE FUNCTION doc_update()
RETURNS integer
AS $$
DECLARE
    id uuid;
    in_no varchar(50);
    out_no varchar(50);
    in_date date;
    out_date date;
    d_kind varchar(1);
    cur CURSOR IS select CARD_ID, DOC_OFFICE_DOC_KIND, OUTCOME_NO, INCOME_NO, OUTCOME_DATE, INCOME_DATE from DF_DOC where DOC_OFFICE_DOC_KIND is not null;
    r integer:=0;
BEGIN
  OPEN cur;
  loop
    FETCH cur INTO id, d_kind, out_no, in_no, out_date, in_date;
    EXIT WHEN not FOUND ;
    if d_kind = 'O' then
      update DF_DOC set REG_NO = out_no, REG_DATE = out_date where CARD_ID = id;
    else
      update DF_DOC set REG_NO = in_no, REG_DATE = in_date where CARD_ID = id;
    end if;
  end loop;
  CLOSE cur;
  return r;
END;
$$
LANGUAGE plpgsql^
select doc_update()^
drop function if exists doc_update()^
