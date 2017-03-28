-- $Id: 02-240-renameDescriptionInCard.sql 1795 2011-04-26 06:41:30Z novikov $
-- Description
update WF_CARD c set DESCRIPTION =
case
when DOC_OFFICE_DOC_KIND = 'O' then NAME||' № '||OUTCOME_NO||(case when OUTCOME_DATE is null then '' else ' от '||to_char(OUTCOME_DATE, 'DD.mm.YYYY') end)
else NAME||' № '||INCOME_NO||(case when INCOME_DATE is null then '' else ' от '||to_char(INCOME_DATE, 'DD.mm.YYYY') end)
end
from DF_DOC
left join DF_DOC_KIND on DF_DOC_KIND.ID = DF_DOC.DOC_KIND_ID
where REGISTERED is true
and card_id = c.id^