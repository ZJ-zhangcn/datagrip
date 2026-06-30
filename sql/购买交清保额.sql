--本年度购买交清保额=实际给付红利*1000/趸交净保费率
select round(a.amnt / 1000 * b.bonusfactor * nvl(c.bonusrate, '0'), 2)                                        当年度基本保额红利,
       round(e.amnt / 1000 * nvl(b.jqbonusfactor, 0) * nvl(c.bonusrate, '0'),
             2)                                                                                               已产生的减额交清红利,
       round(a.amnt / 1000 * b.bonusfactor * nvl(c.bonusrate, '0'), 2) +
       round(e.amnt / 1000 * nvl(b.jqbonusfactor, 0) * nvl(c.bonusrate, '0'),
             2)                                                                                               当年度总和,
       round((round(a.amnt / 1000 * b.bonusfactor * nvl(c.bonusrate, '0'), 2) +
              round(e.amnt / 1000 * nvl(b.jqbonusfactor, 0) * nvl(c.bonusrate, '0'), 2)) * 1000 / puacost, 2) 当年度减额交清红利
from lcpol a,
     lobonusfactor b,
     bonusrate c,
     pua_1111002 d,
     lcduty e
where a.riskcode = b.riskcode
  and a.riskcode = c.riskcode
  and b.insuredsex = a.insuredsex
  and b.insuyear = a.insuyear
  and b.insuyearflag = a.insuyearflag
  and b.payendyear = a.payendyear
  and b.payendyearflag = a.payendyearflag
  and b.insuredappage = a.insuredappage
  and b.insuredappage = d.age
  and b.insuredsex = d.gender
  and b.polyear = d.dt
  and a.contno = e.contno
  and to_date('2032-07-21', 'yyyy-mm-dd') between b.startdate and b.enddate
  and to_date('2032-07-21', 'yyyy-mm-dd') between c.cvalidate and c.enddate
  and b.bonusgrade = 'H'
  and b.annuitygetage = '0'
  and e.dutycode like '%1001'
  and d.dt = '8'
  and a.contno = '2025072000000106'
order by d.dt;

select a.*
from lobonusfactor a
where riskcode = '1111002'
  and insuredsex = 1
  and payendyear = 1000
  and insuredappage = 50
  and bonusgrade = 'H'
order by to_number(polyear);

select a.*
from bonusrate a
where riskcode = '1116003'
order by cvalidate;

select a.*
from pua_1111003 a,
     lcpol b
where a.age = b.insuredappage
  and a.gender = b.insuredsex
  and a.dt = 2
order by dt;

select getmoney, jqamnt, a.*
from ljabonusget a
where contno = '2026040700000106'
order by makedate, maketime;

select 170.51 + 4.52
from dual;

select nvl(sum(jqamnt), 0)
from ljabonusget
where otherno = '2025072000000106'
  and othernotype = '12'
  and feefinatype = 'HLAMNT'
  and bonusyear = '2026';

select a.*
from lcduty a
where contno = '2025072000000106';

select stateflag, a.*
from loprtmanager a
where otherno = '2025072000000106';

select round(606.96 * round(0.03 / 365, 8) * (date'2029-09-18' - date'2028-09-18'), 2)
from dual;

--累积交清基本保险金额减保限额
select round(a.amnt / 1000 * cv2 * (date'2028-10-10' - date'2028-09-29') / 365 +
             a.amnt / 1000 * cv1 * (1 - (date'2028-10-10' - date'2028-09-29') / 365), 2) cash
from lcduty a,
     pua_1111002 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.insuredappage
  and b.gender = c.insuredsex
  and a.dutycode like '%1001'
  and a.contno = '2025072000000106'
  and b.dt = 4;

--累积交清基本保险金额减保后保额
select round((1 - 10000 / 18188.46) * 19162.15, 2)
from dual;

--减保前现价
select round(1134.88 / 1000 * 1062.2 * (date'2030-01-10' - date'2029-09-18') / 365 +
             1134.88 / 1000 * 1026.39 * (1 - (date'2030-01-10' - date'2029-09-18') / 365), 2) cash
from dual;

--累积交清基本保险金额应退金额
select round(a.amnt / 1000 * cv2 * (date'2027-11-19' - date'2027-05-19') / 365 +
             a.amnt / 1000 * cv1 * (1 - (date'2027-11-19' - date'2027-05-19') / 365), 2) cash
from lcduty a,
     pua_1116005 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.insuredappage
  and b.gender = c.insuredsex
  and a.dutycode like '%1001'
  and a.contno = '2026051800002596'
  and b.dt = 2;

--红利宣告交清基本保险金额应退金额
select round(13718.78 / 1000 * cv2 * (date'2028-10-10' - date'2028-09-29') / 365 +
             13718.78 / 1000 * cv1 * (1 - (date'2028-10-10' - date'2028-09-29') / 365), 2) cash
from lcduty a,
     pua_1111002 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.insuredappage
  and b.gender = c.insuredsex
  and a.dutycode like '%1001'
  and a.contno = '2025072000000106'
  and b.dt = 4;

select 18188.46 + 13021.68
from dual;

--基本保额应退金额
select round(prem / 1000 * endcv * (date'2028-10-10' - date'2028-09-29') / 365 +
             prem / 1000 * begcv *
             (1 - (date'2028-10-10' - date'2028-09-29') / 365), 2) cash
from cv_1111002 a,
     lcpol b
where pt = payendyear
  and age = insuredappage
  and gender = insuredsex
  and contno = '2025072000000106'
  and dt = 4;

--红利利息
select round(33407.97 * round(0.03 / 365, 8) * (date'2030-10-10' - date'2030-09-29'), 2)
from dual;