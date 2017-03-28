--Remove permissions for entity tezisdirectory$Cost
delete from sec_permission where target like 'tezisdirectory$Cost:%';
delete from sec_permission where target like 'tezisdirectory$Cost.%';
