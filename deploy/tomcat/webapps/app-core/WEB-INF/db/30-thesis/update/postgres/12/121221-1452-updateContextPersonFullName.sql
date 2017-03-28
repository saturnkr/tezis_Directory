-- $Id$

update DF_CONTACT_PERSON set NAME =
replace(LAST_NAME || ' ' || coalesce(substr(FIRST_NAME, 1, 1), '') || '. ' || coalesce(substr(MIDDLE_NAME, 1, 1), '') || '.', '. .', '.')
where NAME IS NULL or NAME = '';