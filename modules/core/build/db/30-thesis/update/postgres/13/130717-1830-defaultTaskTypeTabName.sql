--$Id: 130717-1830-defaultTaskTypeTabName.sql 11215 2013-08-02 13:36:37Z saiyan $
--$Description: sets additional tab name in some databases

UPDATE TM_TASK_TYPE SET tab_name = 'Доп. поля'
WHERE CATEGORY_ID = '836d02a0-68a9-4aa5-b11a-08e9b32c589b'
AND TAB_NAME IS NULL ^