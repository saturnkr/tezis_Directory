-- $Id: 140207-1210-deleteCardProcs.sql 14797 2014-02-07 08:54:18Z gaponenkov $
-- Description: remove CardProc which contain a deleted Proc

delete from wf_card_proc where exists (select * from wf_proc where wf_card_proc.proc_id = wf_proc.id and wf_proc.delete_ts is not null)