select ABSTRACT,TPABSTRACT,a.* from ATS_TRANSACTIONS a where reqseqid='20301010_44133';
/*
update ATS_TRANSACTIONS set ABSTRACT='1234' where reqseqid='20301010_44133';
update ATS_TRANSACTIONS set TPABSTRACT='5678' where reqseqid='20301010_44133';
*/

select a.* from ldtask a where TASKDESCRIBE like '%退票%';
select a.* from ldtask a where taskdescribe like '%获取账务凭证编号批处理%';
select a.* from ldtask a where TASKCLASS like 'AutoUpdateZJGlvoucherNOTask';
select a.* from ldtaskplan a where TASKCODE='000571';

select REMARK,TPREMARK,a.* from ljaget a where otherno='7402121100347973';

select a.* from lyrefundlog a where otherno='7402121100347973' and SERIALNO <> '20301010_44133';

select a.* from lyreturnfrombankb a where serialno='20301010_44133';

select a.* from ldtask a where TASKCLASS='AutoExportFinitemTask';--自动提账批处理  StartDate  EndDate  CertificateID：SF_FF

select a.* from ldtask a where TASKDESCRIBE like '%生存金%';

select a.* from ljspay a where otherno='2025080100000386';

update ats_transactions a
set a.TPVOUCHERNO=(select p.glvoucherno
                   from lyatstranrela p
                   where a.rdseq = p.rdseq and p.acttype = 'ZJ' and p.STANDBYFLAG5='TPJY' and rownum = 1)
where exists (select 1 from lyatstranrela p where a.rdseq = p.rdseq and p.acttype = 'ZJ' )
  and a.glvoucherno is null ;


select p.glvoucherno from lyatstranrela p where reqseqid='20301010_44133' and p.acttype='ZJ' and rownum=1 and STANDBYFLAG5='TPJY';

select a.* from ATS_TRANSACTIONS a where reqseqid='20301010_44133';