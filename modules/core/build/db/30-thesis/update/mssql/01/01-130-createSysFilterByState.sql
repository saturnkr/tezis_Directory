--$Id: 01-130-createSysFilterByState.sql 11308 2013-08-14 16:09:28Z pavlov $

delete from sec_filter where name = 'По участию в процессе и состоянию';

insert into sec_filter (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, component, name, code, xml, user_id)
values (newid(), current_timestamp, 'admin', 1, null, null, null, null, '[df$SimpleDoc.browse].genericFilter', 'По участию в процессе и состоянию', null, '<?xml version="1.0" encoding="UTF-8"?>

<filter>
  <and>
    <c name="proc" class="com.haulmont.workflow.core.entity.Proc" caption="msg://com.haulmont.workflow.core.entity/Card.proc" paramWhere="not p.code = ''TaskManagement''" type="CUSTOM" operatorType="EQUAL" join="join d.roles cr">cr.procRole.proc.id = :component$genericFilter.proc34273
      <param name="component$genericFilter.proc34273" javaClass="com.haulmont.workflow.core.entity.Proc">NULL</param>
    </c>
    <c name="state" class="com.haulmont.thesis.core.enums.DocState" caption="msg://com.haulmont.workflow.core.entity/Card.state" type="CUSTOM" entityAlias="d">d.state like :component$genericFilter.state75186
      <param name="component$genericFilter.state75186" javaClass="com.haulmont.thesis.core.enums.DocState">NULL</param>
    </c>
    <c name="procRole" class="com.haulmont.workflow.core.entity.ProcRole" caption="msg://com.haulmont.workflow.core.entity/CardRole.procRole" paramWhere="e.invisible=false and e.proc.id = :component$genericFilter.proc34273" type="CUSTOM" entityAlias="d">cr.procRole.id = :component$genericFilter.procRole70614
      <param name="component$genericFilter.procRole70614" javaClass="com.haulmont.workflow.core.entity.ProcRole">NULL</param>
    </c>
    <c name="user" class="com.haulmont.cuba.security.entity.User" caption="msg://com.haulmont.workflow.core.entity/CardRole.user" type="CUSTOM" join="join d.roles cr">cr.user.id = :component$genericFilter.user90982
      <param name="component$genericFilter.user90982" javaClass="com.haulmont.cuba.security.entity.User">NULL</param>
    </c>
  </and>
</filter>', null);

insert into sec_filter (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, component, name, code, xml, user_id)
values (newid(), current_timestamp, 'admin', 1, null, null, null, null, '[df$Doc.browse].genericFilter', 'По участию в процессе и состоянию', null, '<?xml version="1.0" encoding="UTF-8"?>

<filter>
  <and>
    <c name="proc" class="com.haulmont.workflow.core.entity.Proc" caption="msg://com.haulmont.workflow.core.entity/Card.proc" paramWhere="not p.code = ''TaskManagement''" type="CUSTOM" operatorType="EQUAL" join="join d.roles cr">cr.procRole.proc.id = :component$genericFilter.proc34273
      <param name="component$genericFilter.proc34273" javaClass="com.haulmont.workflow.core.entity.Proc">NULL</param>
    </c>
    <c name="state" class="com.haulmont.thesis.core.enums.DocState" caption="msg://com.haulmont.workflow.core.entity/Card.state" type="CUSTOM" entityAlias="d">d.state like :component$genericFilter.state75186
      <param name="component$genericFilter.state75186" javaClass="com.haulmont.thesis.core.enums.DocState">NULL</param>
    </c>
    <c name="procRole" class="com.haulmont.workflow.core.entity.ProcRole" caption="msg://com.haulmont.workflow.core.entity/CardRole.procRole" paramWhere="e.invisible=false and e.proc.id = :component$genericFilter.proc34273" type="CUSTOM" entityAlias="d">cr.procRole.id = :component$genericFilter.procRole70614
      <param name="component$genericFilter.procRole70614" javaClass="com.haulmont.workflow.core.entity.ProcRole">NULL</param>
    </c>
    <c name="user" class="com.haulmont.cuba.security.entity.User" caption="msg://com.haulmont.workflow.core.entity/CardRole.user" type="CUSTOM" join="join d.roles cr">cr.user.id = :component$genericFilter.user90982
      <param name="component$genericFilter.user90982" javaClass="com.haulmont.cuba.security.entity.User">NULL</param>
    </c>
  </and>
</filter>', null);

insert into sec_filter (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, component, name, code, xml, user_id)
values (newid(), current_timestamp, 'admin', 1, null, null, null, null, '[df$DocIncome.browse].genericFilter', 'По участию в процессе и состоянию', null, '<?xml version="1.0" encoding="UTF-8"?>

<filter>
  <and>
    <c name="proc" class="com.haulmont.workflow.core.entity.Proc" caption="msg://com.haulmont.workflow.core.entity/Card.proc" paramWhere="not p.code = ''TaskManagement''" type="CUSTOM" operatorType="EQUAL" join="join d.roles cr">cr.procRole.proc.id = :component$genericFilter.proc34273
      <param name="component$genericFilter.proc34273" javaClass="com.haulmont.workflow.core.entity.Proc">NULL</param>
    </c>
    <c name="state" class="com.haulmont.thesis.core.enums.DocState" caption="msg://com.haulmont.workflow.core.entity/Card.state" type="CUSTOM" entityAlias="d">d.state like :component$genericFilter.state75186
      <param name="component$genericFilter.state75186" javaClass="com.haulmont.thesis.core.enums.DocState">NULL</param>
    </c>
    <c name="procRole" class="com.haulmont.workflow.core.entity.ProcRole" caption="msg://com.haulmont.workflow.core.entity/CardRole.procRole" paramWhere="e.invisible=false and e.proc.id = :component$genericFilter.proc34273" type="CUSTOM" entityAlias="d">cr.procRole.id = :component$genericFilter.procRole70614
      <param name="component$genericFilter.procRole70614" javaClass="com.haulmont.workflow.core.entity.ProcRole">NULL</param>
    </c>
    <c name="user" class="com.haulmont.cuba.security.entity.User" caption="msg://com.haulmont.workflow.core.entity/CardRole.user" type="CUSTOM" join="join d.roles cr">cr.user.id = :component$genericFilter.user90982
      <param name="component$genericFilter.user90982" javaClass="com.haulmont.cuba.security.entity.User">NULL</param>
    </c>
  </and>
</filter>', null);

insert into sec_filter (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, component, name, code, xml, user_id)
values (newid(), current_timestamp, 'admin', 1, null, null, null, null, '[df$Contract.browse].genericFilter', 'По участию в процессе и состоянию', null, '<?xml version="1.0" encoding="UTF-8"?>

<filter>
  <and>
    <c name="proc" class="com.haulmont.workflow.core.entity.Proc" caption="msg://com.haulmont.workflow.core.entity/Card.proc" paramWhere="not p.code = ''TaskManagement''" type="CUSTOM" operatorType="EQUAL" join="join d.roles cr">cr.procRole.proc.id = :component$genericFilter.proc34273
      <param name="component$genericFilter.proc34273" javaClass="com.haulmont.workflow.core.entity.Proc">NULL</param>
    </c>
    <c name="state" class="com.haulmont.thesis.core.enums.DocState" caption="msg://com.haulmont.workflow.core.entity/Card.state" type="CUSTOM" entityAlias="d">d.state like :component$genericFilter.state75186
      <param name="component$genericFilter.state75186" javaClass="com.haulmont.thesis.core.enums.DocState">NULL</param>
    </c>
    <c name="procRole" class="com.haulmont.workflow.core.entity.ProcRole" caption="msg://com.haulmont.workflow.core.entity/CardRole.procRole" paramWhere="e.invisible=false and e.proc.id = :component$genericFilter.proc34273" type="CUSTOM" entityAlias="d">cr.procRole.id = :component$genericFilter.procRole70614
      <param name="component$genericFilter.procRole70614" javaClass="com.haulmont.workflow.core.entity.ProcRole">NULL</param>
    </c>
    <c name="user" class="com.haulmont.cuba.security.entity.User" caption="msg://com.haulmont.workflow.core.entity/CardRole.user" type="CUSTOM" join="join d.roles cr">cr.user.id = :component$genericFilter.user90982
      <param name="component$genericFilter.user90982" javaClass="com.haulmont.cuba.security.entity.User">NULL</param>
    </c>
  </and>
</filter>', null);

insert into sec_filter (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, component, name, code, xml, user_id)
values (newid(), current_timestamp, 'admin', 1, null, null, null, null, '[df$DocInternal.browse].genericFilter', 'По участию в процессе и состоянию', null, '<?xml version="1.0" encoding="UTF-8"?>

<filter>
  <and>
    <c name="proc" class="com.haulmont.workflow.core.entity.Proc" caption="msg://com.haulmont.workflow.core.entity/Card.proc" paramWhere="not p.code = ''TaskManagement''" type="CUSTOM" operatorType="EQUAL" join="join d.roles cr">cr.procRole.proc.id = :component$genericFilter.proc34273
      <param name="component$genericFilter.proc34273" javaClass="com.haulmont.workflow.core.entity.Proc">NULL</param>
    </c>
    <c name="state" class="com.haulmont.thesis.core.enums.DocState" caption="msg://com.haulmont.workflow.core.entity/Card.state" type="CUSTOM" entityAlias="d">d.state like :component$genericFilter.state75186
      <param name="component$genericFilter.state75186" javaClass="com.haulmont.thesis.core.enums.DocState">NULL</param>
    </c>
    <c name="procRole" class="com.haulmont.workflow.core.entity.ProcRole" caption="msg://com.haulmont.workflow.core.entity/CardRole.procRole" paramWhere="e.invisible=false and e.proc.id = :component$genericFilter.proc34273" type="CUSTOM" entityAlias="d">cr.procRole.id = :component$genericFilter.procRole70614
      <param name="component$genericFilter.procRole70614" javaClass="com.haulmont.workflow.core.entity.ProcRole">NULL</param>
    </c>
    <c name="user" class="com.haulmont.cuba.security.entity.User" caption="msg://com.haulmont.workflow.core.entity/CardRole.user" type="CUSTOM" join="join d.roles cr">cr.user.id = :component$genericFilter.user90982
      <param name="component$genericFilter.user90982" javaClass="com.haulmont.cuba.security.entity.User">NULL</param>
    </c>
  </and>
</filter>', null);

insert into sec_filter (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, component, name, code, xml, user_id)
values (newid(), current_timestamp, 'admin', 1, null, null, null, null, '[df$DocOutcome.browse].genericFilter', 'По участию в процессе и состоянию', null, '<?xml version="1.0" encoding="UTF-8"?>

<filter>
  <and>
    <c name="proc" class="com.haulmont.workflow.core.entity.Proc" caption="msg://com.haulmont.workflow.core.entity/Card.proc" paramWhere="not p.code = ''TaskManagement''" type="CUSTOM" operatorType="EQUAL" join="join d.roles cr">cr.procRole.proc.id = :component$genericFilter.proc34273
      <param name="component$genericFilter.proc34273" javaClass="com.haulmont.workflow.core.entity.Proc">NULL</param>
    </c>
    <c name="state" class="com.haulmont.thesis.core.enums.DocState" caption="msg://com.haulmont.workflow.core.entity/Card.state" type="CUSTOM" entityAlias="d">d.state like :component$genericFilter.state75186
      <param name="component$genericFilter.state75186" javaClass="com.haulmont.thesis.core.enums.DocState">NULL</param>
    </c>
    <c name="procRole" class="com.haulmont.workflow.core.entity.ProcRole" caption="msg://com.haulmont.workflow.core.entity/CardRole.procRole" paramWhere="e.invisible=false and e.proc.id = :component$genericFilter.proc34273" type="CUSTOM" entityAlias="d">cr.procRole.id = :component$genericFilter.procRole70614
      <param name="component$genericFilter.procRole70614" javaClass="com.haulmont.workflow.core.entity.ProcRole">NULL</param>
    </c>
    <c name="user" class="com.haulmont.cuba.security.entity.User" caption="msg://com.haulmont.workflow.core.entity/CardRole.user" type="CUSTOM" join="join d.roles cr">cr.user.id = :component$genericFilter.user90982
      <param name="component$genericFilter.user90982" javaClass="com.haulmont.cuba.security.entity.User">NULL</param>
    </c>
  </and>
</filter>', null);