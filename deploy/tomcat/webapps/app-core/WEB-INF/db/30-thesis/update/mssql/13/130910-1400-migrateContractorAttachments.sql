--$Id: 130910-1400-migrateContractorAttachments.sql 11942 2013-09-22 10:28:21Z saiyan $
--$Description : ContractorAttachment will be excluded

update WF_ATTACHMENT set CORRESPONDENT_ID = CONTRACTOR_ID, ATTACHMENT_TYPE = 'G' where CONTRACTOR_ID is not null;

alter table WF_ATTACHMENT drop column CONTRACTOR_ID ^

delete from SEC_PERMISSION where id in
('3026c2c9-af5a-437e-ae13-417eb494d626', '33328d9c-310c-4ec0-8f3b-8869600676dd', '43e56800-d284-4737-a3bb-e2c2a98039fa',
 '7afc3cf7-d986-4503-9158-639468060055', '96b380dc-bd11-4139-8422-7faa1682c94c', 'fb27bee5-3042-4489-9603-a0b062b9932a');

delete from SEC_LOGGED_ATTR where entity_id in (select id from SEC_LOGGED_ENTITY where name = 'com.haulmont.thesis.core.entity.ContractorAttachment');
delete from SEC_LOGGED_ENTITY where name = 'com.haulmont.thesis.core.entity.ContractorAttachment'^