-- id: req-4844
-- 标题: 资金系统与核心系统对接退票数据系统优化的需求

select abstract,tpabstract,a.* from ats_transactions a where reqseqid='20301010_44133';

/*
update ats_transactions set abstract='1234' where reqseqid='20301010_44133';

update ats_transactions set tpabstract='5678' where reqseqid='20301010_44133';
*/

select a.* from ldtask a where taskdescribe like '%退票%';

select a.* from ldtask a where taskdescribe like '%获取账务凭证编号批处理%';

select a.* from ldtask a where taskclass like 'AutoUpdateZJGlvoucherNOTask';

select a.* from ldtaskplan a where taskcode='000571';

select remark,tpremark,a.* from ljaget a where otherno='7402121100347973';

select a.* from lyrefundlog a where otherno='7402121100347973' and serialno <> '20301010_44133';

select a.* from lyreturnfrombankb a where serialno='20301010_44133';

select a.* from ldtask a where taskclass='AutoExportFinitemTask';

--自动提账批处理  startdate  enddate  certificateid：sf_ff

select a.* from ldtask a where taskdescribe like '%生存金%';

select a.* from ljspay a where otherno='2025080100000386';

/*
update ats_transactions a
set a.tpvoucherno=(select p.glvoucherno
                   from lyatstranrela p
                   where a.rdseq = p.rdseq and p.acttype = 'ZJ' and p.standbyflag5='TPJY' and rownum = 1)
where exists (select 1 from lyatstranrela p where a.rdseq = p.rdseq and p.acttype = 'ZJ' )
  and a.glvoucherno is null;
*/
select p.glvoucherno from lyatstranrela p where reqseqid='20301010_44133' and p.acttype='ZJ' and rownum=1 and standbyflag5='TPJY';

select a.* from ats_transactions a where reqseqid='20301010_44133';