--$Id: 130610-1353-removeDuplicateFolder.sql 10242 2013-06-10 11:33:41Z kozyaikin $
--Description:

delete from WF_PROC_APP_FOLDER PAF
    using SYS_APP_FOLDER AF, SYS_FOLDER F
    where PAF.FOLDER_ID = AF.FOLDER_ID and AF.FOLDER_ID = F.ID and F.NAME = 'AppFolder_task.ActiveTasksDepartmentChief'^
delete from SYS_APP_FOLDER AF using SYS_FOLDER F
    where AF.FOLDER_ID = F.ID and F.NAME = 'AppFolder_task.ActiveTasksDepartmentChief'^
delete from SYS_FOLDER F where F.NAME = 'AppFolder_task.ActiveTasksDepartmentChief'^