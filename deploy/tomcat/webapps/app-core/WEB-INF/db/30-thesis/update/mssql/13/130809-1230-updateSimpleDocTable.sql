--$Id: 130809-1230-updateSimpleDocTable.sql 11277 2013-08-09 13:13:27Z zaskanov $
-- Description: update DF_SIMPLE_DOC table

alter table DF_SIMPLE_DOC add ORDER_TEXT varchar(8000);
alter table DF_SIMPLE_DOC add DOC_SENDER_ID uniqueidentifier;
alter table DF_SIMPLE_DOC add DOC_RECEIVER_ID uniqueidentifier;
alter table DF_SIMPLE_DOC add DOC_COPY_RECEIVER_ID uniqueidentifier;

alter table DF_SIMPLE_DOC add constraint FK_DF_SIMPLE_DOC_EMPLOYEE_0 foreign key (DOC_SENDER_ID) references DF_EMPLOYEE (CORRESPONDENT_ID);
alter table DF_SIMPLE_DOC add constraint FK_DF_SIMPLE_DOC_EMPLOYEE_1 foreign key (DOC_RECEIVER_ID) references DF_EMPLOYEE (CORRESPONDENT_ID);
alter table DF_SIMPLE_DOC add constraint FK_DF_SIMPLE_DOC_EMPLOYEE_2 foreign key (DOC_COPY_RECEIVER_ID) references DF_EMPLOYEE (CORRESPONDENT_ID);