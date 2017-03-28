-- $Id: 150731-1245-deletePermissionForReferenceEditor.sql 20970 2015-07-31 09:53:47Z mishunin $
-- Description:

delete from sec_permission where role_id = '0038f3db-ac9c-4323-83e7-356996cc63ae' and target = 'tm$TaskPattern:create';