--$Id: 150401-1600-updateCardTypesInProc.sql 19645 2015-04-01 13:15:45Z saiyan $


update wf_proc
set card_types = card_types || ',df$Doc,'
where ((card_types like '%$SimpleDoc%' or card_types like '%$Contract%') and card_types not like '%df$Doc%');