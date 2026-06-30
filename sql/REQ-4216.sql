-- id: req-4216
-- 标题: 浦发接口文档-保险公司续交保单信息确认接口开发需求

select a.* from ldtask a where taskdescribe like '%续期明细%'

select * from ybtinsrenewal order by to_number(serialno);

/*
update ybtinsrenewal set makedate=date'2024-07-10',modifydate=date'2024-07-10'

update ybtinsrenewal set makedate=date'2025-03-05',modifydate=date'2025-03-05' where serialno='4'
*/

select contno,prtno from lcpol a where prtno in (select proposalprtno from ybtinsrenewal)

select contno,payperiod,serialno from ybtinsrenewal where funcflag='182' and busitype='XQ' and state='0' and makedate=date '2024-07-09'

select paytodate,a.* from lcpol a where contno='2023030300001206'

select a.* from lccontstate a where contno='2023110600000786'

select payform,a.* from ljspay a where otherno='2023030300001206'

select sysvarvalue from ldsysvar where sysvar = 'SHSFtp';

--/callsvc/spdb/
select sysvarvalue from ldsysvar where sysvar = 'BDFtp'

select a.* from lccont a where agentcom like '03%' and payintv='12' and appflag='1' order by contno desc

select contno,prem,amnt,cvalidate,paytodate from lcpol a where prtno in ('2024092500000476','2024031500000106','5000118231130047','5000118231130030');