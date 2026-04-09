select GETMONEY, JQAMNT, a.*
from LJABonusGet a
where contno = '2026012200000796'
order by makedate, maketime;

select a.*
from BONUSRATE a
where riskcode = '1136003';

select a.*
from LIS.LJSGETDRAW a
where contno = '2026012200000796';

select a.amnt + b.amnt
from lccont a,
     lcduty b
where a.contno = b.contno
  and b.dutycode = 'ID05041001'
  and a.contno = '2026012200000796';

--累积交清基本保险金额减保限额
select round(a.AMNT / 1000 * cv2 * (date '2031-02-10' - date '2031-01-23') / 365 +
             a.AMNT / 1000 * cv1 * (1 - (date '2031-02-10' - date '2031-01-23') / 365), 2) cash
from lcduty a,
     PUA_1136003 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.INSUREDAPPAGE
  and b.GENDER = c.INSUREDSEX
  and a.DUTYCODE like '%1001'
  and a.contno = '2026012200000796'
  and b.dt = 6;
--累积交清基本保险金额减保后保额  select (1-第t次减保的金额/第t次减保前的现金价值)*第t次减保前的保额 from dual;
select round((1 - 1000 / 7575.90) * 215.43, 2) 减保后保额
from dual;

--基本保额减保限额
select least(round(1780 * 0.2 / a.amnt * ((a.prem / 1000 * b.endcv * (date '2031-02-10' - date '2031-01-23') / 365) +
                                          (a.prem / 1000 * b.begcv *
                                           (365 - (date '2031-02-10' - date '2031-01-23')) / 365)) - 10000, 2),
             round(100000 * 0.2 - 10000, 2),
             round(((a.prem / 1000 * b.endcv * (date '2031-02-10' - date '2031-01-23') / 365) +
                    (a.prem / 1000 * b.begcv *
                     (365 - (date '2031-02-10' - date '2031-01-23')) / 365)), 2)) 减保限额
from lcpol a,
     cv_1136003 b,
     lcduty c
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = c.contno
  and c.dutycode = 'ID0504'
  and a.contno = '2026012200000796'
  and b.dt = 6;

--减保后保额
select round((1 - 1000 / ((a.prem / 1000 * b.endcv * (date '2031-02-10' - date '2031-01-23') / 365) +
                          (a.prem / 1000 * b.begcv *
                           (365 - (date '2031-02-10' - date '2031-01-23')) / 365))) * 1604.2, 2) 减保后保额
from lcpol a,
     cv_1136003 b,
     lcduty c
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = c.contno
  and c.dutycode = 'ID0504'
  and a.contno = '2026012200000796'
  and b.dt = 6;

select round(1604.2 * 1000 / rate, 2)
from lcpol a,
     rt_1136003 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2026012200000796';

--本年度购买交清保额=实际给付红利*1000/趸交净保费率
select round(a.prem / 1000 * b.BonusFactor * nvl(c.bonusrate, '0'), 2) 当年度基本保额红利,
       decode(d.dt, 1, 0, round(e.amnt / 1000 * nvl(b.jqbonusfactor, 0) * nvl(c.bonusrate, '0'),
                                2))                                    已产生的减额交清红利,
       round(a.prem / 1000 * b.BonusFactor * nvl(c.bonusrate, '0'), 2) +
       decode(d.dt, 1, 0, round(e.amnt / 1000 * nvl(b.jqbonusfactor, 0) * nvl(c.bonusrate, '0'),
                                2))                                    当年度总和,
       round((round(a.prem / 1000 * b.BonusFactor * nvl(c.bonusrate, '0'), 2) +
              decode(d.dt, 1, 0, round(e.amnt / 1000 * nvl(b.jqbonusfactor, 0) * nvl(c.bonusrate, '0'),
                                       2))) * 1000 / PUACOST, 2)       当年度减额交清红利
from lcpol a,
     lobonusfactor b,
     BonusRate c,
     PUA_1136003 d,
     lcduty e
where a.riskcode = b.RISKCODE
  and a.riskcode = c.RISKCODE
  and b.INSUREDSEX = a.INSUREDSEX
  and b.InsuYear = a.INSUYEAR
  and b.INSUYEARFLAG = a.INSUYEARFLAG
  and b.PAYENDYEAR = a.PAYENDYEAR
  and b.PAYENDYEARFLAG = a.PAYENDYEARFLAG
  and b.INSUREDAPPAGE = a.INSUREDAPPAGE
  and b.INSUREDAPPAGE = d.AGE
  and b.INSUREDSEX = d.GENDER
  and b.PolYear = d.DT
  and a.contno = e.contno
  and to_date('2027-01-22', 'yyyy-mm-dd') between b.startdate and b.enddate
  and to_date('2027-01-22', 'yyyy-mm-dd') between c.cvalidate and c.enddate
  and b.bonusgrade = 'H'
  and b.annuitygetage = '0'
--   and e.DUTYCODE like '%1001'/*dt='1'时注释掉*/
  and d.dt = '1'
  and a.contno = '2026012200000796'
order by d.dt;