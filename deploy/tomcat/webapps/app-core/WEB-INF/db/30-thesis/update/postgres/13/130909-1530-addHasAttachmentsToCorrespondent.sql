--$Id: 130909-1530-addHasAttachmentsToCorrespondent.sql 14824 2014-02-10 12:19:00Z saiyan $
--$Description: moves HAS_ATTACHMENT attribute back to correspondent entity


DO $$
    BEGIN
        BEGIN
            ALTER TABLE DF_CORRESPONDENT ADD COLUMN HAS_ATTACHMENTS boolean;
        EXCEPTION
            WHEN duplicate_column THEN RAISE NOTICE 'column HAS_ATTACHMENTS already exists in DF_CORRESPONDENT.';
        END;
    END;
$$

