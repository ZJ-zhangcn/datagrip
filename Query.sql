select MOBILE
from lcaddress a
where CUSTOMERNO = (select INSUREDNO from lcinsured where contno = '5000118251009863');

/*
update lccont
set getpoldate=signdate,
    customgetpoldate=signdate
where prtno in ('5000118251009832', '5000118251009849', '5000118351203848', '5000118351203855', '5000118351203862',
                '5000118251009856', '5000118251009863', '5000118351203879', '5000118351203886', '5000118351203893');
*/

select contno
from lcpol a
where prtno = '5000118351203893';

select a.*
from lcpol a
where contno in ('2026040700000476', '2026040700000566', '2026040700000106', '2026040700000656', '2026040700001076',
                 '2026040700000296', '2026040700000786', '2026040700000386', '2026040700000886', '2026040700000926');

select round((7525.19) / 1000 * cv2 * (date'2028-04-07' - date'2027-04-08') / 366 +
             (7525.19) / 1000 * cv1 * (1 - (date'2028-04-07' - date'2027-04-08') / 366), 2) cash
from lcduty a,
     PUA_1111001 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.INSUREDAPPAGE
  and b.GENDER = c.INSUREDSEX
  and a.DUTYCODE like '%1001'
  and a.contno = '2026040700000106'
  and b.dt = 2;

select PAYINTV, a.*
from lcpol a
where contno = '2026040700000476';

select 3086.16 * power((1 + 0.0175), 3 - 1)
from dual;

select GETMONEY, JQAMNT, a.*
from LJABonusGet a
where contno in ('2026040700000476', '2026040700000566')
order by contno, makedate, maketime;

select a.*
from BonusRate a
where riskcode = '1113004'
order by CVALIDATE;

--本年度购买交清保额=实际给付红利*1000/趸交净保费率
select round(a.amnt / 1000 * b.BonusFactor * nvl(c.bonusrate, '0'), 2)                                        当年度基本保额红利,
       round(e.amnt / 1000 * nvl(b.jqbonusfactor, 0) * nvl(c.bonusrate, '0'),
             2)                                                                                               已产生的减额交清红利,
       round(a.amnt / 1000 * b.BonusFactor * nvl(c.bonusrate, '0'), 2) +
       round(e.amnt / 1000 * nvl(b.jqbonusfactor, 0) * nvl(c.bonusrate, '0'),
             2)                                                                                               当年度总和,
       round((round(a.amnt / 1000 * b.BonusFactor * nvl(c.bonusrate, '0'), 2) +
              round(e.amnt / 1000 * nvl(b.jqbonusfactor, 0) * nvl(c.bonusrate, '0'), 2)) * 1000 / PUACOST, 2) 当年度减额交清红利
from lcpol a,
     lobonusfactor b,
     BonusRate c,
     PUA_1111001 d,
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
  and to_date('2027-04-08', 'yyyy-mm-dd') between b.startdate and b.enddate
  and to_date('2027-04-08', 'yyyy-mm-dd') between c.cvalidate and c.enddate
  and b.bonusgrade = 'H'
  and b.annuitygetage = '0'
  and e.DUTYCODE like '%1001'
  and d.dt = '3'
  and a.contno = '2026040700000106'
order by d.dt;

--
select GETMONEY, JQAMNT, a.*
from LJABonusGet a
where contno = '2026040700000786'
order by makedate, maketime;

--1111001-上海人寿鑫自在终身寿险（分红型）身故保险金
select round(a.AMNT / 1000 * cv2 * (date'2037-03-10' - date'2036-04-08') / 365 +
             a.AMNT / 1000 * cv1 * (1 - (date'2037-03-10' - date'2036-04-08') / 365), 2) cash,
       round(a.AMNT * power((1 + 0.02), b.dt - 1), 2)
from lcduty a,
     PUA_1111001 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.INSUREDAPPAGE
  and b.GENDER = c.INSUREDSEX
  and a.DUTYCODE like '%1001'
  and a.contno = '2026040700000106'
  and b.dt = 11;

--1111002-上海人寿鑫自由乐享版终身寿险（分红型）身故保险金
select round(19131.36 / 1000 * cv2 * (date'2028-12-08' - date'2028-04-08') / 365 +
             19131.36 / 1000 * cv1 * (1 - (date'2028-12-08' - date'2028-04-08') / 365), 2) cash,
       round(19131.36 * power((1 + 0.0175), b.dt - 1), 2)
from lcduty a,
     PUA_1111002 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.INSUREDAPPAGE
  and b.GENDER = c.INSUREDSEX
  and a.DUTYCODE like '%1001'
  and a.contno = '2026040700000656'
  and b.dt = 12
order by b.dt;

--1113002-上海人寿臻鑫传家终身寿险（分红型）身故保险金
select round(2477.72 / 1000 * cv2 * (date'2028-12-08' - date'2028-04-08') / 365 +
             2477.72 / 1000 * cv1 * (1 - (date'2028-12-08' - date'2028-04-08') / 365), 2) cash,
       round(2477.72 * power((1 + 0.0175), b.dt - 1), 2)
from lcduty a,
     PUA_1113002 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.INSUREDAPPAGE
  and b.GENDER = c.INSUREDSEX
  and a.DUTYCODE like '%1001'
  and a.contno = '2026040700000296'
  and b.dt = 12
order by b.dt;

--1113002-上海人寿臻鑫传家终身寿险（分红型）身故保险金
select round(1249.54 / 1000 * cv2 * (date'2028-04-07' - date'2027-04-08') / 366 +
             1249.54 / 1000 * cv1 * (1 - (date'2028-04-07' - date'2027-04-08') / 366), 2) cash,
       round(1249.54 * power((1 + 0.0175), b.dt - 1), 2)
from lcduty a,
     PUA_1113003 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.INSUREDAPPAGE
  and b.GENDER = c.INSUREDSEX
  and a.DUTYCODE like '%1001'
  and a.contno = '2026040700000786'
  and b.dt = 2
order by b.dt;