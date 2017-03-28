alter table WF_ATTACHMENT add MAIN tinyint^
update WF_ATTACHMENT set MAIN = 0 where MAIN is null^