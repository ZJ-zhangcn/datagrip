select a.* from ATS_TRANSACTIONS a where reqseqid='20260101_30902';

select a.* from ldtask a where TASKDESCRIBE like '%退票%';
select a.* from ldtask a where taskdescribe like '%获取账务凭证编号批处理%';
select a.* from ldtaskplan a where TASKCODE='000634';

select a.* from ljaget a where otherno='7402121100329027';

select a.* from lyrefundlog a where otherno='7402121100329027' and SERIALNO <> '20260101_30902';

select a.* from lyreturnfrombankb a where serialno='20260101_30902';

select a.* from ldtask a where TASKCLASS='AutoExportFinitemTask';--自动提账批处理  StartDate  EndDate  CertificateID：SF_FF

select a.* from ldtask a where TASKDESCRIBE like '%生存金%';

select a.* from ljspay a where otherno='2025080100000386';