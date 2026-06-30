-- id: req-4625
-- 标题: 上海人寿鑫自在终身寿险（分红型）——核心系统需求中财务部分

--本年度购买交清保额=实际给付红利*1000/趸交净保费率
select round(a.amnt / 1000 * b.bonusfactor * nvl(c.bonusrate, '0'), 2) 当年度基本保额红利,
       decode(d.dt, 1, 0, round(e.amnt / 1000 * nvl(b.jqbonusfactor, 0) * nvl(c.bonusrate, '0'),
                                2))                                    已产生的减额交清红利,
       round(a.amnt / 1000 * b.bonusfactor * nvl(c.bonusrate, '0'), 2) +
       decode(d.dt, 1, 0, round(e.amnt / 1000 * nvl(b.jqbonusfactor, 0) * nvl(c.bonusrate, '0'),
                                2))                                    当年度总和,
       round((round(a.amnt / 1000 * b.bonusfactor * nvl(c.bonusrate, '0'), 2) +
              decode(d.dt, 1, 0, round(e.amnt / 1000 * nvl(b.jqbonusfactor, 0) * nvl(c.bonusrate, '0'),
                                       2))) * 1000 / puacost, 2)       当年度减额交清红利
from lcpol a,
     lobonusfactor b,
     bonusrate c,
     pua_1113002 d,
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
  and to_date('2030-01-22', 'yyyy-mm-dd') between b.startdate and b.enddate
  and to_date('2030-01-22', 'yyyy-mm-dd') between c.cvalidate and c.enddate
  and b.bonusgrade = 'H'
  and b.annuitygetage = '0'
  and e.dutycode like '%1001'/*dt='1'时注释掉*/
  and d.dt = '4'
  and a.contno = '2026012100000786'
order by d.dt;

select getmoney, jqamnt, a.*
from ljabonusget a
where contno = '2026012100000786'
order by makedate, maketime;

select a.*
from ljabonusget a
where contno = '2026012100000786'
order by makedate, maketime;

select a.*
from bonusrate a
where riskcode = '1113002'
order by cvalidate;

select a.*
from ljatax a
where contno = '2026012100000786'
order by buinessdate;

select round(1131.60 / (1 + 0.06) * 0.06, 2) 税额, 1131.60 - round(1131.60 / (1 + 0.06) * 0.06, 2) 价额
from dual;
