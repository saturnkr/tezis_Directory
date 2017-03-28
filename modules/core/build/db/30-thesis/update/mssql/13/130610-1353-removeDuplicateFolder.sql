--$Id: 130610-1353-removeDuplicateFolder.sql 10239 2013-06-10 10:22:12Z stekolschikov $
--Description:

delete PAF from WF_PROC_APP_FOLDER PAF, SYS_APP_FOLDER AF, SYS_FOLDER F
    where PAF.FOLDER_ID = AF.FOLDER_ID and AF.FOLDER_ID = F.ID and F.NAME = 'AppFolder_task.ActiveTasksDepartmentChief'^
delete AF from SYS_APP_FOLDER AF, SYS_FOLDER F
    where AF.FOLDER_ID = F.ID and F.NAME = 'AppFolder_task.ActiveTasksDepartmentChief'^
delete F from SYS_FOLDER F where F.NAME = 'AppFolder_task.ActiveTasksDepartmentChief'^