-- $Id: 130904-1437-updateOutcomeAssignment.sql 12102 2013-09-30 11:24:49Z zudin $

update wf_assignment SET outcome  = 'REASSIGN_ACTION' where outcome  = 'ReassignCard';