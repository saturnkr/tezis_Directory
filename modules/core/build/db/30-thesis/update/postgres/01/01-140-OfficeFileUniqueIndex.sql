-- $Id: 01-140-OfficeFileUniqueIndex.sql 166 2010-05-07 13:06:23Z gorbunkov $
-- Description: Unique index for OFFICE_FILE table

create unique index IDX_DF_OFFICE_FILE_UNIQ on DF_OFFICE_FILE (VOLUME_NO, OFFICE_FILE_NOMENCLATURE_ID) where DELETE_TS is null;