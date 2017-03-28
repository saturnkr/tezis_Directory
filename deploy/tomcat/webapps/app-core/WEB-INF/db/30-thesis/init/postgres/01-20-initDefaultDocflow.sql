-- $Id: 01-20-initDefaultDocflow.sql 23100 2016-01-12 08:59:26Z tsarev $
-- Description:
--Update Proc an ProcRole--
update WF_PROC set name = 'Acquaintance', participants_change_enabled = true, card_types = ',df$SimpleDoc,df$Contract,df$Doc,' where jbpm_process_key = 'Acquaintance' and updated_by is null;
update WF_PROC set name = 'Registration', card_types = ',df$SimpleDoc,df$Doc,' where jbpm_process_key = 'Registration' and updated_by is null;
update WF_PROC set name = 'Resolution', card_types = ',df$SimpleDoc,df$Doc,' where jbpm_process_key = 'Resolution' and updated_by is null;
--update WF_PROC set name = 'Endorsement (old)', card_types = ',df$SimpleDoc,df$Contract,', combined_stages_enabled = false where jbpm_process_key = 'EndorsementFull' and updated_by is null;
update WF_PROC_ROLE set name = 'Get acquainted', role_id = (select id from SEC_ROLE where name = 'doc_acquaintance'), order_filling_type = 'P', is_multi_user = 'true' where code = 'Acquaintance' and proc_id = (select id from WF_PROC where jbpm_process_key = 'Acquaintance') and updated_by is null;
update WF_PROC_ROLE set name = 'Initiator', role_id = (select id from SEC_ROLE where name = 'doc_initiator') where code = 'Initiator' and proc_id = (select id from WF_PROC where jbpm_process_key = 'Acquaintance') and updated_by is null;
update WF_PROC_ROLE set name = 'Creator' where code = 'CARD_CREATOR' and proc_id = (select id from WF_PROC where jbpm_process_key = 'Acquaintance') and updated_by is null;
update WF_PROC_ROLE set name = 'Creator' where code = 'CARD_CREATOR' and proc_id = (select id from WF_PROC where jbpm_process_key = 'Registration') and updated_by is null;
update WF_PROC_ROLE set name = 'Initiator', role_id = (select id from SEC_ROLE where name = 'doc_initiator') where code = 'Initiator' and proc_id = (select id from WF_PROC where jbpm_process_key = 'Registration') and updated_by is null;
update WF_PROC_ROLE set name = 'Secretary', role_id = (select id from SEC_ROLE where name = 'doc_secretary') where code = 'Secretary' and proc_id = (select id from WF_PROC where jbpm_process_key = 'Registration') and updated_by is null;
update WF_PROC_ROLE set name = 'Creator' where code = 'CARD_CREATOR' and proc_id = (select id from WF_PROC where jbpm_process_key = 'Resolution') and updated_by is null;
update WF_PROC_ROLE set name = 'Initiator', role_id = (select id from SEC_ROLE where name = 'doc_initiator') where code = 'Initiator' and proc_id = (select id from WF_PROC where jbpm_process_key = 'Resolution') and updated_by is null;
update WF_PROC_ROLE set name = 'Affirmant', role_id = (select id from SEC_ROLE where name = 'doc_approver') where code = 'Approver' and proc_id = (select id from WF_PROC where jbpm_process_key = 'Resolution') and updated_by is null;
--update WF_PROC_ROLE set name = 'Affirmant', role_id = (select id from SEC_ROLE where name = 'doc_approver') where code = 'Approver' and proc_id = (select id from WF_PROC where jbpm_process_key = 'EndorsementFull') and updated_by is null;
--update WF_PROC_ROLE set name = 'Creator' where code = 'CARD_CREATOR' and proc_id = (select id from WF_PROC where jbpm_process_key = 'EndorsementFull') and updated_by is null;
--update WF_PROC_ROLE set name = 'Initiator', role_id = (select id from SEC_ROLE where name = 'doc_initiator') where code = 'Initiator' and proc_id = (select id from WF_PROC where jbpm_process_key = 'EndorsementFull') and updated_by is null;
--update WF_PROC_ROLE set name = 'Coordinated', role_id = (select id from SEC_ROLE where name = 'doc_endorsement'), is_multi_user = 'true' where code = 'Endorsement' and proc_id = (select id from WF_PROC where jbpm_process_key = 'EndorsementFull') and updated_by is null;
--update WF_PROC_ROLE set name = 'Coordinated (p)', role_id = (select id from SEC_ROLE where name = 'doc_endorsement'), is_multi_user = 'true' where code = 'EndorsementSeq' and proc_id = (select id from WF_PROC where jbpm_process_key = 'EndorsementFull') and updated_by is null;

update WF_PROC set name = 'Endorsement', card_types = ',df$SimpleDoc,df$Contract,df$Doc,', combined_stages_enabled = true where jbpm_process_key = 'Endorsement' and updated_by is null;
update WF_PROC_ROLE set name = 'Initiator', role_id = (select id from SEC_ROLE where name = 'doc_initiator') where code = 'Initiator' and proc_id = (select id from WF_PROC where jbpm_process_key = 'Endorsement') and updated_by is null;
update WF_PROC_ROLE set name = 'Affirmant', role_id = (select id from SEC_ROLE where name = 'doc_approver') where code = 'Approver' and proc_id = (select id from WF_PROC where jbpm_process_key = 'Endorsement') and updated_by is null;
update WF_PROC_ROLE set name = 'Coordinated', role_id = (select id from SEC_ROLE where name = 'doc_endorsement'), order_filling_type = 'P', is_multi_user = 'true' where code = 'Endorsement' and proc_id = (select id from WF_PROC where jbpm_process_key = 'Endorsement') and updated_by is null;

update DF_DOC_KIND set numerator_id = (select n.id from df_numerator n where n.name = 'Documents and contracts' LIMIT 1 ) where numerator_id is null;

update WF_PROC_ROLE set assign_to_creator='TRUE' where code = 'Initiator';

update wf_proc_role set sort_order = 1 where code = 'Initiator' and proc_id = (select id from wf_proc where code = 'Endorsement') and delete_ts is null;
update wf_proc_role set sort_order = 2 where code = 'Endorsement' and proc_id = (select id from wf_proc where code = 'Endorsement') and delete_ts is null;
update wf_proc_role set sort_order = 3 where code = 'Approver' and proc_id = (select id from wf_proc where code = 'Endorsement') and delete_ts is null;
update wf_proc_role set sort_order = 4 where code = 'CARD_CREATOR' and proc_id = (select id from wf_proc where code = 'Endorsement') and delete_ts is null;

^

CREATE OR REPLACE FUNCTION baseInsert()
RETURNS integer
AS $$
DECLARE
cnt integer = 0;
BEGIN

cnt = (select count(id) from DF_TYPICAL_RESOLUTION where name = 'On approval:');
if(cnt = 0) then
insert into DF_TYPICAL_RESOLUTION (id, create_ts, created_by, version, name, text, global)
values (newid(), now(), USER, 1, 'On approval:', 'On approval:', TRUE);
end if;

cnt = (select count(id) from DF_TYPICAL_RESOLUTION where name = 'To acquaint:');
if(cnt = 0) then
insert into DF_TYPICAL_RESOLUTION (id, create_ts, created_by, version, name, text, global)
values (newid(), now(), USER, 1, 'To acquaint:', 'To acquaint:', TRUE);
end if;

cnt = (select count(id) from DF_NUMERATOR where name = 'Incoming (constr.)' and delete_ts is null);
if(cnt = 0) then
INSERT INTO DF_NUMERATOR (ID, CREATE_TS, CREATED_BY, VERSION, NAME, NUMERATOR_FORMAT, SCRIPT_ENABLED, PERIODICITY)
VALUES (newid(), now(), USER, 1, 'Incoming (constr.)', '[departmentCode][number]', FALSE, 'D');
end if;

cnt = (select count(id) from DF_NUMERATOR where id = 'bebc21e2-fce0-40c6-9202-7cffff7cf88e');
if(cnt = 0) then
insert into DF_NUMERATOR (id, create_ts, created_by, version, name, script)
values ('bebc21e2-fce0-40c6-9202-7cffff7cf88e', now(), USER, 1, 'Incoming',
'def un = com.haulmont.cuba.core.Locator.lookup("cuba_UniqueNumbers")
String numPrefix = "ВХ-"
if(binding.variables.containsKey("doc")) {
com.haulmont.thesis.core.entity.Department department = doc.getDepartment()
if (department && department.getCode()) {
   numPrefix += department.getCode() + "-"
}
}
return numPrefix +String.valueOf( un.getNextNumber("income")).padLeft(5, "0")'
);
else
update DF_NUMERATOR set script = 'def un = com.haulmont.cuba.core.Locator.lookup("cuba_UniqueNumbers")
String numPrefix = "ВХ-"
if(binding.variables.containsKey("doc")) {
com.haulmont.thesis.core.entity.Department department = doc.getDepartment()
if (department && department.getCode()) {
   numPrefix += department.getCode() + "-"
}
}
return numPrefix +String.valueOf( un.getNextNumber("income")).padLeft(5, "0")'
where id = 'bebc21e2-fce0-40c6-9202-7cffff7cf88e';
end if;

cnt = (select count(id) from DF_NUMERATOR where id = '5618547c-a4c9-4bfd-a71e-d884cf49df57');
if(cnt = 0) then
insert into DF_NUMERATOR (id, create_ts, created_by, version, name, script)
values ('5618547c-a4c9-4bfd-a71e-d884cf49df57', now(), USER, 1, 'Outgoing',
'def un = com.haulmont.cuba.core.Locator.lookup("cuba_UniqueNumbers")
String numPrefix = "ИСХ-"
if(binding.variables.containsKey("doc")) {
com.haulmont.thesis.core.entity.Department department = doc.getDepartment()
if (department && department.getCode()) {
   numPrefix += department.getCode() + "-"
}
}
if(binding.variables.containsKey("docOfficeData")) {
com.haulmont.thesis.core.entity.OfficeFile officeFile = docOfficeData.getOfficeFile()
if (officeFile && officeFile.getNomenclature().getIndex() != null &&       officeFile.getNomenclature().getIndex() != "") {
   numPrefix += officeFile.getNomenclature().getIndex() + "-"
}
}
return numPrefix +String.valueOf( un.getNextNumber("outcome")).padLeft(5, "0")'
);
else
update DF_NUMERATOR set script = 'def un = com.haulmont.cuba.core.Locator.lookup("cuba_UniqueNumbers")
String numPrefix = "ИСХ-"
if(binding.variables.containsKey("doc")) {
com.haulmont.thesis.core.entity.Department department = doc.getDepartment()
if (department && department.getCode()) {
   numPrefix += department.getCode() + "-"
}
}
if(binding.variables.containsKey("docOfficeData")) {
com.haulmont.thesis.core.entity.OfficeFile officeFile = docOfficeData.getOfficeFile()
if (officeFile && officeFile.getNomenclature().getIndex() != null &&       officeFile.getNomenclature().getIndex() != "") {
   numPrefix += officeFile.getNomenclature().getIndex() + "-"
}
}
return numPrefix +String.valueOf( un.getNextNumber("outcome")).padLeft(5, "0")'
where id = '5618547c-a4c9-4bfd-a71e-d884cf49df57';
end if;

cnt = (select count(id) from DF_NUMERATOR where id = '36708c7f-e232-4451-a239-3f5a8fa10726');
if(cnt = 0) then
insert into DF_NUMERATOR (id, create_ts, created_by, version, name, script)
values ('36708c7f-e232-4451-a239-3f5a8fa10726', now(), USER, 1, 'Internal',
'def un = com.haulmont.cuba.core.Locator.lookup("cuba_UniqueNumbers")
String numPrefix = ""
if(binding.variables.containsKey("doc")) {
com.haulmont.thesis.core.entity.DocKind docKind = doc.getDocKind()
if (docKind && docKind.getPrefix()) {
   numPrefix = docKind.getPrefix() + "-"
}
}
return numPrefix +String.valueOf( un.getNextNumber("internal")).padLeft(5, "0")'
);
else
update DF_NUMERATOR set script = 'def un = com.haulmont.cuba.core.Locator.lookup("cuba_UniqueNumbers")
String numPrefix = ""
if(binding.variables.containsKey("doc")) {
com.haulmont.thesis.core.entity.DocKind docKind = doc.getDocKind()
if (docKind && docKind.getPrefix()) {
   numPrefix = docKind.getPrefix() + "-"
}
}
return numPrefix +String.valueOf( un.getNextNumber("internal")).padLeft(5, "0")'
where id = '36708c7f-e232-4451-a239-3f5a8fa10726';
end if;



--Insert by DocKind--
cnt = (select count(CATEGORY_ID) from DF_DOC_KIND where category_id = '9cd678e3-7978-4f53-a503-a36bce3a76d6');
if(cnt = 0) then
insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
values ('9cd678e3-7978-4f53-a503-a36bce3a76d6', 'Contract', 'df$Contract', false, now(), USER, 1, 1);

insert into DF_DOC_KIND (category_id, create_ts, created_by, version, doc_type_id, fields_xml, numerator_type,
category_attrs_place, portal_publish_allowed, disable_add_process_actors, create_only_by_template)
values ('9cd678e3-7978-4f53-a503-a36bce3a76d6', '2010-10-28 00:00:00.00', 'admin', 1, 'ae67f5f6-35aa-11df-a04a-3345dd531def',
'<?xml version="1.0" encoding="UTF-8"?>

<fields>
<field name="addressee" visible="true" required="false"/>
<field name="active" visible="true" required="false"/>
<field name="responseToDoc" visible="true" required="false"/>
<field name="docKind" visible="true" required="false"/>
<field name="attachments" visible="true" required="false"/>
<field name="dateTime" visible="true" required="false"/>
<field name="date" visible="true" required="false"/>
<field name="finishDatePlan" visible="false" required="false"/>
<field name="createDate" visible="true" required="false"/>
<field name="officeExecutor" visible="true" required="false"/>
<field name="category" visible="true" required="false"/>
<field name="currency" visible="true" required="false"/>
<field name="comment" visible="true" required="false"/>
<field name="officeContactPersonTo" visible="true" required="false"/>
<field name="contactPerson" visible="true" required="false"/>
<field name="contractor" visible="true" required="false"/>
<field name="owner" visible="true" required="false"/>
<field name="vatInclusive" visible="true" required="false"/>
<field name="assignments" visible="true" required="false"/>
<field name="liabilityStart" visible="true" required="false"/>
<field name="organization" visible="true" required="false"/>
<field name="number" visible="true" required="false"/>
<field name="liabilityEnd" visible="true" required="false"/>
<field name="parentCard" visible="true" required="false"/>
<field name="sender" visible="true" required="false"/>
<field name="officeSignedBy" visible="true" required="false"/>
<field name="department" visible="true" required="false"/>
<field name="projects" visible="true" required="false"/>
<field name="receivingMethod" visible="true" required="false"/>
<field name="vatRate" visible="true" required="false"/>
<field name="amount" visible="true" required="false"/>
<field name="vatAmount" visible="true" required="false"/>
<field name="paymentConditions" visible="true" required="false"/>
<field name="availableForAll" visible="false" required="false"/>
<field name="resolution" visible="false" required="false"/>
</fields>'
, 1, 1, false, false, false);
end if;

cnt = (select count(CATEGORY_ID) from DF_DOC_KIND where category_id = 'c40ea551-d399-4a11-b6be-347ca5f27837');
if(cnt = 0) then
insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
values ('c40ea551-d399-4a11-b6be-347ca5f27837', 'Letter', 'df$SimpleDoc', false, now(), USER, 1, 1);

insert into DF_DOC_KIND (category_id, create_ts, created_by, version, doc_type_id, use_all_procs, fields_xml,
numerator_type, category_attrs_place, portal_publish_allowed, disable_add_process_actors, create_only_by_template)
values ('c40ea551-d399-4a11-b6be-347ca5f27837', '2010-10-28 00:00:00.00', 'admin', 1, '1665ef30-2b44-11df-b1c6-bf8783a93da6', true,
'<?xml version="1.0" encoding="UTF-8"?>

<fields>
<field name="addressee" visible="true" required="false"/>
<field name="responseToDoc" visible="true" required="false"/>
<field name="docKind" visible="true" required="false"/>
<field name="attachments" visible="true" required="false"/>
<field name="dateTime" visible="true" required="false"/>
<field name="date" visible="true" required="false"/>
<field name="finishDatePlan" visible="true" required="false"/>
<field name="createDate" visible="true" required="false"/>
<field name="officeExecutor" visible="true" required="false"/>
<field name="category" visible="true" required="false"/>
<field name="comment" visible="true" required="false"/>
<field name="officeContactPersonTo" visible="true" required="false"/>
<field name="owner" visible="true" required="false"/>
<field name="assignments" visible="true" required="false"/>
<field name="number" visible="true" required="false"/>
<field name="parentCard" visible="true" required="false"/>
<field name="sender" visible="true" required="false"/>
<field name="officeSignedBy" visible="true" required="false"/>
<field name="department" visible="true" required="false"/>
<field name="projects" visible="true" required="false"/>
<field name="receivingMethod" visible="true" required="false"/>
<field name="availableForAll" visible="false" required="false"/>
</fields>'
, 1, 1, false, false, false);

end if;

cnt = (select count(id) from DF_CATEGORY where id = '56a88e8c-6ab2-427a-97fc-5897005fe8a1');
if(cnt = 0) then
insert into DF_CATEGORY (id, create_ts, created_by, version, doc_type_id, name) values ('56a88e8c-6ab2-427a-97fc-5897005fe8a1', '2010-10-28 00:00:00.00', 'admin', 1, '1665ef30-2b44-11df-b1c6-bf8783a93da6', 'Basic');
end if;

cnt = (select count(id) from DF_ORGANIZATION where id = 'a851beaf-6890-4ab2-b847-b7a810c4c2b9');
if(cnt = 0) then
insert into DF_ORGANIZATION (id, create_ts, created_by, version, name) values ('a851beaf-6890-4ab2-b847-b7a810c4c2b9', '2010-10-28 00:00:00.00', 'admin', 1, 'Organization');
update sec_user set organization_id = 'a851beaf-6890-4ab2-b847-b7a810c4c2b9' where organization_id is null;
update df_category set organization_id = 'a851beaf-6890-4ab2-b847-b7a810c4c2b9' where organization_id is null;
update DF_TYPICAL_RESOLUTION set organization_id = 'a851beaf-6890-4ab2-b847-b7a810c4c2b9' where organization_id is null;
update TM_PROJECT_GROUP set organization_id = 'a851beaf-6890-4ab2-b847-b7a810c4c2b9' where organization_id is null;
end if;

cnt = (select count(id) from DF_DOC_RECEIVING_METHOD where id = 'ba3e811b-f0dc-4cc8-a119-4e76ff5555b9');
if(cnt = 0) then
insert into DF_DOC_RECEIVING_METHOD (id, create_ts, created_by, version, name) values ('ba3e811b-f0dc-4cc8-a119-4e76ff5555b9', '2010-10-28 00:00:00.00', 'admin', 1, 'Postal delivery');
end if;

cnt = (select count(id) from DF_OFFICE_FILE_NOMENCLATURE where id = '301f91e9-2968-4fc6-ba4e-e3a3ea09d46c');
if(cnt = 0) then
insert into DF_OFFICE_FILE_NOMENCLATURE (id, create_ts, created_by, version, name, year, ec_mark, category, organization_id) values ('301f91e9-2968-4fc6-ba4e-e3a3ea09d46c', '2010-10-28 00:00:00.00', 'admin', 1, 'Incoming', 2016, FALSE, 1, 'a851beaf-6890-4ab2-b847-b7a810c4c2b9');
end if;

cnt = (select count(id) from DF_OFFICE_FILE_NOMENCLATURE where id = 'd32b5d42-e202-4df5-89ee-9d6111d6d637');
if(cnt = 0) then
insert into DF_OFFICE_FILE_NOMENCLATURE (id, create_ts, created_by, version, name, year, ec_mark, category, organization_id) values ('d32b5d42-e202-4df5-89ee-9d6111d6d637', '2010-10-28 00:00:00.00', 'admin', 1, 'Outgoing', 2016, FALSE, 1, 'a851beaf-6890-4ab2-b847-b7a810c4c2b9');
end if;

cnt = (select count(id) from DF_OFFICE_FILE_NOMENCLATURE where id = '159ab5b8-fb54-4ea6-a6ba-b485fb885010');
if(cnt = 0) then
insert into DF_OFFICE_FILE_NOMENCLATURE (id, create_ts, created_by, version, name, year, ec_mark, category, organization_id) values ('159ab5b8-fb54-4ea6-a6ba-b485fb885010', '2010-10-28 00:00:00.00', 'admin', 1, 'Internal', 2016, FALSE, 1, 'a851beaf-6890-4ab2-b847-b7a810c4c2b9');
end if;

cnt = (select count(id) from DF_NUMERATOR where id = 'b3997576-456d-49e8-964a-24a247d4753d');
if(cnt = 0) then
insert into DF_NUMERATOR (id, create_ts, created_by, version, name, script) values ('b3997576-456d-49e8-964a-24a247d4753d', '2010-10-28 00:00:00.00', 'admin', 1, 'Documents and contracts',
'def un = com.haulmont.cuba.core.Locator.lookup("cuba_UniqueNumbers")
String numPrefix = ""
if(binding.variables.containsKey("docOfficeData")) {
com.haulmont.thesis.core.entity.OfficeFile officeFile = docOfficeData.getOfficeFile()
if (officeFile && officeFile.getNomenclature().getIndex() != null &&       officeFile.getNomenclature().getIndex() != "") {
   numPrefix = officeFile.getNomenclature().getIndex() + "-"
}
}
return numPrefix +String.valueOf( un.getNextNumber("innernumbers")).padLeft(5, "0")');
else
update DF_NUMERATOR set script = 'def un = com.haulmont.cuba.core.Locator.lookup("cuba_UniqueNumbers")
String numPrefix = ""
if(binding.variables.containsKey("docOfficeData")) {
com.haulmont.thesis.core.entity.OfficeFile officeFile = docOfficeData.getOfficeFile()
if (officeFile && officeFile.getNomenclature().getIndex() != null &&       officeFile.getNomenclature().getIndex() != "") {
   numPrefix = officeFile.getNomenclature().getIndex() + "-"
}
}
return numPrefix +String.valueOf( un.getNextNumber("innernumbers")).padLeft(5, "0")'
where id = 'b3997576-456d-49e8-964a-24a247d4753d';
end if;

cnt = (select count(id) from DF_OFFICE_FILE where id = 'a14d4159-c1ec-4b08-8c19-27b77544201b');
if(cnt = 0) then
insert into DF_OFFICE_FILE (id, create_ts, created_by, version, volume_no, state, office_file_nomenclature_id, numerator_id, type) values ('a14d4159-c1ec-4b08-8c19-27b77544201b', '2010-10-28 00:00:00.00', 'admin', 1, 1, 10, '159ab5b8-fb54-4ea6-a6ba-b485fb885010', 'b3997576-456d-49e8-964a-24a247d4753d', 'D');
end if;

cnt = (select count(id) from DF_OFFICE_FILE where id = 'e4698cbc-7fdd-4bc7-b011-1d7ccb80ae37');
if(cnt = 0) then
insert into DF_OFFICE_FILE (id, create_ts, created_by, version, volume_no, state, office_file_nomenclature_id, numerator_id, type) values ('e4698cbc-7fdd-4bc7-b011-1d7ccb80ae37', '2010-10-28 00:00:00.00', 'admin', 1, 1, 10, '301f91e9-2968-4fc6-ba4e-e3a3ea09d46c', 'b3997576-456d-49e8-964a-24a247d4753d', 'D');
end if;

cnt = (select count(id) from DF_OFFICE_FILE where id = 'fc69f0e9-4b0b-465a-88a6-47805e32e099');
if(cnt = 0) then
insert into DF_OFFICE_FILE (id, create_ts, created_by, version, volume_no, state, office_file_nomenclature_id, numerator_id, type) values ('fc69f0e9-4b0b-465a-88a6-47805e32e099', '2010-10-28 00:00:00.00', 'admin', 1, 1, 10, 'd32b5d42-e202-4df5-89ee-9d6111d6d637', 'b3997576-456d-49e8-964a-24a247d4753d', 'D');
end if;

update DF_OFFICE_FILE set organization_id = 'a851beaf-6890-4ab2-b847-b7a810c4c2b9' where organization_id is null and id in ('a14d4159-c1ec-4b08-8c19-27b77544201b', 'e4698cbc-7fdd-4bc7-b011-1d7ccb80ae37', 'fc69f0e9-4b0b-465a-88a6-47805e32e099');

return 0;
END;
$$
LANGUAGE plpgsql;
^
select baseInsert();
^
drop function if exists baseInsert();

update df_numerator set script_enabled = true where script_enabled is null  and script is not null^
