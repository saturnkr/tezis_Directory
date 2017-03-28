-- $Id: 04-085-renamePermissionFunction.sql 3799 2012-01-30 12:18:32Z pavlov $
-- Description:

drop function if exists create_or_update_sec_permisson(character varying, character varying, integer, integer);

CREATE OR REPLACE FUNCTION create_or_update_sec_permission
(
  varchar(255), -- sec_role.name
  varchar(100), -- sec_permission.target
  integer,  -- sec_permission.type
  integer  -- sec_permission.value
) RETURNS varchar AS $$
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
        update SEC_PERMISSION set  type = p_type, value = p_value
        where id = p_id;
        return 'SEC_PERMISSION record was updated';
    else
        insert into SEC_PERMISSION (
          id,
          create_ts,
          created_by,
          version,
          type,
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
$$ LANGUAGE plpgsql^