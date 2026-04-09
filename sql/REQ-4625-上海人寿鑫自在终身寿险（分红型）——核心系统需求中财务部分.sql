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
  and to_date('2030-01-22', 'yyyy-mm-dd') between b.startdate and b.enddate
  and to_date('2030-01-22', 'yyyy-mm-dd') between c.cvalidate and c.enddate
  and b.bonusgrade = 'H'
  and b.annuitygetage = '0'
  and e.DUTYCODE like '%1001'/*dt='1'时注释掉*/
  and d.dt = '4'
  and a.contno = '2026012100000786'
order by d.dt;

select GETMONEY, JQAMNT, a.*
from LJABonusGet a
where contno = '2026012100000786'
order by makedate, maketime;

select a.*
from LJABonusGet a
where contno = '2026012100000786'
order by makedate, maketime;

select a.*
from BonusRate a
where riskcode = '1113002'
order by CVALIDATE;

select a.*
from ljatax a
where contno = '2026012100000786'
order by BUINESSDATE;

select round(1131.60 / (1 + 0.06) * 0.06, 2) 税额, 1131.60 - round(1131.60 / (1 + 0.06) * 0.06, 2) 价额
from dual;
