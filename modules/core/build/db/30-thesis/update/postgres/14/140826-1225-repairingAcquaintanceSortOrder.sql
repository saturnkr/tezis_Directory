--$Id$

update WF_CARD_ROLE set SORT_ORDER = 1 where PROC_ROLE_ID in (select ID from WF_PROC_ROLE where CODE = 'Acquaintance'
and PROC_ID = (select ID from WF_PROC where JBPM_PROCESS_KEY = 'Acquaintance'));