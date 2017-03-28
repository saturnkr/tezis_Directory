-- $Id: 150819-1555-addMeetingDocCreatorRoleToAdministrator.sql 21340 2015-08-20 06:58:47Z timokhov $
-- Description:
INSERT INTO SEC_USER_ROLE
    (id, create_ts, created_by, version, user_id, role_id)
SELECT '1186d871-3663-4f29-889b-7d0ffa56b267', current_timestamp, 'admin', 1, '60885987-1b61-4247-94c7-dff348347f93', '80145594-f020-e85c-d259-7a293c035495'
WHERE
    NOT EXISTS (
        select * from SEC_USER_ROLE where id = '1186d871-3663-4f29-889b-7d0ffa56b267'
        or (user_id = '60885987-1b61-4247-94c7-dff348347f93' and role_id = '80145594-f020-e85c-d259-7a293c035495')
    );

