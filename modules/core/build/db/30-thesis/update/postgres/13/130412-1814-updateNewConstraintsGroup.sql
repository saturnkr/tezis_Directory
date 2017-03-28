 --$Id: 130412-1814-updateNewConstraintsGroup.sql 9082 2013-04-12 14:54:56Z kozyaikin $
 --$Description:

INSERT INTO "public"."sec_constraint" (id,create_ts,created_by,version,update_ts,updated_by,delete_ts,deleted_by,entity_name,join_clause,where_clause,group_id)
VALUES ('3f520104-d798-479c-9b93-04b16a99ff62',{ts'2013-04-03 17:53:02.610'},'admin',2,{ts'2013-04-03 18:41:27.100'},'admin',null,null,'df$Doc','',' TYPE({E}) in (SimpleDoc)','b3dc60f5-65b2-47ab-8802-9e8929bf8b29');

update "public"."sec_constraint" set join_clause='',where_clause=' TYPE({E}) in (Contract)' where id='99961b6f-d798-479c-9b93-04b16a99ff62';

