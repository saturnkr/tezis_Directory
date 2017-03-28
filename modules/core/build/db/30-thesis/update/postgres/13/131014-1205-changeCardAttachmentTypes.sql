-- $Id: 131014-1205-changeCardAttachmentTypes.sql 12783 2013-10-25 10:07:50Z gorbunkov $

update WF_ATTACHMENT set ATTACHMENT_TYPE = 'Z' where ATTACHMENT_TYPE = 'C';