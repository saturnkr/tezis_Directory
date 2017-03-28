-- $Id: 03-070-addRefreshAttachmenToCardUserInfo.sql 4121 2012-03-01 11:09:08Z pavlov $
-- Description:

alter table WF_CARD_USER_INFO add column REFRESH_ATTACHMENT boolean;