--$Id: 131202-1050-updateEntityInLogTable.sql 13616 2013-12-02 14:02:26Z kozyaikin $
--$Description

update SEC_ENTITY_LOG
set entity = 'df$CorrespondentAttachment'
where entity = 'com.haulmont.thesis.core.entity.ContractorAttachment'^