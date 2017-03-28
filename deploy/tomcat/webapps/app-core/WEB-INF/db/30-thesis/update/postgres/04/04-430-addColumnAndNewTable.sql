-- $Id: 04-430-addColumnAndNewTable.sql 4254 2012-03-15 08:12:47Z shatokhin $
-- Description
alter table DF_DOC_KIND add USE_ALL_PROCS boolean;

create table DF_DOC_KIND_WF_PROC (
    CATEGORY_ID uuid,
    PROC_ID uuid
)^

alter table DF_DOC_KIND_WF_PROC add constraint DF_DOC_KIND_WF_PROC_C foreign key (CATEGORY_ID) references DF_DOC_KIND(CATEGORY_ID);
alter table DF_DOC_KIND_WF_PROC add constraint DF_DOC_KIND_WF_PROC_P foreign key (PROC_ID) references WF_PROC(ID);
