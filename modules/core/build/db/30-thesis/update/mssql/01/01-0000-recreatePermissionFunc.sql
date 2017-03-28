-- $Id: 01-0000-recreatePermissionFunc.sql 12787 2013-10-25 10:55:08Z saiyan $
-- Description: function is replaced to the top of the list to be executed first


DROP PROCEDURE create_or_update_sec_permission
^

CREATE PROCEDURE create_or_update_sec_permission

  @r_name varchar(255), -- sec_role.name
  @p_target varchar(100), -- sec_permission.target
  @p_type integer,  -- sec_permission.PERMISSION_TYPE
  @p_value integer  -- sec_permission.value
AS
BEGIN
	DECLARE @p_id uniqueidentifier;
	DECLARE @temp_id uniqueidentifier;
    Select @p_id = NULL;
    select TOP 1 @p_id = p.id from SEC_PERMISSION p
        join SEC_ROLE r on r.id = p.role_id
        where r.name = @r_name and p.target = @p_target;
--   return p_id;
   if  @p_id is not null  begin
        update SEC_PERMISSION set  PERMISSION_TYPE = @p_type, value = @p_value where id = @p_id;
        PRINT 'SEC_PERMISSION record was updated';
    end else begin
        select @temp_id = (select id from sec_role where name=@r_name);
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
          current_timestamp,
          USER,
          1,
          @p_type,
          @p_target,
          @p_value,
          @temp_id
        );
        PRINT 'SEC_PERMISSION record was created';
    end;
END;