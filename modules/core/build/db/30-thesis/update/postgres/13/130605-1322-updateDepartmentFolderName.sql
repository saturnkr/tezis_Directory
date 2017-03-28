--$Id: 130605-1322-updateDepartmentFolderName.sql 10155 2013-06-05 12:48:15Z tsarevskiy $
--Description:

update SYS_FOLDER set NAME = 'AppFolder_task.ActiveTasksDepartmentChief' where NAME = 'AppFolder_task.ActiveTasks';