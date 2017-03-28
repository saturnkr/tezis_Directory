-- $Id: 05-000-updateNameDepartmentChief.sql 5025 2012-05-17 13:48:43Z Novikov $

UPDATE SEC_ROLE SET LOC_NAME = 'Руководитель департамента' WHERE LOC_NAME = 'Начальник отдела';
UPDATE SEC_ROLE SET LOC_NAME = 'Начальник отдела' WHERE LOC_NAME = 'Начальник подразделения';