-- $Id: 150320-1300-updateProjectTask.sql 19523 2015-03-20 09:17:28Z hasanov $
-- Description:

update TM_TASK as T set PROJECT_ID =
(select C.PROJECT_ID from TM_CARD_PROJECT C where C.CARD_ID = T.CARD_ID limit 1) where PROJECT_ID IS NULL