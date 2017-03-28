--$Id: 130611-1247-updateRoleTable.sql 10268 2013-06-11 09:07:54Z kozyaikin $
--Description:
update sec_role set description='Роль дает возможность работы с канцелярией, позволяет регистрировать документы', loc_name='Делопроизводитель' where name='doc_secretary';
update sec_role set description='Эта роль должна быть назначена всем пользователям кроме администраторов', loc_name='Запрещающая роль' where name='SimpleUser';
update sec_role set description='Роль, предоставляющая права создания документов/договоров и запуска процессов', loc_name='Инициатор документов' where name='doc_initiator';
update sec_role set description='Выступает инициатором процесса выполнения задачи, а также осуществляет отправку ее на выполнение', loc_name='Инициатор задач' where name='task_initiator';
update sec_role set description='Осуществляет выполнение задачи', loc_name='Исполнитель' where name='task_executor';
update sec_role set description='Осуществляет контроль выполнения задачи и, при необходимости, отправку задачи на доработку', loc_name='Контролёр' where name='task_controller';
update sec_role set description='Роль дает возможность получать уведомления по текущему состоянию задачи', loc_name='Наблюдатель' where name='task_observer';
update sec_role set description='Эта роль выдается только совместно с группой доступа «Руководитель департамента». У пользователя с этой ролью в карточке сотрудника должно быть заполнено подразделение', loc_name='Руководитель департамента' where name='DepartmentChief';
update sec_role set description='Эта роль выдается только совместно с группой доступа «Руководитель подразделения». У пользователя с этой ролью в карточке сотрудника должно быть заполнено подразделение', loc_name='Руководитель подразделения' where name='SubdivisionChief';
update sec_role set description='Роль дает возможность ознакомления с документами/договорами', loc_name='Ознакомление с документами' where name='doc_acquaintance';
update sec_role set description='Роль предоставляет возможность редактирования справочника «Замещение пользователей»', loc_name='Редактирование замещений пользователей' where name='UserSubstitutionEditor';
update sec_role set description='Роль, предоставляющая доступ к редактированию справочников', loc_name='Редактирование справочников' where name='ReferenceEditor';
update sec_role set description='Роль дает возможность согласования документов/договоров', loc_name='Согласующий' where name='doc_endorsement';
update sec_role set description='Роль дает возможность создания задач', loc_name='Создание задач' where name='task_creator';
update sec_role set description='Роль, позволяющая создавать периодические задания', loc_name='Создание периодических задач' where name='schedule_task_creator';
update sec_role set description='Роль дает возможность утверждения документов/договоров в завершении процесса согласования', loc_name='Утверждающий' where name='doc_approver';
update sec_role set description='Роль, предоставляющая права администрирования системы', loc_name='' where name='Administrators';
update sec_role set description='Позволяет отмечать справочники и данные к выгрузке в сторонние учётные системы', loc_name='Доступ к функциям модуля интеграции с учётными системами' where name='AppIntegrationRole';