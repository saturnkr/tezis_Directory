alter table WF_ATTACHMENT add MAIN boolean;
update WF_ATTACHMENT set MAIN = false where MAIN is null;