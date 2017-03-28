-- $Id: 03-160-DocKindCategory.sql 2550 2011-09-01 12:49:46Z gorbunkov $
--todo test this script
alter table DF_DOC_KIND add CATEGORY_ID uuid;
alter table DF_DOC_KIND add constraint DF_DOC_KIND_CATEGORY_ID foreign key (CATEGORY_ID) references SYS_CATEGORY(ID);

insert into SYS_CATEGORY(ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, DISCRIMINATOR)
select doc_kind.ID, doc_kind.NAME, doc_type.NAME, false, now(), USER, 1 from DF_DOC_KIND doc_kind join DF_DOC_TYPE doc_type on doc_type.id = doc_kind.doc_type_id;

alter table DF_DOC_KIND drop NAME;

update DF_DOC_KIND doc_kind set CATEGORY_ID = ID;

alter table DF_DOC drop constraint FK_DF_DOC_DOC_KIND;
alter table DF_DOC_TYPE drop constraint FK_DF_DOC_TYPE_KIND;

alter table DF_DOC_KIND drop constraint DF_DOC_KIND_PKEY;
alter table DF_DOC_KIND add primary key (CATEGORY_ID);
alter table DF_DOC_KIND drop ID;

alter table DF_DOC add constraint FK_DF_DOC_DOC_KIND foreign key (DOC_KIND_ID) references DF_DOC_KIND (CATEGORY_ID);
alter table DF_DOC_TYPE add constraint FK_DF_DOC_TYPE_KIND foreign key (DOC_KIND_ID) references DF_DOC_KIND (CATEGORY_ID);