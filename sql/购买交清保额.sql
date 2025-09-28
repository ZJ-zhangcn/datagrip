--本年度购买交清保额=实际给付红利*1000/趸交净保费率
select round(amnt / 1000 * b.BonusFactor * nvl(c.bonusrate, '0'), 2)              当年度基本保额红利,
       round(9146.16 / 1000 * nvl(b.jqbonusfactor, 0) * nvl(c.bonusrate, '0'), 2) 已产生的减额交清红利,
       round(amnt / 1000 * b.BonusFactor * nvl(c.bonusrate, '0'), 2) +
       round(9146.16 / 1000 * nvl(b.jqbonusfactor, 0) * nvl(c.bonusrate, '0'), 2) 当年度总和,
       round(10281.87 * 1000 / PUACOST, 2)                                        当年度减额交清红利
from lcpol a,
     lobonusfactor b,
     BonusRate c,
     PUA_1111002 d
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
  and to_date('2027-09-29', 'yyyy-mm-dd') between b.startdate and b.enddate
  and to_date('2027-09-29', 'yyyy-mm-dd') between c.cvalidate and c.enddate
  and b.bonusgrade = 'H'
  and b.annuitygetage = '0'
  and d.dt = '2'
  and a.contno = '2025092800000286'
order by d.dt;

select a.*
from lobonusfactor a
where riskcode = '1111002'
  and INSUREDSEX = 1
  and PAYENDYEAR = 1000
  and INSUREDAPPAGE = 50
  and BONUSGRADE = 'H'
order by to_number(POLYEAR);

select a.*
from BonusRate a
where riskcode = '1111002'
order by CVALIDATE;

select a.*
from PUA_1111002 a
where age = 50
  and gender = 1
order by dt;

select GETMONEY, JQAMNT, a.*
from LJABonusGet a
where contno = '2025092800000286'
order by makedate, maketime;

select nvl(sum(JQAmnt), 0)
from LJABonusGet
where otherno = '2025092800000286'
  and othernotype = '12'
  and FeeFinaType = 'HLAMNT'
  and BonusYear = '2026';

select STATEFLAG, a.*
from LOPRTMANAGER a
where otherno = '2025092800000286';

select round(606.96 * round(0.03 / 365, 8) * (date'2029-09-18' - date'2028-09-18'), 2)
from dual;

--减保限额
select 1134.88 * 0.2 / 171.09 * 1177.52 - 0,
       round(1134.88 / 1000 * 1062.2 * (date'2030-01-10' - date'2029-09-18') / 365 +
             1134.88 / 1000 * 1026.39 * (1 - (date'2030-01-10' - date'2029-09-18') / 365), 2) cash
from dual;

--减保后保额
select round((1 - 1000 / 1177.52) * 1134.88, 2)
from dual;

--减保前现价
select round(1134.88 / 1000 * 1062.2 * (date'2030-01-10' - date'2029-09-18') / 365 +
             1134.88 / 1000 * 1026.39 * (1 - (date'2030-01-10' - date'2029-09-18') / 365), 2) cash
from dual;

--累积交清基本保险金额应退金额
select round(a.AMNT / 1000 * cv2 * (date'2028-10-10' - date'2028-09-29') / 365 +
             a.AMNT / 1000 * cv1 * (1 - (date'2028-10-10' - date'2028-09-29') / 365), 2) cash
from lcduty a,
     PUA_1111002 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.INSUREDAPPAGE
  and b.GENDER = c.INSUREDSEX
  and a.DUTYCODE like '%1001'
  and a.contno = '2025092800000286'
  and b.dt = 4;

--基本保额应退金额
select round(prem / 1000 * endcv * (date'2028-10-10' - date'2028-09-29') / 365 +
             prem / 1000 * begcv *
             (1 - (date'2028-10-10' - date'2028-09-29') / 365), 2)
from cv_1111002 a,
     lcpol b
where pt = payendyear
  and age = insuredappage
  and gender = insuredsex
  and contno = '2025092800000286'
  and dt = 4;

--退保红利利息
select round(1897.24 * round(0.03 / 365, 8) * (date'2030-10-10' - date'2030-09-18'), 2)
from dual;