-- id: req-5164
-- 标题: 上海人寿沪申福永康版终身寿险（分红型）产品二期-保全

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
     pua_1116002 d,
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
  and to_date('2027-12-20', 'yyyy-mm-dd') between b.startdate and b.enddate
  and to_date('2027-12-20', 'yyyy-mm-dd') between c.cvalidate and c.enddate
  and b.bonusgrade = 'H'
  and b.annuitygetage = '0'
  and e.dutycode like '%1001'/*dt='1'时注释掉*/
  and d.dt = '3'
  and a.contno = '2026010700000256'
order by d.dt;

select b.*
from lcpol a,
     lobonusfactor b
where a.riskcode = b.riskcode
  and b.insuredsex = a.insuredsex
  and b.insuyear = a.insuyear
  and b.insuyearflag = a.insuyearflag
  and b.payendyear = a.payendyear
  and b.payendyearflag = a.payendyearflag
  and b.insuredappage = a.insuredappage
  and b.bonusgrade = 'H'
  and a.contno = '2025121900000156'
order by to_number(polyear);

select a.*
from lobonusfactor a
where riskcode = '1116002';

select a.*
from bonusrate a
where riskcode = '1116002'
order by cvalidate;

select b.*
from lcpol a,
     pua_1116002 b
where a.insuredappage = b.age
  and a.insuredsex = b.gender
  and a.contno = '2025121900000156'
order by dt;

select getmoney, jqamnt, a.*
from ljabonusget a
where contno = '2026010700000256'
order by makedate, maketime;

select a.*
from lisdata.lpedoritem a
where contno = '2025103100001116';

--退保
--累积交清基本保险金额应退金额
select round(a.amnt / 1000 * cv2 * (date'2028-12-30' - date'2028-12-20') / 365 +
             a.amnt / 1000 * cv1 * (1 - (date'2028-12-30' - date'2028-12-20') / 365), 2) cash
from lcduty a,
     pua_1116002 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.insuredappage
  and b.gender = c.insuredsex
  and a.dutycode like '%1001'
  and a.contno = '2025121900000156'
  and b.dt = 4;

--红利宣告交清基本保险金额应退金额
select round(2678.16 / 1000 * cv2 * (date'2028-12-30' - date'2028-12-20') / 365 +
             2678.16 / 1000 * cv1 * (1 - (date'2028-12-30' - date'2028-12-20') / 365), 2) cash
from lcduty a,
     pua_1116002 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.insuredappage
  and b.gender = c.insuredsex
  and a.dutycode like '%1001'
  and a.contno = '2025121900000156'
  and b.dt = 4;

select 4085.83 + 2540.86
from dual;

--基本保额应退金额
select round(prem / 1000 * endcv * (date'2028-12-30' - date'2028-12-20') / 365 +
             prem / 1000 * begcv *
             (1 - (date'2028-12-30' - date'2028-12-20') / 365), 2) cash
from cv_1116002 a,
     lcpol b
where pt = payendyear
  and age = insuredappage
  and gender = insuredsex
  and contno = '2025121900000156'
  and dt = 4;

--红利利息
select round(33407.97 * round(0.03 / 365, 8) * (date'2030-10-10' - date'2030-09-29'), 2)
from dual;

--减保
--累积交清基本保险金额减保限额
select round(a.amnt / 1000 * cv2 * (date'2028-12-30' - date'2028-12-20') / 365 +
             a.amnt / 1000 * cv1 * (1 - (date'2028-12-30' - date'2028-12-20') / 365), 2) cash
from lcduty a,
     pua_1116002 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.insuredappage
  and b.gender = c.insuredsex
  and a.dutycode like '%1001'
  and a.contno = '2025121900000156'
  and b.dt = 4;

--累积交清基本保险金额减保后保额  select (1-第t次减保的金额/第t次减保前的现金价值)*第t次减保前的保额 from dual;
select round((1 - 1000 / 5085.83) * 5360.66, 2)
from dual;