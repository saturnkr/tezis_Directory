-- $Id: 150806-1416-initNullParentCardAccesInCard.sql 21094 2015-08-06 11:07:18Z mishunin $
-- Description:

update wf_card set parent_card_access = 0 where parent_card_access is NULL;