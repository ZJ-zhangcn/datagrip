select round(a.amnt / 1000 * b.BonusFactor * nvl(c.bonusrate, '0'), 2)                            当年度基本保额红利,
       round(a.amnt / 1000 * b.BonusFactor * nvl(c.bonusrate, '0'), 2)                            当年度总和,
       round(round(a.amnt / 1000 * b.BonusFactor * nvl(c.bonusrate, '0'), 2) * 1000 / PUACOST, 2) 当年度减额交清红利
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
  and to_date('2032-07-21', 'yyyy-mm-dd') between b.startdate and b.enddate
  and to_date('2032-07-21', 'yyyy-mm-dd') between c.cvalidate and c.enddate
  and b.bonusgrade = 'H'
  and b.annuitygetage = '0'
  and d.dt = '7'
  and a.contno = '2025072000000106'
order by d.dt;


select b.*
from lcpol a,
     lobonusfactor b
where a.riskcode = b.RISKCODE
  and b.INSUREDSEX = a.INSUREDSEX
  and b.InsuYear = a.INSUYEAR
  and b.INSUYEARFLAG = a.INSUYEARFLAG
  and b.PAYENDYEAR = a.PAYENDYEAR
  and b.PAYENDYEARFLAG = a.PAYENDYEARFLAG
  and b.INSUREDAPPAGE = a.INSUREDAPPAGE
  and a.contno = '2025072000000106';


select a.* from PUA_1111002 a where age='69' and GENDER='0' and dt='';

update PUA_1111002 set GENDER='1' where GENDER='F';

select distinct GENDER from PUA_1111002;