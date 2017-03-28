-- $Id: 150320-1300-updateProjectTask.sql 19523 2015-03-20 09:17:28Z hasanov $
-- Description:

update T set PROJECT_ID =
(select top 1 C.PROJECT_ID from TM_CARD_PROJECT C where C.CARD_ID = T.CARD_ID)
from TM_TASK T where PROJECT_ID IS NULL