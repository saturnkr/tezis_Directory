-- $Id: 150729-1636-updateCardDiscriminator.sql 21452 2015-08-27 09:29:03Z kozyaikin $
-- Description:

update WF_CARD set CARD_TYPE = 77 where CARD_TYPE = 0;