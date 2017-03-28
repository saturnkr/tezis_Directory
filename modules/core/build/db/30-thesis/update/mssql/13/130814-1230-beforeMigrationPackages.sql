delete from SEC_LOGGED_ATTR where ENTITY_ID in
(select ID from SEC_LOGGED_ENTITY where NAME = 'com.haulmont.taskman.core.entity.OrganizationAttachment');

delete from SEC_LOGGED_ENTITY where NAME = 'com.haulmont.taskman.core.entity.OrganizationAttachment';