-- $Id: 01-250-AddCommentToContractorAttachment.sql 397 2010-06-23 11:56:55Z gorbunkov $
-- Description:

alter table DF_CONTRACTOR_ATTACHMENT add COMMENT varchar(1000);