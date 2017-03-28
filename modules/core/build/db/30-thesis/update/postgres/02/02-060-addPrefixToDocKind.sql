-- $Id: 02-060-addPrefixToDocKind.sql 1082 2010-11-15 08:49:51Z pavlov $
-- Description: prefix in DocKind for Numerator

 alter table DF_DOC_KIND add column PREFIX varchar(100);