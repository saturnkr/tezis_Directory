--$Id: 01-100-addParentCardAccess.sql 5197 2012-06-05 06:55:38Z shishov $

alter table TM_TASK_VERSION add PARENT_CARD_ACCESS tinyint^

alter table TM_TASK_PATTERN add PARENT_CARD_ACCESS tinyint^

update TM_TASK_VERSION set PARENT_CARD_ACCESS = 0 where PARENT_CARD_ACCESS is null^

update TM_TASK_PATTERN set PARENT_CARD_ACCESS = 0 where PARENT_CARD_ACCESS is null^