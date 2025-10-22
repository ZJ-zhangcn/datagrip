--本年度购买交清保额=实际给付红利*1000/趸交净保费率
select round(a.amnt / 1000 * b.BonusFactor * nvl(c.bonusrate, '0'), 2) 当年度基本保额红利,
       decode(d.dt, 1, 0, round(e.amnt / 1000 * nvl(b.jqbonusfactor, 0) * nvl(c.bonusrate, '0'),
                                2))                                    已产生的减额交清红利,
       round(a.amnt / 1000 * b.BonusFactor * nvl(c.bonusrate, '0'), 2) +
       decode(d.dt, 1, 0, round(e.amnt / 1000 * nvl(b.jqbonusfactor, 0) * nvl(c.bonusrate, '0'),
                                2))                                    当年度总和,
       round((round(a.amnt / 1000 * b.BonusFactor * nvl(c.bonusrate, '0'), 2) +
              decode(d.dt, 1, 0, round(e.amnt / 1000 * nvl(b.jqbonusfactor, 0) * nvl(c.bonusrate, '0'),
                                       2))) * 1000 / PUACOST, 2)       当年度减额交清红利
from lcpol a,
     lobonusfactor b,
     BonusRate c,
     PUA_1113002 d,
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
  and to_date('2027-10-17', 'yyyy-mm-dd') between b.startdate and b.enddate
  and to_date('2027-10-17', 'yyyy-mm-dd') between c.cvalidate and c.enddate
  and b.bonusgrade = 'H'
  and b.annuitygetage = '0'
  and e.DUTYCODE like '%1001'/*dt='1'时注释掉*/
  and d.dt = '3'
  and a.contno = '2025101600002906'
order by d.dt;

select a.*
from lobonusfactor a
where riskcode = '1113002'
  and INSUREDSEX = 1
  and PAYENDYEAR = 1000
  and INSUREDAPPAGE = 50
  and BONUSGRADE = 'H'
order by to_number(POLYEAR);

select a.*
from BonusRate a
where riskcode = '1113002'
order by CVALIDATE;

INSERT INTO LISDATA.BONUSRATE (RISKCODE, CVALIDATE, ENDDATE, BONUSGRADE, BONUSRATE)
VALUES ('1113002', DATE '2029-01-01', DATE '2030-01-01', 'H', '1');


select a.*
from PUA_1113002 a
where age = 50
  and gender = 1
order by dt;

select GETMONEY, JQAMNT, a.*
from LJABonusGet a
where contno = '2025101600002906'
order by makedate, maketime;

select nvl(sum(JQAmnt), 0)
from LJABonusGet
where otherno = '2025101600002906'
  and othernotype = '12'
  and FeeFinaType = 'HLAMNT'
  and BonusYear = '2026';

select a.*
from lcduty a
where contno = '2025101600002906';

select STATEFLAG, a.*
from LOPRTMANAGER a
where otherno = '2025101600002906';

select round(606.96 * round(0.03 / 365, 8) * (date'2029-09-18' - date'2028-09-18'), 2)
from dual;

--累积交清基本保险金额减保限额
select round(a.AMNT / 1000 * cv2 * (date'2029-12-10' - date'2029-10-17') / 365 +
             a.AMNT / 1000 * cv1 * (1 - (date'2029-12-10' - date'2029-10-17') / 365), 2) cash
from lcduty a,
     PUA_1113002 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.INSUREDAPPAGE
  and b.GENDER = c.INSUREDSEX
  and a.DUTYCODE like '%1001'
  and a.contno = '2025101600002906'
  and b.dt = 5;

--累积交清基本保险金额减保后保额
select round((1 - 1000 / 1782.84) * 1701.02, 2)
from dual;

--累积交清基本保险金额应退金额
select round(a.AMNT / 1000 * cv2 * (date'2028-10-10' - date'2028-09-29') / 365 +
             a.AMNT / 1000 * cv1 * (1 - (date'2028-10-10' - date'2028-09-29') / 365), 2) cash
from lcduty a,
     PUA_1113002 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.INSUREDAPPAGE
  and b.GENDER = c.INSUREDSEX
  and a.DUTYCODE like '%1001'
  and a.contno = '2025101600002906'
  and b.dt = 4;

--红利宣告交清基本保险金额应退金额
select round(1127.57 / 1000 * cv2 * (date'2028-12-10' - date'2028-10-17') / 365 +
             1127.57 / 1000 * cv1 * (1 - (date'2028-12-10' - date'2028-10-17') / 365), 2) +
       round(573.45 / 1000 * cv2 * (date'2028-12-10' - date'2028-10-17') / 365 +
             573.45 / 1000 * cv1 * (1 - (date'2028-12-10' - date'2028-10-17') / 365), 2) cash
from lcduty a,
     PUA_1113002 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.INSUREDAPPAGE
  and b.GENDER = c.INSUREDSEX
  and a.DUTYCODE like '%1001'
  and a.contno = '2025101600002906'
  and b.dt = 4;

select 18188.46 + 13021.68
from dual;

--基本保额应退金额
select round(prem / 1000 * endcv * (date'2028-12-10' - date'2028-10-17') / 365 +
             prem / 1000 * begcv *
             (1 - (date'2028-12-10' - date'2028-10-17') / 365), 2) cash
from cv_1113002 a,
     lcpol b
where pt = payendyear
  and age = insuredappage
  and gender = insuredsex
  and contno = '2025101600002906'
  and dt = 4;

--红利利息
select round(615.76 * round(0.03 / 365, 8) * (date'2029-12-10' - date'2029-10-17'), 2) LX
from dual;