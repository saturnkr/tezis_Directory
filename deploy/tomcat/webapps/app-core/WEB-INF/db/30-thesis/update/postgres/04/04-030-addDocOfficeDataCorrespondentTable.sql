create table DF_DOC_OFFICE_DATA_ADDRESSEE (
    ID uuid,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    VERSION integer,
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    DOC_OFFICE_DATA_ID uuid,
    CORRESPONDENT_ID uuid,
    CONTACT_PERSON_ID uuid,
    primary key (ID)
)^

alter table DF_DOC_OFFICE_DATA_ADDRESSEE add constraint FK_DF_DOC_OFFICE_DATA foreign key (DOC_OFFICE_DATA_ID) references DF_DOC_OFFICE_DATA(ID)
^

alter table DF_DOC_OFFICE_DATA_ADDRESSEE add constraint FK_DF_CORRESPONDENT foreign key (CORRESPONDENT_ID) references DF_CORRESPONDENT(ID)
^

alter table DF_DOC_OFFICE_DATA_ADDRESSEE add constraint FK_DF_CONTACT_PERSON foreign key (CONTACT_PERSON_ID) references DF_CONTACT_PERSON(ID)
^

insert into DF_DOC_OFFICE_DATA_ADDRESSEE (ID,CREATE_TS,CREATED_BY,UPDATE_TS,UPDATED_BY,VERSION,DELETE_TS,DELETED_BY,DOC_OFFICE_DATA_ID,CORRESPONDENT_ID,CONTACT_PERSON_ID)
select newid(), now(), 'admin',null,null,1,null,null, d.ID, c.ID, cp.ID
from DF_DOC_OFFICE_DATA d
join DF_CORRESPONDENT c on d.ADDRESSEE_ID = c.ID
left join DF_CONTACT_PERSON cp on d.OFFICE_CONTACT_PERSON_TO_ID = cp.ID
^

alter table DF_DOC_OFFICE_DATA drop constraint FK_DF_DOC_OFFICE_DATA_ADDRESSEE
^

alter table DF_DOC_OFFICE_DATA drop column ADDRESSEE_ID
^

alter table DF_DOC_OFFICE_DATA drop constraint FK_DF_DOC_OFFICE_DATA_OFFICE_CONTACT_PERSON_TO
^

alter table DF_DOC_OFFICE_DATA drop column OFFICE_CONTACT_PERSON_TO_ID
^