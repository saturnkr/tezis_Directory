-- $Id: 01-10-initDefaultDocflow.sql 23100 2016-01-12 08:59:26Z tsarev $
-- Description:
--Update Proc an ProcRole--
update WF_PROC set name = 'Ознакомление', participants_change_enabled = 1, card_types = ',df$SimpleDoc,df$Contract,df$Doc,' where jbpm_process_key = 'Acquaintance' and updated_by is null;
update WF_PROC set name = 'Регистрация', card_types = ',df$SimpleDoc,df$Doc,' where jbpm_process_key = 'Registration' and updated_by is null;
update WF_PROC set name = 'Резолюция', card_types = ',df$SimpleDoc,df$Doc,' where jbpm_process_key = 'Resolution' and updated_by is null;
--update WF_PROC set name = 'Согласование (устар.)', card_types = ',df$SimpleDoc,df$Contract,', combined_stages_enabled = 0 where jbpm_process_key = 'EndorsementFull' and updated_by is null;
update WF_PROC_ROLE set name = 'Ознакомляющийся', role_id = (select id from SEC_ROLE where name = 'doc_acquaintance'), order_filling_type = 'P', is_multi_user = 1 where code = 'Acquaintance' and proc_id = (select id from WF_PROC where jbpm_process_key = 'Acquaintance') and updated_by is null;
update WF_PROC_ROLE set name = 'Инициатор', role_id = (select id from SEC_ROLE where name = 'doc_initiator') where code = 'Initiator' and proc_id = (select id from WF_PROC where jbpm_process_key = 'Acquaintance') and updated_by is null;
update WF_PROC_ROLE set name = 'Создатель' where code = 'CARD_CREATOR' and proc_id = (select id from WF_PROC where jbpm_process_key = 'Acquaintance') and updated_by is null;
update WF_PROC_ROLE set name = 'Создатель' where code = 'CARD_CREATOR' and proc_id = (select id from WF_PROC where jbpm_process_key = 'Registration') and updated_by is null;
update WF_PROC_ROLE set name = 'Инициатор', role_id = (select id from SEC_ROLE where name = 'doc_initiator') where code = 'Initiator' and proc_id = (select id from WF_PROC where jbpm_process_key = 'Registration') and updated_by is null;
update WF_PROC_ROLE set name = 'Секретарь', role_id = (select id from SEC_ROLE where name = 'doc_secretary') where code = 'Secretary' and proc_id = (select id from WF_PROC where jbpm_process_key = 'Registration') and updated_by is null;
update WF_PROC_ROLE set name = 'Создатель' where code = 'CARD_CREATOR' and proc_id = (select id from WF_PROC where jbpm_process_key = 'Resolution') and updated_by is null;
update WF_PROC_ROLE set name = 'Инициатор', role_id = (select id from SEC_ROLE where name = 'doc_initiator') where code = 'Initiator' and proc_id = (select id from WF_PROC where jbpm_process_key = 'Resolution') and updated_by is null;
update WF_PROC_ROLE set name = 'Утверждающий', role_id = (select id from SEC_ROLE where name = 'doc_approver') where code = 'Approver' and proc_id = (select id from WF_PROC where jbpm_process_key = 'Resolution') and updated_by is null;
update WF_PROC_ROLE set name = 'Утверждающий', role_id = (select id from SEC_ROLE where name = 'doc_approver') where code = 'Approver' and proc_id = (select id from WF_PROC where jbpm_process_key = 'EndorsementFull') and updated_by is null;
update WF_PROC_ROLE set name = 'Создатель' where code = 'CARD_CREATOR' and proc_id = (select id from WF_PROC where jbpm_process_key = 'EndorsementFull') and updated_by is null;
update WF_PROC_ROLE set name = 'Инициатор', role_id = (select id from SEC_ROLE where name = 'doc_initiator') where code = 'Initiator' and proc_id = (select id from WF_PROC where jbpm_process_key = 'EndorsementFull') and updated_by is null;
update WF_PROC_ROLE set name = 'Согласующий', role_id = (select id from SEC_ROLE where name = 'doc_endorsement'), is_multi_user = 1 where code = 'Endorsement' and proc_id = (select id from WF_PROC where jbpm_process_key = 'EndorsementFull') and updated_by is null;
update WF_PROC_ROLE set name = 'Согласующий (п)', role_id = (select id from SEC_ROLE where name = 'doc_endorsement'), is_multi_user = 1 where code = 'EndorsementSeq' and proc_id = (select id from WF_PROC where jbpm_process_key = 'EndorsementFull') and updated_by is null;

update WF_PROC set name = 'Согласование', card_types = ',df$SimpleDoc,df$Contract,df$Doc,', combined_stages_enabled = 1 where jbpm_process_key = 'Endorsement' and updated_by is null;
update WF_PROC_ROLE set name = 'Инициатор', role_id = (select id from SEC_ROLE where name = 'doc_initiator') where code = 'Initiator' and proc_id = (select id from WF_PROC where jbpm_process_key = 'Endorsement') and updated_by is null;
update WF_PROC_ROLE set name = 'Утверждающий', role_id = (select id from SEC_ROLE where name = 'doc_approver') where code = 'Approver' and proc_id = (select id from WF_PROC where jbpm_process_key = 'Endorsement') and updated_by is null;
update WF_PROC_ROLE set name = 'Согласующий', role_id = (select id from SEC_ROLE where name = 'doc_endorsement'), order_filling_type = 'P', is_multi_user = 1 where code = 'Endorsement' and proc_id = (select id from WF_PROC where jbpm_process_key = 'Endorsement') and updated_by is null;

update DF_DOC_KIND set numerator_id = (select TOP 1 n.id from df_numerator n where n.name = 'Документы и договоры' ) where numerator_id is null;

update WF_PROC_ROLE set assign_to_creator = 1 where code = 'Initiator';

update wf_proc_role set sort_order = 1 where code = 'Initiator' and proc_id = (select id from wf_proc where code = 'Endorsement') and delete_ts is null;
update wf_proc_role set sort_order = 2 where code = 'Endorsement' and proc_id = (select id from wf_proc where code = 'Endorsement') and delete_ts is null;
update wf_proc_role set sort_order = 3 where code = 'Approver' and proc_id = (select id from wf_proc where code = 'Endorsement') and delete_ts is null;
update wf_proc_role set sort_order = 4 where code = 'CARD_CREATOR' and proc_id = (select id from wf_proc where code = 'Endorsement') and delete_ts is null;

update WF_PROC set name = 'Согласование протокола', card_types = ',df$MeetingDoc,', combined_stages_enabled = 1 where jbpm_process_key = 'ProtocolEndorsement' and updated_by is null;
update WF_PROC_ROLE set name = 'Инициатор', role_id = (select id from SEC_ROLE where name = 'doc_initiator') where code = 'Initiator' and proc_id = (select id from WF_PROC where jbpm_process_key = 'ProtocolEndorsement') and updated_by is null;
update WF_PROC_ROLE set name = 'Утверждающий', role_id = (select id from SEC_ROLE where name = 'doc_approver') where code = 'Approver' and proc_id = (select id from WF_PROC where jbpm_process_key = 'ProtocolEndorsement') and updated_by is null;
update WF_PROC_ROLE set name = 'Согласующий', role_id = (select id from SEC_ROLE where name = 'doc_endorsement'), order_filling_type = 'P', is_multi_user = 1 where code = 'Endorsement' and proc_id = (select id from WF_PROC where jbpm_process_key = 'ProtocolEndorsement') and updated_by is null;

update DF_DOC_KIND set numerator_id = (select TOP 1 n.id from df_numerator n where n.name = 'Документы и договоры') where numerator_id is null;

update WF_PROC_ROLE set assign_to_creator=1 where code = 'Initiator';

update wf_proc_role set sort_order = 1 where code = 'Initiator' and proc_id = (select id from wf_proc where code = 'ProtocolEndorsement') and delete_ts is null;
update wf_proc_role set sort_order = 2 where code = 'Endorsement' and proc_id = (select id from wf_proc where code = 'ProtocolEndorsement') and delete_ts is null;
update wf_proc_role set sort_order = 3 where code = 'Approver' and proc_id = (select id from wf_proc where code = 'ProtocolEndorsement') and delete_ts is null;
update wf_proc_role set sort_order = 4 where code = 'CARD_CREATOR' and proc_id = (select id from wf_proc where code = 'ProtocolEndorsement') and delete_ts is null;

update WF_PROC set name = 'Согласование повестки', card_types = ',df$MeetingDoc,', combined_stages_enabled = 1 where jbpm_process_key = 'AgendaEndorsement' and updated_by is null;
update WF_PROC_ROLE set name = 'Инициатор', role_id = (select id from SEC_ROLE where name = 'doc_initiator') where code = 'Initiator' and proc_id = (select id from WF_PROC where jbpm_process_key = 'AgendaEndorsement') and updated_by is null;
update WF_PROC_ROLE set name = 'Утверждающий', role_id = (select id from SEC_ROLE where name = 'doc_approver') where code = 'Approver' and proc_id = (select id from WF_PROC where jbpm_process_key = 'AgendaEndorsement') and updated_by is null;
update WF_PROC_ROLE set name = 'Согласующий', role_id = (select id from SEC_ROLE where name = 'doc_endorsement'), order_filling_type = 'P', is_multi_user = '1' where code = 'Endorsement' and proc_id = (select id from WF_PROC where jbpm_process_key = 'AgendaEndorsement') and updated_by is null;

update DF_DOC_KIND set numerator_id = (select TOP 1 n.id from df_numerator n where n.name = 'Документы и договоры') where numerator_id is null;

update WF_PROC_ROLE set assign_to_creator=1 where code = 'Initiator';

update wf_proc_role set sort_order = 1 where code = 'Initiator' and proc_id = (select id from wf_proc where code = 'AgendaEndorsement') and delete_ts is null;
update wf_proc_role set sort_order = 2 where code = 'Endorsement' and proc_id = (select id from wf_proc where code = 'AgendaEndorsement') and delete_ts is null;
update wf_proc_role set sort_order = 3 where code = 'Approver' and proc_id = (select id from wf_proc where code = 'AgendaEndorsement') and delete_ts is null;
update wf_proc_role set sort_order = 4 where code = 'CARD_CREATOR' and proc_id = (select id from wf_proc where code = 'AgendaEndorsement') and delete_ts is null;

^

CREATE PROCEDURE baseInsert
AS
BEGIN
  DECLARE @cnt integer, @firstInstallationThesisVersion double precision, @initDefaultInFirstStart varchar(5);

  select @cnt = count(id) from DF_TYPICAL_RESOLUTION where name = 'На рассмотрение:';
  if(@cnt = 0) begin
   insert into DF_TYPICAL_RESOLUTION (id, create_ts, created_by, version, name, text, global)
     values (newid(), current_timestamp, USER, 1, 'На рассмотрение:', 'На рассмотрение:', 1);
  end;

  select @cnt = count(id) from DF_TYPICAL_RESOLUTION where name = 'Ознакомить:';
  if(@cnt = 0) begin
    insert into DF_TYPICAL_RESOLUTION (id, create_ts, created_by, version, name, text, global)
    values (newid(), current_timestamp, USER, 1, 'Ознакомить:', 'Ознакомить:', 1);
  end;

  select @cnt = count(id) from DF_NUMERATOR where name = 'Входящий (констр.)' and delete_ts is null;
  if(@cnt = 0) begin
    INSERT INTO DF_NUMERATOR (ID, CREATE_TS, CREATED_BY, VERSION, NAME, NUMERATOR_FORMAT, SCRIPT_ENABLED, PERIODICITY)
      VALUES (newid(), current_timestamp, USER, 1, 'Входящий (констр.)', '[departmentCode][number]', 0, 'D');
  end;

  select @cnt = count(id) from DF_NUMERATOR where id = 'bebc21e2-fce0-40c6-9202-7cffff7cf88e';
  if(@cnt = 0) begin
    insert into DF_NUMERATOR (id, create_ts, created_by, version, name, script_enabled, script)
      values ('bebc21e2-fce0-40c6-9202-7cffff7cf88e', current_timestamp, USER, 1, 'Входящий', 1,
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
  end;

  select @cnt = count(id) from DF_NUMERATOR where id = '5618547c-a4c9-4bfd-a71e-d884cf49df57';
  if(@cnt = 0) begin
    insert into DF_NUMERATOR (id, create_ts, created_by, version, name, script_enabled, script)
    values ('5618547c-a4c9-4bfd-a71e-d884cf49df57', current_timestamp, USER, 1, 'Исходящий', 1,
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
  end;

  select @cnt = count(id) from DF_NUMERATOR where id = '36708c7f-e232-4451-a239-3f5a8fa10726';
  if(@cnt = 0) begin
    insert into DF_NUMERATOR (id, create_ts, created_by, version, name, script_enabled, script)
    values ('36708c7f-e232-4451-a239-3f5a8fa10726', current_timestamp, USER, 1, 'Внутренний', 1,
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
  end;
  --Insert by DocKind--
  select @cnt = count(CATEGORY_ID) from DF_DOC_KIND where category_id = '9cd678e3-7978-4f53-a503-a36bce3a76d6';
  if(@cnt = 0) begin
    insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
    values ('9cd678e3-7978-4f53-a503-a36bce3a76d6', 'Договор', 'df$Contract', 0, current_timestamp, USER, 1, 1);

    insert into DF_DOC_KIND (category_id, create_ts, created_by, version, doc_type_id, fields_xml, numerator_type,
    category_attrs_place, tab_name, portal_publish_allowed, disable_add_process_actors, create_only_by_template)
    values ('9cd678e3-7978-4f53-a503-a36bce3a76d6', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, 'ae67f5f6-35aa-11df-a04a-3345dd531def',
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
    , 1, 1, 'Доп. поля', 0, 0, 0);

  end;

--Договор ~ Печатная форма типового договора
select @cnt = count(ID) from SYS_CATEGORY where ID = '9cd678e3-7978-4f53-a503-a36bce3a76d6' and DELETE_TS is null;
if(@cnt > 0) begin
    select @cnt = count(CATEGORY_ID) from DF_DOC_KIND_REPORT_REPORT
           where CATEGORY_ID = '9cd678e3-7978-4f53-a503-a36bce3a76d6'
             and REPORT_ID = 'ffeb2250-c2ca-46c2-9e42-42c771c6d5e3';
    if(@cnt = 0) begin
        select @cnt = count(ID) from REPORT_REPORT where ID = 'ffeb2250-c2ca-46c2-9e42-42c771c6d5e3';
        if(@cnt > 0) begin
            insert into DF_DOC_KIND_REPORT_REPORT (CATEGORY_ID, REPORT_ID)
            values ('9cd678e3-7978-4f53-a503-a36bce3a76d6', 'ffeb2250-c2ca-46c2-9e42-42c771c6d5e3');
        end;
    end;
end;

select @cnt = count(CATEGORY_ID) from DF_DOC_KIND where category_id = 'c40ea551-d399-4a11-b6be-347ca5f27837';
  if(@cnt = 0) begin
    insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
    values ('c40ea551-d399-4a11-b6be-347ca5f27837', 'Письмо', 'df$SimpleDoc', 0, current_timestamp, USER, 1, 1);

    insert into DF_DOC_KIND (category_id, create_ts, created_by, version, doc_type_id, use_all_procs, fields_xml,
    numerator_type, category_attrs_place, tab_name, portal_publish_allowed, disable_add_process_actors, create_only_by_template)
    values ('c40ea551-d399-4a11-b6be-347ca5f27837', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, '1665ef30-2b44-11df-b1c6-bf8783a93da6', 1,
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
    <field name="theme" visible="true" required="false"/>
    <field name="orderCause" visible="false" required="false"/>
    <field name="orderText" visible="false" required="false"/>
    <field name="organization" visible="true" required="false"/>
    <field name="docSender" visible="false" required="false"/>
    <field name="docReceiver" visible="false" required="false"/>
    <field name="docCopyReceiver" visible="false" required="false"/>
    </fields>'
    , 1, 1, 'Доп. поля', 0, 0, 0);
  end;

  --Письмо ~ Печать письма
  select @cnt = count(ID) from SYS_CATEGORY where ID = 'c40ea551-d399-4a11-b6be-347ca5f27837' and DELETE_TS is null;
  if(@cnt > 0) begin
      select @cnt = count(CATEGORY_ID) from DF_DOC_KIND_REPORT_REPORT
             where CATEGORY_ID = 'c40ea551-d399-4a11-b6be-347ca5f27837'
               and REPORT_ID = 'f4d67569-ad56-417f-a6dd-c7fcdd9785d5';
      if(@cnt = 0) begin
          select @cnt = count(ID) from REPORT_REPORT where ID = 'f4d67569-ad56-417f-a6dd-c7fcdd9785d5';
          if(@cnt > 0) begin
              insert into DF_DOC_KIND_REPORT_REPORT (CATEGORY_ID, REPORT_ID)
              values ('c40ea551-d399-4a11-b6be-347ca5f27837', 'f4d67569-ad56-417f-a6dd-c7fcdd9785d5');
          end;
      end;
  end;

select @firstInstallationThesisVersion = CONVERT(double precision, value) from SYS_CONFIG where name='thesis.firstInstallationThesisVersion';
if(@firstInstallationThesisVersion is not null and @firstInstallationThesisVersion>=3.6) begin

  select @cnt = count(CATEGORY_ID) from DF_DOC_KIND where category_id = '3c59f74c-fe98-11e2-9e49-a30cc182d375';
    if(@cnt = 0) begin
      insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
      values ('3c59f74c-fe98-11e2-9e49-a30cc182d375', 'Дополнительное соглашение', 'df$Contract', 0, current_timestamp, USER, 1, 1);

      insert into DF_DOC_KIND (category_id, create_ts, created_by, version, doc_type_id, fields_xml, numerator_type,
      category_attrs_place, tab_name, portal_publish_allowed, disable_add_process_actors, create_only_by_template)
      values ('3c59f74c-fe98-11e2-9e49-a30cc182d375', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, 'ae67f5f6-35aa-11df-a04a-3345dd531def',
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
        <field name="parentCard" visible="true" required="true"/>
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
      , 1, 1, 'Доп. поля', 0, 0, 0);
    end;

    --Дополнительное соглашение ~ Печать дополнительного соглашения
    select @cnt = count(ID) from SYS_CATEGORY where ID = '3c59f74c-fe98-11e2-9e49-a30cc182d375' and DELETE_TS is null;
    if(@cnt > 0) begin
        select @cnt = count(CATEGORY_ID) from DF_DOC_KIND_REPORT_REPORT
               where CATEGORY_ID = '3c59f74c-fe98-11e2-9e49-a30cc182d375'
                 and REPORT_ID = 'f03ee4fe-4e48-465d-b166-9ba5579dc2f9';
        if(@cnt = 0) begin
            select @cnt = count(ID) from REPORT_REPORT where ID = 'f03ee4fe-4e48-465d-b166-9ba5579dc2f9';
            if(@cnt > 0) begin
                insert into DF_DOC_KIND_REPORT_REPORT (CATEGORY_ID, REPORT_ID)
                values ('3c59f74c-fe98-11e2-9e49-a30cc182d375', 'f03ee4fe-4e48-465d-b166-9ba5579dc2f9');
            end;
        end;
    end;

   select @cnt = count(CATEGORY_ID) from DF_DOC_KIND where category_id = '648a5b6c-fe98-11e2-89ed-635286aa63eb';
      if(@cnt = 0) begin
        insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
        values ('648a5b6c-fe98-11e2-89ed-635286aa63eb', 'Приложение к договору', 'df$Contract', 0, current_timestamp, USER, 1, 1);

        insert into DF_DOC_KIND (category_id, create_ts, created_by, version, doc_type_id, fields_xml, numerator_type,
        category_attrs_place, tab_name, portal_publish_allowed, disable_add_process_actors, create_only_by_template)
        values ('648a5b6c-fe98-11e2-89ed-635286aa63eb', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, 'ae67f5f6-35aa-11df-a04a-3345dd531def',
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
         <field name="parentCard" visible="true" required="true"/>
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
        , 1, 1, 'Доп. поля', 0, 0, 0);
      end;

  --Приложение к договору ~ Печать приложения к договору
  select @cnt = count(ID) from SYS_CATEGORY where ID = '648a5b6c-fe98-11e2-89ed-635286aa63eb' and DELETE_TS is null;
  if(@cnt > 0) begin
      select @cnt = count(CATEGORY_ID) from DF_DOC_KIND_REPORT_REPORT
             where CATEGORY_ID = '648a5b6c-fe98-11e2-89ed-635286aa63eb'
               and REPORT_ID = '99d922c9-5e97-40ea-87bd-2d793da78c23';
      if(@cnt = 0) begin
            select @cnt = count(ID) from REPORT_REPORT where ID = '99d922c9-5e97-40ea-87bd-2d793da78c23';
            if(@cnt > 0) begin
                insert into DF_DOC_KIND_REPORT_REPORT (CATEGORY_ID, REPORT_ID)
                values ('648a5b6c-fe98-11e2-89ed-635286aa63eb', '99d922c9-5e97-40ea-87bd-2d793da78c23');
            end;
      end;
  end;

  select @cnt = count(CATEGORY_ID) from DF_DOC_KIND where category_id = '34370700-fe69-11e2-9d98-abe6f3d1eedc';
    if(@cnt = 0) begin
      insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
      values ('34370700-fe69-11e2-9d98-abe6f3d1eedc', 'Приказ', 'df$SimpleDoc', 0, current_timestamp, USER, 1, 1);

      insert into DF_DOC_KIND (category_id, create_ts, created_by, version, doc_type_id, use_all_procs, fields_xml,
      numerator_type, category_attrs_place, tab_name, portal_publish_allowed, disable_add_process_actors, create_only_by_template)
      values ('34370700-fe69-11e2-9d98-abe6f3d1eedc', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, '1665ef30-2b44-11df-b1c6-bf8783a93da6', 1,
      '<?xml version="1.0" encoding="UTF-8"?>
      <fields>
      <field name="addressee" visible="false" required="false"/>
      <field name="responseToDoc" visible="true" required="false"/>
      <field name="docKind" visible="false" required="false"/>
      <field name="attachments" visible="false" required="false"/>
      <field name="dateTime" visible="false" required="false"/>
      <field name="date" visible="true" required="false"/>
      <field name="finishDatePlan" visible="false" required="false"/>
      <field name="createDate" visible="false" required="false"/>
      <field name="officeExecutor" visible="true" required="false"/>
      <field name="category" visible="true" required="false"/>
      <field name="comment" visible="false" required="false"/>
      <field name="officeContactPersonTo" visible="false" required="false"/>
      <field name="owner" visible="false" required="false"/>
      <field name="assignments" visible="false" required="false"/>
      <field name="number" visible="true" required="false"/>
      <field name="sender" visible="true" required="false"/>
      <field name="parentCard" visible="true" required="false"/>
      <field name="officeSignedBy" visible="true" required="false"/>
      <field name="department" visible="true" required="false"/>
      <field name="projects" visible="false" required="false"/>
      <field name="receivingMethod" visible="true" required="false"/>
      <field name="availableForAll" visible="false" required="false"/>
      <field name="theme" visible="true" required="false"/>
      <field name="orderCause" visible="true" required="false"/>
      <field name="orderText" visible="true" required="false"/>
      <field name="organization" visible="true" required="false"/>
      <field name="docSender" visible="false" required="false"/>
      <field name="docReceiver" visible="false" required="false"/>
      <field name="docCopyReceiver" visible="false" required="false"/>
      </fields>'
      , 1, 1, 'Доп. поля', 0, 0, 0);
    end;

    --Приказ ~ Печать приказа
    select @cnt = count(ID) from SYS_CATEGORY where ID = '34370700-fe69-11e2-9d98-abe6f3d1eedc' and DELETE_TS is null;
    if(@cnt > 0) begin
        select @cnt = count(CATEGORY_ID) from DF_DOC_KIND_REPORT_REPORT
               where CATEGORY_ID = '34370700-fe69-11e2-9d98-abe6f3d1eedc'
                 and REPORT_ID = 'fb5c1c08-491c-44c0-bae7-fa921a1020ec';
        if(@cnt = 0) begin
            select @cnt = count(ID) from REPORT_REPORT where ID = 'fb5c1c08-491c-44c0-bae7-fa921a1020ec';
            if(@cnt > 0) begin
                insert into DF_DOC_KIND_REPORT_REPORT (CATEGORY_ID, REPORT_ID)
                values ('34370700-fe69-11e2-9d98-abe6f3d1eedc', 'fb5c1c08-491c-44c0-bae7-fa921a1020ec');
            end;
        end;
    end;

   select @cnt = count(CATEGORY_ID) from DF_DOC_KIND where category_id = '24e40c08-fe87-11e2-8c8a-3354b77dcb1f';
      if(@cnt = 0) begin
        insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
        values ('24e40c08-fe87-11e2-8c8a-3354b77dcb1f', 'Служебная записка', 'df$SimpleDoc', 0, current_timestamp, USER, 1, 1);

        insert into DF_DOC_KIND (category_id, create_ts, created_by, version, doc_type_id, use_all_procs, fields_xml,
        numerator_type, category_attrs_place, tab_name, portal_publish_allowed, disable_add_process_actors, create_only_by_template)
        values ('24e40c08-fe87-11e2-8c8a-3354b77dcb1f', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, '1665ef30-2b44-11df-b1c6-bf8783a93da6', 1,
        '<?xml version="1.0" encoding="UTF-8"?>
        <fields>
        <field name="addressee" visible="false" required="false"/>
        <field name="responseToDoc" visible="true" required="false"/>
        <field name="docKind" visible="false" required="false"/>
        <field name="attachments" visible="false" required="false"/>
        <field name="dateTime" visible="false" required="false"/>
        <field name="date" visible="true" required="false"/>
        <field name="finishDatePlan" visible="false" required="false"/>
        <field name="createDate" visible="false" required="false"/>
        <field name="officeExecutor" visible="true" required="false"/>
        <field name="category" visible="true" required="false"/>
        <field name="comment" visible="true" required="false"/>
        <field name="officeContactPersonTo" visible="false" required="false"/>
        <field name="owner" visible="false" required="false"/>
        <field name="assignments" visible="false" required="false"/>
        <field name="number" visible="true" required="false"/>
        <field name="sender" visible="true" required="false"/>
        <field name="parentCard" visible="true" required="false"/>
        <field name="officeSignedBy" visible="true" required="false"/>
        <field name="department" visible="true" required="false"/>
        <field name="projects" visible="false" required="false"/>
        <field name="receivingMethod" visible="true" required="false"/>
        <field name="availableForAll" visible="false" required="false"/>
        <field name="theme" visible="true" required="false"/>
        <field name="orderCause" visible="false" required="false"/>
        <field name="orderText" visible="false" required="false"/>
        <field name="organization" visible="true" required="false"/>
        <field name="docSender" visible="true" required="false"/>
        <field name="docReceiver" visible="true" required="false"/>
        <field name="docCopyReceiver" visible="true" required="false"/>
        </fields>'
        , 1, 1, 'Доп. поля', 0, 0, 0);
      end;

    --Служебная записка ~ Печать служебной записки
    select @cnt = count(ID) from SYS_CATEGORY where ID = '24e40c08-fe87-11e2-8c8a-3354b77dcb1f' and DELETE_TS is null;
    if(@cnt > 0) begin
        select @cnt = count(CATEGORY_ID) from DF_DOC_KIND_REPORT_REPORT
            where CATEGORY_ID = '24e40c08-fe87-11e2-8c8a-3354b77dcb1f'
              and REPORT_ID = 'e5a5d959-372b-4ca3-93da-7902c21b2c05';
        if(@cnt = 0) begin
            select @cnt = count(ID) from REPORT_REPORT where ID = 'e5a5d959-372b-4ca3-93da-7902c21b2c05';
            if(@cnt > 0) begin
                insert into DF_DOC_KIND_REPORT_REPORT (CATEGORY_ID, REPORT_ID)
                values ('24e40c08-fe87-11e2-8c8a-3354b77dcb1f', 'e5a5d959-372b-4ca3-93da-7902c21b2c05');
            end;
        end;
    end;

    select @cnt = count(CATEGORY_ID) from DF_DOC_KIND where category_id = '44f912b6-fe8e-11e2-a6b7-5bb93c75e36b';
        if(@cnt = 0) begin
          insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
          values ('44f912b6-fe8e-11e2-a6b7-5bb93c75e36b', 'Регламент', 'df$SimpleDoc', 0, current_timestamp, USER, 1, 1);

          insert into DF_DOC_KIND (category_id, create_ts, created_by, version, doc_type_id, use_all_procs, fields_xml,
          numerator_type, category_attrs_place, tab_name, portal_publish_allowed, disable_add_process_actors, create_only_by_template)
          values ('44f912b6-fe8e-11e2-a6b7-5bb93c75e36b', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, '1665ef30-2b44-11df-b1c6-bf8783a93da6', 1,
          '<?xml version="1.0" encoding="UTF-8"?>
          <fields>
          <field name="addressee" visible="false" required="false"/>
          <field name="responseToDoc" visible="true" required="false"/>
          <field name="docKind" visible="false" required="false"/>
          <field name="attachments" visible="false" required="false"/>
          <field name="dateTime" visible="false" required="false"/>
          <field name="date" visible="true" required="false"/>
          <field name="finishDatePlan" visible="false" required="false"/>
          <field name="createDate" visible="false" required="false"/>
          <field name="officeExecutor" visible="true" required="false"/>
          <field name="category" visible="true" required="false"/>
          <field name="comment" visible="true" required="false"/>
          <field name="officeContactPersonTo" visible="false" required="false"/>
          <field name="owner" visible="false" required="false"/>
          <field name="assignments" visible="false" required="false"/>
          <field name="number" visible="true" required="false"/>
          <field name="parentCard" visible="true" required="false"/>
          <field name="sender" visible="true" required="false"/>
          <field name="officeSignedBy" visible="true" required="false"/>
          <field name="department" visible="true" required="false"/>
          <field name="projects" visible="false" required="false"/>
          <field name="receivingMethod" visible="true" required="false"/>
          <field name="availableForAll" visible="false" required="false"/>
          <field name="theme" visible="true" required="false"/>
          <field name="orderCause" visible="false" required="false"/>
          <field name="orderText" visible="false" required="false"/>
          <field name="organization" visible="true" required="false"/>
          <field name="docSender" visible="false" required="false"/>
          <field name="docReceiver" visible="false" required="false"/>
          <field name="docCopyReceiver" visible="false" required="false"/>
          </fields>'
          , 1, 1, 'Доп. поля', 0, 0, 0);
        end;

  --Регламент ~ Печать регламента
  select @cnt = count(ID) from SYS_CATEGORY where ID = '44f912b6-fe8e-11e2-a6b7-5bb93c75e36b' and DELETE_TS is null;
  if(@cnt > 0) begin
      select @cnt = count(CATEGORY_ID) from DF_DOC_KIND_REPORT_REPORT
        where CATEGORY_ID = '44f912b6-fe8e-11e2-a6b7-5bb93c75e36b'
          and REPORT_ID = 'e973ce05-db77-4f60-ba36-5645246536de';
      if(@cnt = 0) begin
        select @cnt = count(ID) from REPORT_REPORT where ID = 'e973ce05-db77-4f60-ba36-5645246536de';
        if(@cnt > 0) begin
            insert into DF_DOC_KIND_REPORT_REPORT (CATEGORY_ID, REPORT_ID)
            values ('44f912b6-fe8e-11e2-a6b7-5bb93c75e36b', 'e973ce05-db77-4f60-ba36-5645246536de');
        end;
      end;
  end;

  select @cnt = count(CATEGORY_ID) from DF_DOC_KIND where category_id = '7f1b0314-fe8e-11e2-85d5-f7a577d85b9f';
          if(@cnt = 0) begin
            insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
            values ('7f1b0314-fe8e-11e2-85d5-f7a577d85b9f', 'Инструкция', 'df$SimpleDoc', 0, current_timestamp, USER, 1, 1);

            insert into DF_DOC_KIND (category_id, create_ts, created_by, version, doc_type_id, use_all_procs,
            fields_xml, numerator_type, category_attrs_place, tab_name, portal_publish_allowed, disable_add_process_actors,
            create_only_by_template)
            values ('7f1b0314-fe8e-11e2-85d5-f7a577d85b9f', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, '1665ef30-2b44-11df-b1c6-bf8783a93da6', 1,
           '<?xml version="1.0" encoding="UTF-8"?>
           <fields>
           <field name="addressee" visible="false" required="false"/>
           <field name="responseToDoc" visible="true" required="false"/>
           <field name="docKind" visible="false" required="false"/>
           <field name="attachments" visible="false" required="false"/>
           <field name="dateTime" visible="false" required="false"/>
           <field name="date" visible="true" required="false"/>
           <field name="finishDatePlan" visible="false" required="false"/>
           <field name="createDate" visible="false" required="false"/>
           <field name="officeExecutor" visible="true" required="false"/>
           <field name="category" visible="true" required="false"/>
           <field name="comment" visible="true" required="false"/>
           <field name="officeContactPersonTo" visible="false" required="false"/>
           <field name="owner" visible="false" required="false"/>
           <field name="assignments" visible="false" required="false"/>
           <field name="number" visible="true" required="false"/>
           <field name="parentCard" visible="true" required="false"/>
           <field name="sender" visible="true" required="false"/>
           <field name="officeSignedBy" visible="true" required="false"/>
           <field name="department" visible="true" required="false"/>
           <field name="projects" visible="false" required="false"/>
           <field name="receivingMethod" visible="true" required="false"/>
           <field name="availableForAll" visible="false" required="false"/>
           <field name="theme" visible="true" required="false"/>
           <field name="orderCause" visible="false" required="false"/>
           <field name="orderText" visible="false" required="false"/>
           <field name="organization" visible="true" required="false"/>
           <field name="docSender" visible="false" required="false"/>
           <field name="docReceiver" visible="false" required="false"/>
           <field name="docCopyReceiver" visible="false" required="false"/>
           </fields>'
            , 1, 1, 'Доп. поля', 0, 0, 0);
          end;

    --Инструкция ~ Печать инструкции
    select @cnt = count(ID) from SYS_CATEGORY where ID = '7f1b0314-fe8e-11e2-85d5-f7a577d85b9f' and DELETE_TS is null;
    if(@cnt > 0) begin
        select @cnt = count(CATEGORY_ID) from DF_DOC_KIND_REPORT_REPORT
               where CATEGORY_ID = '7f1b0314-fe8e-11e2-85d5-f7a577d85b9f'
                 and REPORT_ID = 'b147156f-c505-48cc-9736-37c786984cac';
        if(@cnt = 0) begin
            select @cnt = count(ID) from REPORT_REPORT where ID = 'b147156f-c505-48cc-9736-37c786984cac';
            if(@cnt > 0) begin
                insert into DF_DOC_KIND_REPORT_REPORT (CATEGORY_ID, REPORT_ID)
                values ('7f1b0314-fe8e-11e2-85d5-f7a577d85b9f', 'b147156f-c505-48cc-9736-37c786984cac');
            end;

        end;
    end;
end

select @cnt = count(CATEGORY_ID) from DF_DOC_KIND where category_id = '9415792f-c473-cbeb-d150-8ae687c4dcd2';
if(@cnt = 0) begin
    insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
    values ('9415792f-c473-cbeb-d150-8ae687c4dcd2', 'Совещание', 'df$MeetingDoc', 0, current_timestamp, USER, 1, 1);

    insert into DF_DOC_KIND (category_id, create_ts, created_by, version, doc_type_id, fields_xml,
    numerator_type, category_attrs_place, tab_name, portal_publish_allowed, disable_add_process_actors, create_only_by_template)
    values ('9415792f-c473-cbeb-d150-8ae687c4dcd2', {ts '2015-05-01 00:00:00.00'}, 'admin', 1, '5aa5ef34-af44-11df-b1c6-af3783a11da6',
    '<?xml version="1.0" encoding="UTF-8"?>

     <fields>
       <field name="responseToDoc" visible="true" required="false" signed="false"/>
       <field name="dateTime" visible="true" required="true" signed="false"/>
       <field name="duration" visible="true" required="false" signed="false"/>
       <field name="availableForAll" visible="false" required="false" signed="false"/>
       <field name="initiator" visible="true" required="true" signed="false"/>
       <field name="officeExecutor" visible="true" required="false" signed="false"/>
       <field name="employeeExecutor" visible="true" required="false" signed="false"/>
       <field name="docCategory" visible="true" required="false" signed="false"/>
       <field name="owner" visible="true" required="false" signed="false"/>
       <field name="place" visible="true" required="false" signed="false"/>
       <field name="name" visible="true" required="true" signed="false"/>
       <field name="number" visible="true" required="false" signed="false"/>
       <field name="organization" visible="true" required="false" signed="false"/>
       <field name="parentCard" visible="true" required="false" signed="false"/>
       <field name="sender" visible="true" required="false" signed="false"/>
       <field name="meetingQuestions" visible="true" required="false" signed="false"/>
       <field name="officeSignedBy" visible="true" required="false" signed="false"/>
       <field name="department" visible="true" required="false" signed="false"/>
       <field name="postTrackingNumber" visible="true" required="false" signed="false"/>
       <field name="chairman" visible="true" required="true" signed="false"/>
       <field name="projects" visible="false" required="false" signed="false"/>
       <field name="resolution" visible="true" required="false" signed="false"/>
       <field name="solutions" visible="true" required="false" signed="false"/>
       <field name="secretary" visible="true" required="true" signed="false"/>
       <field name="comment" visible="true" required="false" signed="false"/>
       <field name="receivingMethod" visible="true" required="false" signed="false"/>
       <field name="finishDatePlan" visible="true" required="false" signed="false"/>
       <field name="theme" visible="true" required="true" signed="false"/>
       <field name="members" visible="true" required="false" signed="false"/>
       <field name="target" visible="true" required="false" signed="false"/>
       <field name="parentCardAccess" visible="false" required="false" signed="false"/>
     </fields>'
    , 1, 1, 'Доп. поля', 0, 0, 0);
end;

  select @cnt =  count(id) from DF_CATEGORY where id = '56a88e8c-6ab2-427a-97fc-5897005fe8a1';
  if(@cnt = 0) begin
    insert into DF_CATEGORY (id, create_ts, created_by, version, doc_type_id, name) values ('56a88e8c-6ab2-427a-97fc-5897005fe8a1', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, '1665ef30-2b44-11df-b1c6-bf8783a93da6', 'Основная');
  end;

select @firstInstallationThesisVersion = CONVERT(double precision, value) from SYS_CONFIG where name='thesis.firstInstallationThesisVersion';
if(@firstInstallationThesisVersion is not null and @firstInstallationThesisVersion>=3.6) begin

  select @cnt =  count(id) from DF_CATEGORY where id = 'ce1e9051-ca5c-4341-a523-74c694a9635d' or (name like '%Основной вид деятельности%' and doc_type_id='1665ef30-2b44-11df-b1c6-bf8783a93da6' and delete_ts is null);
  if(@cnt = 0) begin
    insert into DF_CATEGORY (id, create_ts, created_by, version, doc_type_id, name) values ('ce1e9051-ca5c-4341-a523-74c694a9635d', {ts '2013-10-02 00:00:00.00'}, 'admin', 1, '1665ef30-2b44-11df-b1c6-bf8783a93da6', 'Основной вид деятельности');
  end;

  select @cnt =  count(id) from DF_CATEGORY where id = 'fa88ac80-13ea-486b-b247-602818672fe5' or (name like '%Административно-хозяйственная деятельность%' and doc_type_id='1665ef30-2b44-11df-b1c6-bf8783a93da6' and delete_ts is null);
  if(@cnt = 0) begin
    insert into DF_CATEGORY (id, create_ts, created_by, version, doc_type_id, name) values ('fa88ac80-13ea-486b-b247-602818672fe5', {ts '2013-10-02 00:00:00.00'}, 'admin', 1, '1665ef30-2b44-11df-b1c6-bf8783a93da6', 'Административно-хозяйственная деятельность');
  end;

  select @cnt =  count(id) from DF_CATEGORY where id = '196fb6fc-efad-4143-808f-248d727d91f7' or (name like '%По кадрам%' and doc_type_id='1665ef30-2b44-11df-b1c6-bf8783a93da6' and delete_ts is null);
  if(@cnt = 0) begin
    insert into DF_CATEGORY (id, create_ts, created_by, version, doc_type_id, name) values ('196fb6fc-efad-4143-808f-248d727d91f7', {ts '2013-10-02 00:00:00.00'}, 'admin', 1, '1665ef30-2b44-11df-b1c6-bf8783a93da6', 'По кадрам');
  end;

end;

  select @cnt = count(id) from DF_ORGANIZATION where id = 'a851beaf-6890-4ab2-b847-b7a810c4c2b9';
  if(@cnt = 0) begin
    insert into DF_ORGANIZATION (id, create_ts, created_by, version, name) values ('a851beaf-6890-4ab2-b847-b7a810c4c2b9', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, 'Наша организация');
    update sec_user set organization_id = 'a851beaf-6890-4ab2-b847-b7a810c4c2b9' where organization_id is null;
    update df_category set organization_id = 'a851beaf-6890-4ab2-b847-b7a810c4c2b9' where organization_id is null;
    update DF_TYPICAL_RESOLUTION set organization_id = 'a851beaf-6890-4ab2-b847-b7a810c4c2b9' where organization_id is null;
    update TM_PROJECT_GROUP set organization_id = 'a851beaf-6890-4ab2-b847-b7a810c4c2b9' where organization_id is null;
  end;

  select @cnt = count(id) from DF_DOC_RECEIVING_METHOD where id = 'ba3e811b-f0dc-4cc8-a119-4e76ff5555b9';
  if(@cnt = 0) begin
    insert into DF_DOC_RECEIVING_METHOD (id, create_ts, created_by, version, name) values ('ba3e811b-f0dc-4cc8-a119-4e76ff5555b9', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, 'Почтовая доставка');
  end;

  select @cnt = count(id) from DF_OFFICE_FILE_NOMENCLATURE where id = '301f91e9-2968-4fc6-ba4e-e3a3ea09d46c';
  if(@cnt = 0) begin
    insert into DF_OFFICE_FILE_NOMENCLATURE (id, create_ts, created_by, version, name, year, ec_mark, category, organization_id) values ('301f91e9-2968-4fc6-ba4e-e3a3ea09d46c', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, 'Входящие', 2016, 0, 1, 'a851beaf-6890-4ab2-b847-b7a810c4c2b9');
  end;

  select @cnt = count(id) from DF_OFFICE_FILE_NOMENCLATURE where id = 'd32b5d42-e202-4df5-89ee-9d6111d6d637';
  if(@cnt = 0) begin
    insert into DF_OFFICE_FILE_NOMENCLATURE (id, create_ts, created_by, version, name, year, ec_mark, category, organization_id) values ('d32b5d42-e202-4df5-89ee-9d6111d6d637', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, 'Исходящие', 2016, 0, 1, 'a851beaf-6890-4ab2-b847-b7a810c4c2b9');
  end;

  select @cnt = count(id) from DF_OFFICE_FILE_NOMENCLATURE where id = '159ab5b8-fb54-4ea6-a6ba-b485fb885010';
  if(@cnt = 0) begin
    insert into DF_OFFICE_FILE_NOMENCLATURE (id, create_ts, created_by, version, name, year, ec_mark, category, organization_id) values ('159ab5b8-fb54-4ea6-a6ba-b485fb885010', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, 'Внутренние', 2016, 0, 1, 'a851beaf-6890-4ab2-b847-b7a810c4c2b9');
  end;

  select @cnt = count(id) from DF_NUMERATOR where id = '215c66b8-ef2e-6608-bd5d-59c3bae94e5e';
  if(@cnt = 0) begin
    insert into DF_NUMERATOR (id, create_ts, created_by, version, name, script_enabled,numerator_format, periodicity, number_initial_value ) values ('215c66b8-ef2e-6608-bd5d-59c3bae94e5e', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, 'Совещания',
    0,'[number(5)]','Y',1);
  end;

  select @cnt = count(id) from DF_NUMERATOR where id = 'b3997576-456d-49e8-964a-24a247d4753d';
  if(@cnt = 0) begin
    insert into DF_NUMERATOR (id, create_ts, created_by, version, name, script_enabled, script) values ('b3997576-456d-49e8-964a-24a247d4753d', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, 'Документы и договоры', 1,
    'def un = com.haulmont.cuba.core.Locator.lookup("cuba_UniqueNumbers")
     String numPrefix = ""
     if(binding.variables.containsKey("docOfficeData")) {
       com.haulmont.thesis.core.entity.OfficeFile officeFile = docOfficeData.getOfficeFile()
       if (officeFile && officeFile.getNomenclature().getIndex() != null &&       officeFile.getNomenclature().getIndex() != "") {
         numPrefix = officeFile.getNomenclature().getIndex() + "-"
       }
     }
     return numPrefix +String.valueOf( un.getNextNumber("innernumbers")).padLeft(5, "0")');
  end;

select @firstInstallationThesisVersion = CONVERT(double precision, value) from SYS_CONFIG where name='thesis.firstInstallationThesisVersion';
if(@firstInstallationThesisVersion is not null and @firstInstallationThesisVersion>=3.6) begin

  select @cnt = count(id) from DF_NUMERATOR where id = 'c91d9e66-0034-11e3-8ca5-3f77160974ff';
  if(@cnt = 0) begin
    insert into DF_NUMERATOR (id, create_ts, created_by, version, name, script_enabled, script) values ('c91d9e66-0034-11e3-8ca5-3f77160974ff', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, 'Приложение к договору', 1,
    'import com.haulmont.cuba.core.app.DataService
      import com.haulmont.cuba.core.global.LoadContext
      import com.haulmont.thesis.core.entity.Doc
      import com.haulmont.thesis.core.entity.DocOfficeData

      DataService dataService= com.haulmont.cuba.core.Locator.lookup(DataService.NAME);
      String numPrefix = "";
      if(binding.variables.containsKey("docOfficeData")) {
          com.haulmont.thesis.core.entity.OfficeFile officeFile = ((DocOfficeData)binding.getProperty("docOfficeData")).getOfficeFile();
          if (officeFile && officeFile.getNomenclature().getIndex() != null && officeFile.getNomenclature().getIndex() != "") {
              numPrefix = officeFile.getNomenclature().getIndex() + "-"
          }
      }
      LoadContext ctx = new LoadContext(Doc.class);
      ctx.setQueryString("""select doc1 from df\$Doc doc1 where doc1.docKind.id=:docKindId
              and doc1.parentCard.id=:parentCardId and doc1.parentCard is not null and doc1.id<>:exclId""");
      ctx.getQuery().setParameter("docKindId",binding.getVariable("entity").getDocKind())
              .setParameter("parentCardId",binding.getVariable("entity").getParentCard())
              .setParameter("exclId",binding.getVariable("entity").getId());
      List<Doc> docs = dataService.loadList(ctx);
      String number = null;
      for (int i=1; i<=docs.size(); i++){
          String expNumber = (numPrefix+i).padLeft(5, "0");
          if (!expNumber.equals(docs.get(i-1).getNumber())){
              number=expNumber;
              break;
          }
      }
      if (number==null)
          number=numPrefix+(docs.size()+1).toString().padLeft(5, "0");
      return number;');
  end;

select @cnt = count(id) from DF_NUMERATOR where id = 'f31de086-0034-11e3-b761-873aa0372209';
  if(@cnt = 0) begin
    insert into DF_NUMERATOR (id, create_ts, created_by, version, name, script_enabled, script) values ('f31de086-0034-11e3-b761-873aa0372209', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, 'Дополнительное соглашение', 1,
    'import com.haulmont.cuba.core.app.DataService
      import com.haulmont.cuba.core.global.LoadContext
      import com.haulmont.thesis.core.entity.Doc
      import com.haulmont.thesis.core.entity.DocOfficeData

      DataService dataService= com.haulmont.cuba.core.Locator.lookup(DataService.NAME);
      String numPrefix = "";
      if(binding.variables.containsKey("docOfficeData")) {
          com.haulmont.thesis.core.entity.OfficeFile officeFile = ((DocOfficeData)binding.getProperty("docOfficeData")).getOfficeFile();
          if (officeFile && officeFile.getNomenclature().getIndex() != null && officeFile.getNomenclature().getIndex() != "") {
              numPrefix = officeFile.getNomenclature().getIndex() + "-"
          }
      }
      LoadContext ctx = new LoadContext(Doc.class);
      ctx.setQueryString("""select doc1 from df\$Doc doc1 where doc1.docKind.id=:docKindId
              and doc1.parentCard.id=:parentCardId and doc1.parentCard is not null and doc1.id<>:exclId""");
      ctx.getQuery().setParameter("docKindId",binding.getVariable("entity").getDocKind())
              .setParameter("parentCardId",binding.getVariable("entity").getParentCard())
              .setParameter("exclId",binding.getVariable("entity").getId());
      List<Doc> docs = dataService.loadList(ctx);
      String number = null;
      for (int i=1; i<=docs.size(); i++){
          String expNumber = (numPrefix+i).padLeft(5, "0");
          if (!expNumber.equals(docs.get(i-1).getNumber())){
              number=expNumber;
              break;
          }
      }
      if (number==null)
          number=numPrefix+(docs.size()+1).toString().padLeft(5, "0");
      return number;');
  end;

  select @cnt = count(id) from DF_NUMERATOR where id = '70dfe954-fe9d-11e2-96e0-1f9c56fc4e22';
  if(@cnt = 0) begin
    insert into DF_NUMERATOR (id, create_ts, created_by, version, name, script_enabled, script) values ('70dfe954-fe9d-11e2-96e0-1f9c56fc4e22', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, 'Письмо', 1,
    'def un = com.haulmont.cuba.core.Locator.lookup("cuba_UniqueNumbers")
     String numPrefix = ""
     if(binding.variables.containsKey("docOfficeData")) {
       com.haulmont.thesis.core.entity.OfficeFile officeFile = docOfficeData.getOfficeFile()
       if (officeFile && officeFile.getNomenclature().getIndex() != null &&       officeFile.getNomenclature().getIndex() != "") {
         numPrefix = officeFile.getNomenclature().getIndex() + "-"
       }
     }
     return numPrefix +String.valueOf( un.getNextNumber("letternumbers")).padLeft(5, "0")');
  end;

  select @cnt = count(id) from DF_NUMERATOR where id = 'ab30b1b4-fe9e-11e2-9003-c79b48b9667d';
  if(@cnt = 0) begin
    insert into DF_NUMERATOR (id, create_ts, created_by, version, name, script_enabled, script) values ('ab30b1b4-fe9e-11e2-9003-c79b48b9667d', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, 'Приказ', 1,
    'def un = com.haulmont.cuba.core.Locator.lookup("cuba_UniqueNumbers")
     String numPrefix = ""
     if(binding.variables.containsKey("docOfficeData")) {
       com.haulmont.thesis.core.entity.OfficeFile officeFile = docOfficeData.getOfficeFile()
       if (officeFile && officeFile.getNomenclature().getIndex() != null &&       officeFile.getNomenclature().getIndex() != "") {
         numPrefix = officeFile.getNomenclature().getIndex() + "-"
       }
     }
     return numPrefix +String.valueOf( un.getNextNumber("ordernumbers")).padLeft(5, "0")');
  end;

  select @cnt = count(id) from DF_NUMERATOR where id = 'b8ee4d84-fe9e-11e2-8a75-2ff0c334cf13';
  if(@cnt = 0) begin
    insert into DF_NUMERATOR (id, create_ts, created_by, version, name, script_enabled, script) values ('b8ee4d84-fe9e-11e2-8a75-2ff0c334cf13', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, 'Регламент', 1,
    'def un = com.haulmont.cuba.core.Locator.lookup("cuba_UniqueNumbers")
     String numPrefix = ""
     if(binding.variables.containsKey("docOfficeData")) {
       com.haulmont.thesis.core.entity.OfficeFile officeFile = docOfficeData.getOfficeFile()
       if (officeFile && officeFile.getNomenclature().getIndex() != null &&       officeFile.getNomenclature().getIndex() != "") {
         numPrefix = officeFile.getNomenclature().getIndex() + "-"
       }
     }
     return numPrefix +String.valueOf( un.getNextNumber("regulationsnumbers")).padLeft(5, "0")');
  end;

  select @cnt = count(id) from DF_NUMERATOR where id = 'c3b2f4a4-fe9e-11e2-a39a-83fe0d6b8db7';
  if(@cnt = 0) begin
    insert into DF_NUMERATOR (id, create_ts, created_by, version, name, script_enabled, script) values ('c3b2f4a4-fe9e-11e2-a39a-83fe0d6b8db7', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, 'Инструкция', 1,
    'def un = com.haulmont.cuba.core.Locator.lookup("cuba_UniqueNumbers")
     String numPrefix = ""
     if(binding.variables.containsKey("docOfficeData")) {
       com.haulmont.thesis.core.entity.OfficeFile officeFile = docOfficeData.getOfficeFile()
       if (officeFile && officeFile.getNomenclature().getIndex() != null &&       officeFile.getNomenclature().getIndex() != "") {
         numPrefix = officeFile.getNomenclature().getIndex() + "-"
       }
     }
     return numPrefix +String.valueOf( un.getNextNumber("instructionnumbers")).padLeft(5, "0")');
  end;

  select @cnt = count(id) from DF_NUMERATOR where id = 'd062c9f4-fe9e-11e2-a3fc-cf13c8fd96f7';
  if(@cnt = 0) begin
    insert into DF_NUMERATOR (id, create_ts, created_by, version, name, script_enabled, script) values ('d062c9f4-fe9e-11e2-a3fc-cf13c8fd96f7', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, 'Служебная записка', 1,
    'def un = com.haulmont.cuba.core.Locator.lookup("cuba_UniqueNumbers")
     String numPrefix = ""
     if(binding.variables.containsKey("docOfficeData")) {
       com.haulmont.thesis.core.entity.OfficeFile officeFile = docOfficeData.getOfficeFile()
       if (officeFile && officeFile.getNomenclature().getIndex() != null &&       officeFile.getNomenclature().getIndex() != "") {
         numPrefix = officeFile.getNomenclature().getIndex() + "-"
       }
     }
     return numPrefix +String.valueOf( un.getNextNumber("memorandumnumbers")).padLeft(5, "0")');
  end;

    select @cnt = count(id) from DF_NUMERATOR where id = '31dd46b2-2c00-11e3-bbe5-ef5c4a9d25e0';
    if(@cnt = 0) begin
      insert into DF_NUMERATOR (id, create_ts, created_by, version, name, script_enabled, script) values ('31dd46b2-2c00-11e3-bbe5-ef5c4a9d25e0', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, 'Вложения', 1,
      'String docNum= "док_"
          if(binding.variables.containsKey("resNum")) {
              docNum=  docNum+ resNum.getRegNumber()
          }
          return docNum');
    end;

  select @initDefaultInFirstStart = value from SYS_CONFIG where name='thesis.initDefaultInFirstStart';
  if(@initDefaultInFirstStart is null or @initDefaultInFirstStart = 'true') begin
    update DF_DOC_KIND set numerator_id='70dfe954-fe9d-11e2-96e0-1f9c56fc4e22' where category_id='c40ea551-d399-4a11-b6be-347ca5f27837';
    update DF_DOC_KIND set numerator_id='ab30b1b4-fe9e-11e2-9003-c79b48b9667d' where category_id='34370700-fe69-11e2-9d98-abe6f3d1eedc';
    update DF_DOC_KIND set numerator_id='b8ee4d84-fe9e-11e2-8a75-2ff0c334cf13' where category_id='44f912b6-fe8e-11e2-a6b7-5bb93c75e36b';
    update DF_DOC_KIND set numerator_id='c3b2f4a4-fe9e-11e2-a39a-83fe0d6b8db7' where category_id='7f1b0314-fe8e-11e2-85d5-f7a577d85b9f';
    update DF_DOC_KIND set numerator_id='d062c9f4-fe9e-11e2-a3fc-cf13c8fd96f7' where category_id='24e40c08-fe87-11e2-8c8a-3354b77dcb1f';
    update DF_DOC_KIND set numerator_id='c91d9e66-0034-11e3-8ca5-3f77160974ff' where category_id='648a5b6c-fe98-11e2-89ed-635286aa63eb';
    update DF_DOC_KIND set numerator_id='f31de086-0034-11e3-b761-873aa0372209' where category_id='3c59f74c-fe98-11e2-9e49-a30cc182d375';
    update DF_DOC_KIND set numerator_id='b3997576-456d-49e8-964a-24a247d4753d' where category_id='9cd678e3-7978-4f53-a503-a36bce3a76d6';
    update DF_DOC_KIND set numerator_id='215c66b8-ef2e-6608-bd5d-59c3bae94e5e' where category_id='9415792f-c473-cbeb-d150-8ae687c4dcd2';
  end;

end;

  select @cnt = count(id) from DF_OFFICE_FILE where id = 'a14d4159-c1ec-4b08-8c19-27b77544201b';
  if(@cnt = 0) begin
    insert into DF_OFFICE_FILE (id, create_ts, created_by, version, volume_no, state, office_file_nomenclature_id, numerator_id) values ('a14d4159-c1ec-4b08-8c19-27b77544201b', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, 1, 10, '159ab5b8-fb54-4ea6-a6ba-b485fb885010', 'b3997576-456d-49e8-964a-24a247d4753d');
  end;

  select @cnt = count(id) from DF_OFFICE_FILE where id = 'e4698cbc-7fdd-4bc7-b011-1d7ccb80ae37';
  if(@cnt = 0) begin
    insert into DF_OFFICE_FILE (id, create_ts, created_by, version, volume_no, state, office_file_nomenclature_id, numerator_id) values ('e4698cbc-7fdd-4bc7-b011-1d7ccb80ae37', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, 1, 10, '301f91e9-2968-4fc6-ba4e-e3a3ea09d46c', 'b3997576-456d-49e8-964a-24a247d4753d');
  end;

  select @cnt = count(id) from DF_OFFICE_FILE where id = 'fc69f0e9-4b0b-465a-88a6-47805e32e099';
  if(@cnt = 0) begin
    insert into DF_OFFICE_FILE (id, create_ts, created_by, version, volume_no, state, office_file_nomenclature_id, numerator_id) values ('fc69f0e9-4b0b-465a-88a6-47805e32e099', {ts '2010-10-28 00:00:00.00'}, 'admin', 1, 1, 10, 'd32b5d42-e202-4df5-89ee-9d6111d6d637', 'b3997576-456d-49e8-964a-24a247d4753d');
  end;

  select @cnt = count(df_office_file_id) from DF_OFFICE_FILE_NOMENCLATURE_RELATION where delete_ts is null;
  if(@cnt = 0) begin
   insert into DF_OFFICE_FILE_NOMENCLATURE_RELATION (ID, DF_OFFICE_FILE_ID, DF_OFFICE_FILE_NOMENCLATURE_ID)
    select newid(), ooff.id, nom.id from DF_OFFICE_FILE ooff
    inner join DF_OFFICE_FILE_NOMENCLATURE nom on ooff.office_file_nomenclature_id = nom.id;
  end;

  update DF_OFFICE_FILE set organization_id = 'a851beaf-6890-4ab2-b847-b7a810c4c2b9' where organization_id is null and id in ('a14d4159-c1ec-4b08-8c19-27b77544201b', 'e4698cbc-7fdd-4bc7-b011-1d7ccb80ae37', 'fc69f0e9-4b0b-465a-88a6-47805e32e099');

END;
^
exec baseInsert^


update df_numerator set script_enabled = 1 where script_enabled is null and script is not null;

if not exists (select NAME from SYSINDEXES where NAME = 'IDX_DF_CURRENCY_UNIQUENESS')
begin
    create unique index IDX_DF_CURRENCY_UNIQUENESS on DF_CURRENCY (DIGITAL_CODE, DELETE_TS);
end ^


drop procedure baseInsert ^


