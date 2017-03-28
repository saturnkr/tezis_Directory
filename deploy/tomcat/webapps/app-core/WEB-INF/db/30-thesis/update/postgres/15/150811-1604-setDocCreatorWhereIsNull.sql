-- $Id: 150811-1604-setDocCreatorWhereIsNull.sql 22265 2015-10-22 06:06:05Z timokhov $
-- Description:

update wf_card set creator_id  = (select id from sec_user where login = wf_card.created_by limit 1) where creator_id is NULL;