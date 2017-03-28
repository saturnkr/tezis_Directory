--$Id: 130207-1058-addOrganizationToDocKind.sql 7728 2013-02-07 11:39:38Z kozyaikin $

alter table DF_DOC_KIND add organization_id uuid^

alter table DF_DOC_KIND add constraint fk_DOC_KIND_organization foreign key (organization_id) references DF_ORGANIZATION (id)
    match SIMPLE on update no action on delete no action^