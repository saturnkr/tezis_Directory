--$Id: 130909-1830-moveHasAttachmentsField.sql 11942 2013-09-22 10:28:21Z saiyan $
--$Description: calculates HAS_ATTACHMENT parameter for exist companies, individuals and employees

update corr set corr.HAS_ATTACHMENTS = 1 from DF_CORRESPONDENT corr
where
corr.ID in
    (select comp.CONTRACTOR_ID from DF_COMPANY comp inner join WF_ATTACHMENT a on a.CONTRACTOR_ID = comp.CONTRACTOR_ID)
or corr.ID in
    (select ind.CONTRACTOR_ID from DF_INDIVIDUAL ind inner join WF_ATTACHMENT a on a.CONTRACTOR_ID = ind.CONTRACTOR_ID)
or corr.ID in
    (select emp.CORRESPONDENT_ID from DF_EMPLOYEE emp inner join WF_ATTACHMENT a on a.CORRESPONDENT_ID = emp.CORRESPONDENT_ID);

update DF_CORRESPONDENT set HAS_ATTACHMENTS = 0 where HAS_ATTACHMENTS is null ^

alter table DF_EMPLOYEE drop column HAS_ATTACHMENTS ^