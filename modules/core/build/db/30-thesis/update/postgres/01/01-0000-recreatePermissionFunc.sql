-- $Id: 01-0000-recreatePermissionFunc.sql 12781 2013-10-25 09:55:02Z saiyan $
-- Description: function is replaced to the top of the list to be executed first

CREATE OR REPLACE FUNCTION create_or_update_sec_permission
(
  varchar(255), -- sec_role.name
  varchar(100), -- sec_permission.target
  integer,  -- sec_permission.type
  integer  -- sec_permission.value
) RETURNS varchar AS $BODY$
DECLARE
     r_name alias for $1;
     p_target alias for $2;
     p_type alias for $3;
     p_value alias for $4;

     p_id uuid;
BEGIN
    p_id = NULL;
    select p.id from SEC_PERMISSION p
        join SEC_ROLE r on r.id = p.role_id
        where r.name = r_name and p.target = p_target limit 1 into p_id;
--   return p_id;
   if  p_id is not null  then
        update SEC_PERMISSION set  PERMISSION_TYPE = p_type, value = p_value
        where id = p_id;
        return 'SEC_PERMISSION record was updated';
    else
        insert into SEC_PERMISSION (
          id,
          create_ts,
          created_by,
          version,
          PERMISSION_TYPE,
          target,
          value,
          role_id
        ) values (
          newid(),
          now(),
          USER,
          1,
          p_type,
          p_target,
          p_value,
          (select id from sec_role where name=r_name)
        );
        return 'SEC_PERMISSION record was created';
    end if;
END;
$BODY$ LANGUAGE plpgsql;