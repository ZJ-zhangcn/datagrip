SELECT * from ldcode where codetype = 'HLAutopayRisk' and code = '1136002';

select case when dt <= 4 then 5 * endcv else 5 * endcv - 227.5 end
from CV_1136002 a
where pt = 5
  and age = 75
  and gender = 0
order by dt;

select HESITATEEND,a.* from LMEdorWT a where riskcode='1136002';

select round(7397.43*round(0.03/365,8)*(date'2025-10-10'-date'2025-09-25'),2) 利息 from dual;

--红利
select round(prem/1000*11.33*1.2,2) from lcpol a where contno='2025090900000756';

--红利利息
select round(149.56*round(0.03/365,8)*(date'2026-10-10'-date'2026-09-10'),2) 利息 from lcpol a where contno='2025090900000756';

select a.* from BonusRate a where riskcode='1116002';
/*
INSERT INTO LISDATA.BONUSRATE (RISKCODE, CVALIDATE, ENDDATE, BONUSGRADE, BONUSRATE) VALUES ('1116002', DATE '2025-12-24', DATE '2026-12-23', 'H', '1.2');
*/

select a.* from LISDATA.LJAPAYPERSON a where contno='2025090900000986' order by PAYCOUNT;

--复效利息
select round(5000 * round(0.03 / 365, 8) * (date'2029-11-10' - date'2027-09-10'), 2) +
       round(5000 * round(0.03 / 365, 8) * (date'2029-11-10' - date'2028-09-10'), 2) +
       round(5000 * round(0.03 / 365, 8) * (date'2029-11-10' - date'2029-09-10'), 2) 利息
from dual;

--生存金利息
select 439.5 * 4                                                                       本金,
       160.05 /*已产生的利息*/+ round(523.53 * round(0.06 / 365, 8) * (date'2034-11-10' - date'2034-09-10'), 2) +
       round(489.15 * round(0.06 / 365, 8) * (date'2034-11-10' - date'2034-09-10'), 2) +
       round(465.87 * round(0.06 / 365, 8) * (date'2034-11-10' - date'2034-09-10'), 2) +
       round(439.50 * round(0.06 / 365, 8) * (date'2034-11-10' - date'2034-11-10'), 2) 利息
from dual;

--t≤PPP，年领未欠缴保费
select round(a.prem / 1000 * b.endcv *
             power(1 + 0.0375,
                   (((date '2026-08-10' - date '2025-09-10') - 365) / 365)), 2) cash
from lcpol a,
     cv_1136002 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025090900000986'
  and b.dt = 1;

--t≤PPP，年领欠缴保费
select round(a.prem / 1000 * b.endcv - 0, 2) cash
from lcpol a,
     cv_1136002 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025090900000986'
  and b.dt = 8;

--t>PPP，年领欠缴保费
select round(a.prem / 1000 * b.endcv - 439.5, 2) cash
  from lcpol a, cv_1136002 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno = '2025090900000986'
   and b.dt = 8;

--t>PPP，年领未欠缴保费
select round((a.prem / 1000 * b.endcv * (date '2034-11-10' - date '2034-09-10') / 365) +
             (a.prem / 1000 * b.begcv *
              (365 - (date '2034-11-10' - date '2034-09-10')) / 365), 2) cash
from lcpol a,
     cv_1136002 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025090900000986'
  and b.dt = 10;

