-- $Id: 02-111-AddDefaultTemplateFieldInDocType.sql 1429 2011-02-02 15:10:47Z ternovsky $
-- Description:

alter table DF_DOC_TYPE add DOC_TEMPLATE_ID uuid^
alter table DF_DOC_TYPE add constraint FK_DF_DOC_TYPE_TEMPLATE foreign key (DOC_TEMPLATE_ID) references DF_DOC(CARD_ID)^
