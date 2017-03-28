-- $Id: 150527-0931-addPresentations.sql 20197 2015-05-27 10:16:49Z kozyaikin $
-- Description:

insert into sec_presentation (id,component,name,is_auto_save,xml) values (newid(),'[df$MeetingDoc.browse].cardsTable','Основная',false,
'<?xml version="1.0" encoding="UTF-8"?>
<presentation>
<columns>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="important" visible="true"/>
<columns id="number" visible="true"/>
<columns id="createTs" visible="false"/>
<columns id="theme" visible="true"/>
<columns id="target" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="department" visible="true"/>
<columns id="parentCard" visible="true"/>
<columns id="docCategory" visible="false"/>
<columns id="dateTime" visible="true"/>
<columns id="duration" visible="false"/>
<columns id="place" visible="false"/>
<columns id="chairman" visible="true"/>
<columns id="initiator" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="secretary" visible="true"/>
<columns id="locState" visible="true"/>
</columns>
<groupProperties/>
</presentation>
');

insert into sec_presentation (id,component,name,is_auto_save,xml) values (newid(),'[df$MeetingDoc.browse].cardsTable','Расширенная',false,
'<?xml version="1.0" encoding="UTF-8"?>
<presentation>
<columns>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="important" visible="true"/>
<columns id="number" visible="true"/>
<columns id="createTs" visible="true"/>
<columns id="theme" visible="true"/>
<columns id="target" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="department" visible="true"/>
<columns id="parentCard" visible="true"/>
<columns id="docCategory" visible="true"/>
<columns id="dateTime" visible="true"/>
<columns id="duration" visible="true"/>
<columns id="place" visible="true"/>
<columns id="chairman" visible="true"/>
<columns id="initiator" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="secretary" visible="true"/>
<columns id="locState" visible="true"/>
</columns>
<groupProperties/>
</presentation>
');
