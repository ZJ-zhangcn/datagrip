select GETMONEY, JQAMNT, a.*
from LJABonusGet a
where contno = '2025122900000176'
order by makedate, maketime;

select a.*
from BONUSRATE a
where riskcode = '1136003';

select a.*
from ljaget a
where otherno in ('7402121100330994', '7402121100330995');

--累积交清基本保险金额减保限额
select round(a.AMNT / 1000 * cv2 * (date'2027-01-20' - date'2026-12-27') / 365 +
             a.AMNT / 1000 * cv1 * (1 - (date'2027-01-20' - date'2026-12-27') / 365), 2) cash
from lcduty a,
     PUA_1136003 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.INSUREDAPPAGE
  and b.GENDER = c.INSUREDSEX
  and a.DUTYCODE like '%1001'
  and a.contno = '2025122600000186'
  and b.dt = 2;
--累积交清基本保险金额减保后保额  select (1-第t次减保的金额/第t次减保前的现金价值)*第t次减保前的保额 from dual;
select round((1 - 1000 / 1189.62) * 45.7, 2) 减保后保额
from dual;

--基本保额减保限额
select least(round(8470 * 0.2 / a.amnt * ((a.prem / 1000 * b.endcv * (date '2032-01-20' - date '2031-12-30') / 366) +
                                          (a.prem / 1000 * b.begcv *
                                           (366 - (date '2032-01-20' - date '2031-12-30')) / 366)) - 10000, 2),
             round(600000 * 0.2 - 10000, 2),
             round(((a.prem / 1000 * b.endcv * (date '2032-01-20' - date '2031-12-30') / 366) +
                    (a.prem / 1000 * b.begcv *
                     (366 - (date '2032-01-20' - date '2031-12-30')) / 366)), 2)) 减保限额
from lcpol a,
     cv_1136003 b,
     lcduty c
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = c.contno
  and a.contno = '2025122900000176'
  and b.dt = 7;

--减保后保额
select round((1 - 20000 / ((a.prem / 1000 * b.endcv * (date '2032-01-20' - date '2031-12-30') / 366) +
                           (a.prem / 1000 * b.begcv *
                            (366 - (date '2032-01-20' - date '2031-12-30')) / 366))) * 8320, 2) 减保后保额
from lcpol a,
     cv_1136003 b,
     lcduty c
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = c.contno
  and a.contno = '2025122900000176'
  and b.dt = 7;

select round(ENDCV * prem / 1000, 2)
from lcpol a,
     cv_1136003 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025122900000176'
order by dt;