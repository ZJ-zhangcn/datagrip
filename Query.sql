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

select round(1530.68 / 1000 * cv2 * (date'2028-04-07' - date'2027-04-08') / 366 +
             1530.68 / 1000 * cv1 * (1 - (date'2028-04-07' - date'2027-04-08') / 366), 2) cash
from lcduty a,
     PUA_1113004 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.INSUREDAPPAGE
  and b.GENDER = c.INSUREDSEX
  and a.DUTYCODE like '%1001'
  and a.contno = '2026040700000476'
  and b.dt = 2;

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
     PUA_1113004 d,
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
  and d.dt = '2'
  and a.contno = '2026040700000476'
order by d.dt;