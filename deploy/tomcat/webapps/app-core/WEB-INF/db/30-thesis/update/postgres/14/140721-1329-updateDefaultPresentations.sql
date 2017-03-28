--$Id: 140721-1329-updateDefaultPresentations.sql 16802 2014-07-22 11:45:51Z kozyaikin $
update sec_presentation set xml =
'<?xml version="1.0" encoding="UTF-8"?>
<presentation>
<columns>
<columns id="docKind" visible="true"/>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="currentActorsString" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="owner" visible="false"/>
<columns id="number" visible="true"/>
<columns id="regNo" visible="true"/>
<columns id="date" visible="true"/>
<columns id="proc.name" visible="true"/>
<columns id="locState" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="resolution" visible="false"/>
<columns id="endorsementStartDate" visible="false"/>
<columns id="endorsementEndDate" visible="false"/>
<columns id="approvalDate" visible="false"/>
<columns id="docCategory" visible="false"/>
<columns id="hasAttributes" visible="false"/>
<columns id="important" visible="true"/>
<columns id="theme" visible="true"/>
<columns id="project" visible="false"/>
</columns>
<groupProperties/>
</presentation>
' where component='[df$SimpleDoc.browse].docsTable' and name='Основная';

update sec_presentation set xml =
'<?xml version="1.0" encoding="UTF-8"?>
<presentation>
<columns>
<columns id="docKind" visible="true"/>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="currentActorsString" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="owner" visible="true"/>
<columns id="number" visible="true"/>
<columns id="regNo" visible="true"/>
<columns id="date" visible="true"/>
<columns id="proc.name" visible="true"/>
<columns id="locState" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="resolution" visible="true"/>
<columns id="endorsementStartDate" visible="true"/>
<columns id="endorsementEndDate" visible="true"/>
<columns id="approvalDate" visible="true"/>
<columns id="docCategory" visible="true"/>
<columns id="hasAttributes" visible="true"/>
<columns id="important" visible="true"/>
<columns id="theme" visible="true"/>
<columns id="project" visible="true"/>
</columns>
<groupProperties/>
</presentation>
' where component='[df$SimpleDoc.browse].docsTable' and name='Расширенная';


update sec_presentation set xml =
'<?xml version="1.0" encoding="UTF-8"?>
<presentation>
<columns>
	<columns id="initiator.name" visible="true"/>
	<columns id="hasAttachments" width="30" visible="true"/>
	<columns id="important" width="30" visible="true"/>
	<columns id="taskName" width="400" visible="true"/>
	<columns id="fullDescr" width="400" visible="true"/>
	<columns id="createDate" width="100" visible="true"/>
	<columns id="num" visible="true"/>
	<columns id="currentActorsString" visible="true"/>
	<columns id="percentCompletion" visible="false"/>
	<columns id="locState" visible="true"/>
	<columns id="finishDateTimePlan" visible="true"/>
	<columns id="finishDateFact" visible="false"/>
	<columns id="priority" visible="true"/>
	<columns id="executorsString" visible="true"/>
	<columns id="taskType" visible="false"/>
	<columns id="parentCard" visible="false"/>
	<columns id="labourHour" visible="false"/>
	<columns id="hasAttributes" visible="false"/>
	<columns id="project" visible="false"/>
</columns>
<groupProperties/>
</presentation>
' where component='[tm$Task.browse].tasksTable' and name='Основная';


update sec_presentation set xml =
'<?xml version="1.0" encoding="UTF-8"?>
<presentation>
<columns>
	<columns id="initiator.name" visible="true"/>
	<columns id="hasAttachments" width="30" visible="true"/>
	<columns id="important" width="30" visible="true"/>
	<columns id="taskName" width="400" visible="true"/>
	<columns id="fullDescr" width="400" visible="true"/>
	<columns id="createDate" width="100" visible="true"/>
	<columns id="num" visible="true"/>
	<columns id="currentActorsString" visible="true"/>
	<columns id="percentCompletion" visible="true"/>
	<columns id="locState" visible="true"/>
	<columns id="finishDateTimePlan" visible="true"/>
	<columns id="finishDateFact" visible="true"/>
	<columns id="priority" visible="true"/>
	<columns id="executorsString" visible="true"/>
	<columns id="taskType" visible="true"/>
	<columns id="parentCard" visible="true"/>
	<columns id="labourHour" visible="true"/>
	<columns id="hasAttributes" visible="true"/>
	<columns id="project" visible="true"/>
</columns>
<groupProperties/>
</presentation>
' where component='[tm$Task.browse].tasksTable' and name='Расширенная';

update sec_presentation set xml =
'<?xml version="1.0" encoding="UTF-8"?>
<presentation textSelection="false">
<columns>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="important" width="30" visible="true"/>
<columns id="docKind" visible="true"/>
<columns id="contractor" visible="true"/>
<columns id="currentActorsString" visible="true"/>
<columns id="number" visible="true"/>
<columns id="date" visible="true"/>
<columns id="proc.name" visible="true"/>
<columns id="locState" visible="true"/>
<columns id="amount" visible="true"/>
<columns id="currency" visible="true"/>
<columns id="active" visible="false"/>
<columns id="organization" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="docCategory" visible="true"/>
<columns id="owner" visible="true"/>
<columns id="department" visible="false"/>
<columns id="liabilityStart" visible="true"/>
<columns id="liabilityEnd" visible="true"/>
<columns id="endorsementStartDate" visible="false"/>
<columns id="endorsementEndDate" visible="false"/>
<columns id="approvalDate" visible="false"/>
<columns id="hasAttributes" visible="false"/>
<columns id="project" visible="false"/>
</columns>
<groupProperties/>
</presentation>
' where component='[df$Contract.browse].docsTable' and name='Основная';

update sec_presentation set xml =
'<?xml version="1.0" encoding="UTF-8"?>
<presentation textSelection="false">
<columns>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="important" width="30" visible="true"/>
<columns id="docKind" visible="true"/>
<columns id="contractor" visible="true"/>
<columns id="currentActorsString" visible="true"/>
<columns id="number" visible="true"/>
<columns id="date" visible="true"/>
<columns id="proc.name" visible="true"/>
<columns id="locState" visible="true"/>
<columns id="amount" visible="true"/>
<columns id="currency" visible="true"/>
<columns id="active" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="docCategory" visible="true"/>
<columns id="owner" visible="true"/>
<columns id="department" visible="true"/>
<columns id="liabilityStart" visible="true"/>
<columns id="liabilityEnd" visible="true"/>
<columns id="endorsementStartDate" visible="true"/>
<columns id="endorsementEndDate" visible="true"/>
<columns id="approvalDate" visible="true"/>
<columns id="hasAttributes" visible="true"/>
<columns id="project" visible="true"/>
</columns>
<groupProperties/>
</presentation>
' where component='[df$Contract.browse].docsTable' and name='Расширенная';

update sec_presentation set xml =
'<?xml version="1.0" encoding="UTF-8"?>
<presentation textSelection="false">
<columns>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="currentActorsString" visible="true"/>
<columns id="docKind" visible="true"/>
<columns id="number" visible="true"/>
<columns id="date" visible="true"/>
<columns id="owner" visible="false"/>
<columns id="proc.name" visible="false"/>
<columns id="locState" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="docOfficeDocKind" visible="false"/>
<columns id="docOfficeData.officeFile" visible="true"/>
<columns id="regDate" visible="true"/>
<columns id="regNo" visible="true"/>
<columns id="outcomeNo" visible="true"/>
<columns id="outcomeDate" visible="true"/>
<columns id="addressees" visible="true"/>
<columns id="docOfficeData.sender" visible="true"/>
<columns id="docOfficeData.responsePlanDate" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="resolution" visible="false"/>
<columns id="endorsementStartDate" visible="false"/>
<columns id="endorsementEndDate" visible="false"/>
<columns id="approvalDate" visible="false"/>
<columns id="important" visible="true"/>
<columns id="project" visible="false"/>
</columns>
<groupProperties/>
</presentation>
' where component='[df$DocIncome.browse].cardsTable' and name='Основная';

update sec_presentation set xml =
'<?xml version="1.0" encoding="UTF-8"?>
<presentation textSelection="false">
<columns>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="currentActorsString" visible="true"/>
<columns id="docKind" visible="true"/>
<columns id="number" visible="true"/>
<columns id="date" visible="true"/>
<columns id="owner" visible="true"/>
<columns id="proc.name" visible="true"/>
<columns id="locState" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="docOfficeDocKind" visible="true"/>
<columns id="docOfficeData.officeFile" visible="true"/>
<columns id="regDate" visible="true"/>
<columns id="regNo" visible="true"/>
<columns id="outcomeNo" visible="true"/>
<columns id="outcomeDate" visible="true"/>
<columns id="addressees" visible="true"/>
<columns id="docOfficeData.sender" visible="true"/>
<columns id="docOfficeData.responsePlanDate" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="resolution" visible="true"/>
<columns id="endorsementStartDate" visible="true"/>
<columns id="endorsementEndDate" visible="true"/>
<columns id="approvalDate" visible="true"/>
<columns id="important" visible="true"/>
<columns id="project" visible="true"/>
</columns>
<groupProperties/>
</presentation>
' where component='[df$DocIncome.browse].cardsTable' and name='Расширенная';


update sec_presentation set xml =
'<?xml version="1.0" encoding="UTF-8"?>
<presentation textSelection="false">
<columns>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="currentActorsString" visible="true"/>
<columns id="docKind" visible="true"/>
<columns id="number" visible="true"/>
<columns id="date" visible="true"/>
<columns id="owner" visible="false"/>
<columns id="proc.name" visible="false"/>
<columns id="locState" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="docOfficeDocKind" visible="false"/>
<columns id="docOfficeData.officeFile" visible="true"/>
<columns id="regDate" visible="true"/>
<columns id="regNo" visible="true"/>
<columns id="addressees" visible="true"/>
<columns id="docOfficeData.sender" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="resolution" visible="false"/>
<columns id="endorsementStartDate" visible="false"/>
<columns id="endorsementEndDate" visible="false"/>
<columns id="approvalDate" visible="false"/>
<columns id="important" visible="true"/>
<columns id="project" visible="false"/>
</columns>
<groupProperties/>
</presentation>
' where component='[df$DocInternal.browse].cardsTable' and name='Основная';

update sec_presentation set xml =
'<?xml version="1.0" encoding="UTF-8"?>
<presentation textSelection="false">
<columns>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="currentActorsString" visible="true"/>
<columns id="docKind" visible="true"/>
<columns id="number" visible="true"/>
<columns id="date" visible="true"/>
<columns id="owner" visible="true"/>
<columns id="proc.name" visible="true"/>
<columns id="locState" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="docOfficeDocKind" visible="true"/>
<columns id="docOfficeData.officeFile" visible="true"/>
<columns id="regDate" visible="true"/>
<columns id="regNo" visible="true"/>
<columns id="addressees" visible="true"/>
<columns id="docOfficeData.sender" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="resolution" visible="true"/>
<columns id="endorsementStartDate" visible="true"/>
<columns id="endorsementEndDate" visible="true"/>
<columns id="approvalDate" visible="true"/>
<columns id="important" visible="true"/>
<columns id="project" visible="true"/>
</columns>
<groupProperties/>
</presentation>
' where component='[df$DocInternal.browse].cardsTable' and name='Расширенная';

update sec_presentation set xml =
'<?xml version="1.0" encoding="UTF-8"?>
<presentation textSelection="false">
<columns>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="currentActorsString" visible="true"/>
<columns id="docKind" visible="true"/>
<columns id="number" visible="true"/>
<columns id="date" visible="true"/>
<columns id="owner" visible="false"/>
<columns id="proc.name" visible="false"/>
<columns id="locState" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="docOfficeDocKind" visible="false"/>
<columns id="docOfficeData.officeFile" visible="true"/>
<columns id="regDate" visible="true"/>
<columns id="regNo" visible="true"/>
<columns id="addressees" visible="true"/>
<columns id="docOfficeData.sender" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="resolution" visible="false"/>
<columns id="endorsementStartDate" visible="false"/>
<columns id="endorsementEndDate" visible="false"/>
<columns id="approvalDate" visible="false"/>
<columns id="important" visible="true"/>
<columns id="project" visible="false"/>
</columns>
<groupProperties/>
</presentation>
' where component='[df$DocOutcome.browse].cardsTable' and name='Основная';

update sec_presentation set xml =
'<?xml version="1.0" encoding="UTF-8"?>
<presentation textSelection="false">
<columns>
<columns id="hasAttachments" width="30" visible="true"/>
<columns id="currentActorsString" visible="true"/>
<columns id="docKind" visible="true"/>
<columns id="number" visible="true"/>
<columns id="date" visible="true"/>
<columns id="owner" visible="true"/>
<columns id="proc.name" visible="true"/>
<columns id="locState" visible="true"/>
<columns id="organization" visible="true"/>
<columns id="docOfficeDocKind" visible="true"/>
<columns id="docOfficeData.officeFile" visible="true"/>
<columns id="regDate" visible="true"/>
<columns id="regNo" visible="true"/>
<columns id="addressees" visible="true"/>
<columns id="docOfficeData.sender" visible="true"/>
<columns id="comment" visible="true"/>
<columns id="resolution" visible="true"/>
<columns id="endorsementStartDate" visible="true"/>
<columns id="endorsementEndDate" visible="true"/>
<columns id="approvalDate" visible="true"/>
<columns id="important" visible="true"/>
<columns id="project" visible="true"/>
</columns>
<groupProperties/>
</presentation>
' where component='[df$DocOutcome.browse].cardsTable' and name='Расширенная';

















