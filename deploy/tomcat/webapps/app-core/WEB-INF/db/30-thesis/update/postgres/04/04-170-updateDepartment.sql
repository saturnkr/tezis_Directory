-- $Id: 04-170-updateDepartment.sql 3916 2012-02-07 11:53:17Z Novikov $
-- Description:
CREATE OR REPLACE FUNCTION updateDepartmentOrganization()
RETURNS integer
AS $$
DECLARE
	cnt integer = 0;
	idOrg uuid;
BEGIN
cnt = (SELECT count (*) FROM df_organization WHERE id = 'a851beaf-6890-4ab2-b847-b7a810c4c2b9' AND delete_ts IS NULL);
IF (cnt = 0) THEN
    cnt = (SELECT count (*) FROM df_organization WHERE delete_ts IS NULL);
    IF (cnt = 0) THEN
        cnt = (SELECT count (*) FROM df_organization WHERE id = 'a851beaf-6890-4ab2-b847-b7a810c4c2b9');
        IF (cnt = 0) THEN
            INSERT INTO DF_ORGANIZATION (id, create_ts, created_by, version, name, type)
            VALUES ('a851beaf-6890-4ab2-b847-b7a810c4c2b9', '2010-10-28 00:00:00.00', 'admin', 1, 'Наша организация', 'T');
        ELSE
            UPDATE DF_ORGANIZATION SET delete_ts = null, deleted_by = null where id = 'a851beaf-6890-4ab2-b847-b7a810c4c2b9'; 
        END IF;
        idOrg = 'a851beaf-6890-4ab2-b847-b7a810c4c2b9';
    ELSE
        idOrg = (SELECT id FROM df_organization WHERE delete_ts IS NULL LIMIT 1);
    END IF;
ELSE
    idOrg = 'a851beaf-6890-4ab2-b847-b7a810c4c2b9';
END IF;
UPDATE df_correspondent SET organization_id = idOrg WHERE id IN (SELECT correspondent_id FROM df_department
WHERE delete_ts IS NULL ) AND delete_ts IS NULL AND organization_id IS NULL;
return 0;
END;
$$
LANGUAGE plpgsql;
^
SELECT updateDepartmentOrganization();
^
DROP FUNCTION IF EXISTS updateDepartmentOrganization();
^