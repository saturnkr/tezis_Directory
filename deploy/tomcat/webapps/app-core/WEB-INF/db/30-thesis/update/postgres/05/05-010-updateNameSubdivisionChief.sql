-- $Id: 05-010-updateNameSubdivisionChief.sql 5029 2012-05-18 05:16:27Z Novikov $

UPDATE SEC_ROLE SET LOC_NAME = 'Руководитель подразделения' WHERE LOC_NAME = 'Начальник отдела';