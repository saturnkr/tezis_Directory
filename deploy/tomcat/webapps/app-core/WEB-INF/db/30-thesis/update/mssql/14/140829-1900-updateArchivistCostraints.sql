--$Id: 140829-1900-updateArchivistCostraints.sql 17244 2014-08-29 14:47:55Z saiyan $

-- archivist must not see others templates, if that templates are linked to archived office file

update sec_constraint set where_clause = '({E}.docOfficeData.officeFile.state >= 30 and {E}.template = false or (acl.user.id = :session$userId or acl.global = true))' where id = 'bc94a0d4-10ca-11e4-8fb1-07511252f87c';
update sec_constraint set where_clause = '({E}.docOfficeData.officeFile.state >= 30 and {E}.template = false or (acl.user.id = :session$userId or acl.global = true))' where id = 'bfb52f2c-10ca-11e4-bf3e-934403a7308f';
update sec_constraint set where_clause = '({E}.docOfficeData.officeFile.state >= 30 and {E}.template = false or (acl.user.id = :session$userId or acl.global = true))' where id = 'c2292574-10ca-11e4-857e-bb6e9cc79bd5';