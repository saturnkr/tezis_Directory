-- $Id: 150811-1604-setDocCreatorWhereIsNull.sql 22286 2015-10-22 13:06:09Z timokhov $
-- Description:

update wf_card set creator_id  = (select top 1 id from sec_user where login = wf_card.created_by) where creator_id is NULL;