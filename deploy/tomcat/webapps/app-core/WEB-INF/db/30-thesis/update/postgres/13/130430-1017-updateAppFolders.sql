-- $Id$

update SYS_FOLDER set NAME = 'AppFolder_task.notCompleted' where NAME = 'AppFolder_task.notComplited';
update SYS_FOLDER set NAME = 'AppFolder_task.ActiveTasksDepartmentChief' where id in (select folder_id from SYS_APP_FOLDER where VISIBILITY_SCRIPT = 'com/haulmont/thesis/core/appfolders/task/DepartmentChiefVisible.groovy');
update SYS_FOLDER set NAME = 'AppFolder_task.ActiveTasksDivisionChief' where id in (select folder_id from SYS_APP_FOLDER where VISIBILITY_SCRIPT = 'com/haulmont/thesis/core/appfolders/task/DivisionChiefVisible.groovy');