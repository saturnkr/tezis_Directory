-- $Id: 130821-1138-docPublisherRole.sql 12498 2013-10-14 07:46:44Z gorbunkov $
insert into SEC_ROLE (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,name,loc_name,description,is_default_role)
VALUES ('ae883bce-0a34-11e3-a7e0-a702ae87dd8a',current_timestamp,'admin',1,current_timestamp,null,null,null,'doc_publisher',
'Публикация документов на портале','Роль, позволяющая публиковать документы на портале',null);