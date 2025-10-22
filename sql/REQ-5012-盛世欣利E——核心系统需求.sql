select 100000/1000*1125 from dual;
select HESITATEEND,a.* from LMEdorWT a where RISKCODE='1033041';
select signdate,CVALIDATE,a.* from lccont a where contno='2025081200000456';
--t≤PPP，未欠缴保费
select a.prem / 1000 * b.endcv *
       power(1 + 0.04,
             (((date '2025-10-10' - date '2025-08-12') - 365) / 365))
  from lcpol a, cv_1003012 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.INSUYEAR=b.BP
   and a.contno='2025081200000456'
   and b.dt = 1;
--t>PPP，未欠缴保费
select (a.prem / 1000 * b.endcv * (date '2026-10-10' - date '2026-08-07') / 365) +
       (a.prem / 1000 * b.begcv *
        (365 - (date '2026-10-10' - date '2026-08-07')) / 365)
from lcpol a,
     cv_1003012 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.INSUYEAR = b.BP
  and a.contno = '2025080600000296'
  and b.dt = 2;
select a.* from LISDATA.LOLOANMAIN a where CONTNO='2025081200000456';
select a.* from ldtask a where TASKDESCRIBE like '%贷款%';
select 10000*round(0.93/365,8)*(date'2026-10-10'-date'2026-05-11') from dual;
select appflag,amnt,(select GETMONEY from ljagetdraw where FEEFINATYPE='EF' and contno=a.contno) 满期金 from lcpol a where contno='2025081200000456';
select 11000*1.2 from dual;