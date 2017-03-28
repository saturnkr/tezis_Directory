-- $Id: 04-530-addSubdivisionRole.sql 5017 2012-05-17 11:17:04Z Novikov $
-- Description:
INSERT INTO SEC_ROLE (ID, CREATE_TS, CREATED_BY, VERSION, NAME, LOC_NAME) VALUES ('2ba2e5ca-a00d-11e1-82a7-832770c8a361', now(), USER, 1, 'SubdivisionChief', 'Начальник подразделения');

UPDATE SEC_USER_ROLE SET ROLE_ID = '2ba2e5ca-a00d-11e1-82a7-832770c8a361'
WHERE ROLE_ID = '5cd3839e-781b-487f-8810-4091943da63b'
AND EXISTS (SELECT u.ID FROM SEC_USER u where u.ID = USER_ID AND u.GROUP_ID in (
select g.ID from SEC_GROUP g where g.NAME like '%Руководитель подразделения%'
));