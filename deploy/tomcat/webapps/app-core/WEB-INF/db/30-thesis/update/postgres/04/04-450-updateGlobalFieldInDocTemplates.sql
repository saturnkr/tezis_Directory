-- $Id: 04-450-updateGlobalFieldInDocTemplates.sql 4368 2012-03-24 12:46:27Z gorozhanov $
-- Description
UPDATE df_doc SET "global"='FALSE'
WHERE is_template='TRUE' and "global" is null;