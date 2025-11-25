--保费算保额
select prem / 1000 * 12
from lcpol
where prtno = '5000118350917184';
--保单打印现价
select endcv, round(a.prem / 1000 * b.endcv - case when dt < 55 or dt = 99 then 0 else 770 end, 2) cash
from lcpol a,
     cv_1036011 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and ANNUITYGETAGE = '55'
  and a.contno = '2025091800000856'
order by dt;
--月领生存金
select round(amnt * 8.42 / 100 * 1, 2)
from lcpol a
where contno = '2025091800000856';
--年领生存金
select round(amnt * 1, 2)
from lcpol a
where contno = '2025091900001376';
--满期金
select prem+amnt*1 from lcpol a where contno='2025091800001096';
select a.*
from ljsget a
where otherno = '2025091900000316';
select a.*
from LISDATA.LJSGETDRAW a
where contno = '2025091800001096';
select a.*
from LISDATA.LOPRTMANAGER a
where otherno = '2025091900000316';
select a.*
from ljagetdraw a
where contno = '2025091900001376';
--复效利息
select round(5000 * round(0.03 / 365, 8) * (date'2028-11-20' - date'2027-09-20'), 2) 利息
from dual;
--生存金
select 60 + 120 + 180 本金, 14.65 + round(374.65 * round(0.06 / 365, 8) * (date'2028-10-20' - date'2028-09-20'), 2) 利息
from dual;
--犹豫期天数
select HESITATEEND,a.* from LMEdorWT a where riskcode='1036011';
--还款利息
select round(2075.56*round(0.03/365,8)*(date'2025-11-10'-date'2025-10-11'),2) LX from dual;
--退保
--t≤PPP，月领未欠缴保费
select round(a.prem / 1000 * b.endcv *
             power(1 + 0.04,
                   (((date '2026-10-20' - date '2026-09-20') - 365) / 365)) +
             greatest(60 - 5.05 * 2, 0), 2) cash
from lcpol a,
     cv_1036011 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025091900000316'
  and b.dt = 2;
--t≤PPP，月领欠缴保费
select round(a.prem / 1000 * b.endcv - 5.05, 2) cash
from lcpol a,
     cv_1036011 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025091900000316'
  and b.dt = 1;
--t>PPP，月领欠缴保费
select round(a.prem / 1000 * b.endcv - 0, 2) cash
from lcpol a,
     cv_1036011 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025091900000316'
  and b.dt = 2;
--t>PPP，月领未欠缴保费
select round((a.prem / 1000 * b.endcv * (date '2075-10-20' - date '2075-09-19') / 366) +
             (a.prem / 1000 * b.begcv * (366 - (date '2075-10-20' - date '2075-09-19')) / 366) /*+
             greatest((180 - 0), 0)*/, 2) cash
from lcpol a,
     cv_1036011 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and ANNUITYGETAGE = '55'
  and a.contno = '2025091800000856'
  and b.dt = 51;
--t≤PPP，年领未欠缴保费
select round(a.prem / 1000 * b.endcv *
             power(1 + 0.04,
                   (((date '2026-09-10' - date '2025-09-20') - 365) / 365)), 2) cash
from lcpol a,
     cv_1036011 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025091900001376'
  and b.dt = 1;
--t≤PPP，年领欠缴保费
select round(a.prem / 1000 * b.endcv - 60, 2) cash
from lcpol a,
     cv_1036011 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025091900001376'
  and b.dt = 1;
--t>PPP，年领欠缴保费
select round(a.prem / 1000 * b.endcv - 120, 2) cash
from lcpol a,
     cv_1036011 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025091900001376'
  and b.dt = 2;
--t>PPP，年领未欠缴保费
select round((a.prem / 1000 * b.endcv * (date '2028-10-20' - date '2028-09-20') / 365) +
             (a.prem / 1000 * b.begcv *
              (365 - (date '2028-10-20' - date '2028-09-20')) / 365), 2) cash
from lcpol a,
     cv_1036011 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025091900001376'
  and b.dt = 4;