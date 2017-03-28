-- $Id: 02-100-AddDocKindDefaultInDocType.sql 1398 2011-01-20 13:06:39Z novikov $
-- Description:

alter table DF_DOC_TYPE add DOC_KIND_ID uuid;
alter table DF_DOC_TYPE add constraint FK_DF_DOC_TYPE_KIND foreign key (DOC_KIND_ID) references DF_DOC_KIND (ID);