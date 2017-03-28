 -- $Id$
 ^
select create_or_update_sec_permission('ReferenceEditor', 'df$CorrespondentAttachment:create', 20, 1)^
select create_or_update_sec_permission('ReferenceEditor', 'df$CorrespondentAttachment:update', 20, 1)^
select create_or_update_sec_permission('ReferenceEditor', 'df$CorrespondentAttachment:delete', 20, 1)^

select create_or_update_sec_permission('Administrators', 'df$CorrespondentAttachment:create', 20, 1)^
select create_or_update_sec_permission('Administrators', 'df$CorrespondentAttachment:update', 20, 1)^
select create_or_update_sec_permission('Administrators', 'df$CorrespondentAttachment:delete', 20, 1)^

select create_or_update_sec_permission('SimpleUser', 'df$CorrespondentAttachment:create', 20, 0)^
select create_or_update_sec_permission('SimpleUser', 'df$CorrespondentAttachment:update', 20, 0)^
select create_or_update_sec_permission('SimpleUser', 'df$CorrespondentAttachment:delete', 20, 0)^

select create_or_update_sec_permission('ReferenceEditor', 'df$OrganizationAttachment:create', 20, 1)^
select create_or_update_sec_permission('ReferenceEditor', 'df$OrganizationAttachment:update', 20, 1)^
select create_or_update_sec_permission('ReferenceEditor', 'df$OrganizationAttachment:delete', 20, 1)^

select create_or_update_sec_permission('Administrators', 'df$OrganizationAttachment:create', 20, 1)^
select create_or_update_sec_permission('Administrators', 'df$OrganizationAttachment:update', 20, 1)^
select create_or_update_sec_permission('Administrators', 'df$OrganizationAttachment:delete', 20, 1)^

select create_or_update_sec_permission('SimpleUser', 'df$OrganizationAttachment:create', 20, 0)^
select create_or_update_sec_permission('SimpleUser', 'df$OrganizationAttachment:update', 20, 0)^
select create_or_update_sec_permission('SimpleUser', 'df$OrganizationAttachment:delete', 20, 0)^
