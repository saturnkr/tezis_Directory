-- $Id: 01-30-updateRecordsForEnglish.sql 5041 2012-05-18 13:19:10Z Novikov $
-- Description:

UPDATE SEC_GROUP SET name = 'Unit manager' WHERE name = 'Руководитель подразделения';
UPDATE SEC_GROUP SET name = 'Department manager' WHERE name = 'Руководитель департамента';

UPDATE SEC_GROUP SET NAME='Free access' where NAME='Полный доступ';
UPDATE SEC_GROUP SET name = 'Restricted access' WHERE name = 'Ограниченный доступ';
UPDATE SEC_GROUP SET name = 'Office managers' WHERE name = 'Делопроизводители';

UPDATE TM_PRIORITY SET NAME = 'Normal' WHERE NAME = 'Нормальный';
UPDATE TM_PRIORITY SET NAME = 'High' WHERE NAME = 'Высокий';
UPDATE TM_PRIORITY SET NAME = 'Low' WHERE NAME = 'Низкий';
UPDATE TM_PRIORITY SET NAME = 'Critical' WHERE NAME = 'Критический';

UPDATE SEC_ROLE SET LOC_NAME = 'Head of department' WHERE LOC_NAME = 'Руководитель департамента';
UPDATE SEC_ROLE SET LOC_NAME = 'Head of subdivision' WHERE LOC_NAME = 'Руководитель подразделения';
UPDATE SEC_ROLE SET LOC_NAME = 'Documents acquaintance' WHERE LOC_NAME = 'Ознакомление с документами';
UPDATE SEC_ROLE SET LOC_NAME = 'Reference data editing' WHERE LOC_NAME = 'Редактирование справочников';
UPDATE SEC_ROLE SET LOC_NAME = 'Documents initiator' WHERE LOC_NAME = 'Инициатор документов';
UPDATE SEC_ROLE SET LOC_NAME = 'Coordinate' WHERE LOC_NAME = 'Согласующий';
UPDATE SEC_ROLE SET LOC_NAME = 'Observer' WHERE LOC_NAME = 'Наблюдатель';
UPDATE SEC_ROLE SET LOC_NAME = 'Office manager' WHERE LOC_NAME = 'Делопроизводитель';
UPDATE SEC_ROLE SET LOC_NAME = 'Tasks initiator' WHERE LOC_NAME = 'Инициатор задач';
UPDATE SEC_ROLE SET LOC_NAME = 'Restrictive role', DESCRIPTION = 'This role has to be set for all users except administrations' WHERE LOC_NAME = 'Запрещающая роль';
UPDATE SEC_ROLE SET LOC_NAME = 'Controller' WHERE LOC_NAME = 'Контролёр';
UPDATE SEC_ROLE SET LOC_NAME = 'Affirmant' WHERE LOC_NAME = 'Утверждающий';
UPDATE SEC_ROLE SET LOC_NAME = 'Executor' WHERE LOC_NAME = 'Исполнитель';
UPDATE SEC_ROLE SET LOC_NAME = 'Tasks creation' WHERE LOC_NAME = 'Создание задач';
UPDATE SEC_ROLE SET LOC_NAME = 'Scheduled tasks creation' WHERE LOC_NAME = 'Создание периодических задач';

UPDATE DF_CURRENCY SET NAME = 'Rouble' WHERE NAME = 'Рубль';

UPDATE TM_SCHEDULE_ACTION_TYPE SET NAME = 'Task start' WHERE NAME = 'Запуск задачи';

