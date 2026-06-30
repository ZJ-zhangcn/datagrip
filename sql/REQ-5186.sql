-- id: req-5186
-- 标题: 上海人寿沪申宝富民版年金保险（分红型）——核心系统需求

--保全支持红利自动转账配置
select *
from ldcode
where codetype = 'HLAutopayRisk'
  and code = '1136003';

--保单打印现价
select dt, case when dt < 5 then prem / 1000 * endcv else prem / 1000 * endcv - a.amnt end cashvalue
from lcpol a,
     cv_1136003 b
where a.insuyear = b.bp
  and a.payendyear = b.pt
  and a.insuredappage = b.age
  and a.insuredsex = b.gender
  and a.contno = '2025110700000686'
order by dt;

--犹豫期天数
select hesitateend
from lmedorwt a
where riskcode = '1136003';

--还款利息
select round(2925.72 * round(0.03 / 365, 8) * (date'2026-02-10' - date'2026-01-11'), 2) lx
from dual;

--复效利息
select round(5000 * round(0.03 / 365, 8) * (date'2028-10-10' - date'2027-11-11'), 2) lx
from dual;

--非购买交清保额红利计算
select a.*
from bonusrate a
where riskcode = '1136003';

select a.*
from lobonusfactor a
where riskcode = '1136003';

select round(a.prem / 1000 * b.bonusfactor * nvl(c.bonusrate, '0'), 2) hl
from lcpol a,
     lobonusfactor b,
     bonusrate c
where a.riskcode = b.riskcode
  and a.riskcode = c.riskcode
  and b.insuredsex = a.insuredsex
  and b.insuyear = a.insuyear
  and b.insuyearflag = a.insuyearflag
  and b.payendyear = a.payendyear
  and b.payendyearflag = a.payendyearflag
  and b.insuredappage = a.insuredappage
  and to_date('2027-11-11', 'yyyy-mm-dd') between b.startdate and b.enddate
  and to_date('2027-11-11', 'yyyy-mm-dd') between c.cvalidate and c.enddate
  and b.bonusgrade = 'H'
  and b.annuitygetage = '0'
  and b.polyear = '2'
  and a.contno = '2025111000000456'
order by b.polyear;

select getmoney, a.*
from ljabonusget a
where contno = '2025111000001186'
order by bonusyear, getdate, makedate, maketime;

--红利利息
--累积生息批处理
select round(74.22 * round(0.03 / 365, 8) * (date'2027-11-11' - date'2026-11-11'), 2) hllx
from dual;

--db-红利给付
select round(sum(getmoney) * round(0.03 / 365, 8) * (date'2031-11-20' - date'2031-11-11'), 2) hllx
from ljabonusget a
where contno = '2025111000001186';

--生存金
select a.amnt, b.getmoney, b.*
from lcpol a,
     ljagetdraw b
where a.contno = b.contno
  and a.contno = '2025111000001186';

--lg-生存给付利息
select sum(case when moneytype = 'YFLX' then money else 0 end) +
       round(
               sum(case when moneytype in ('YF', 'YFLX') then money else 0 end) *
               round(0.06 / 365, 8) *
               (date'2031-11-20' - date'2031-11-11'),
               2
       ) as yflx
from lcinsureacctrace
where contno = '2025111000001186'
  and moneytype in ('YF', 'YFLX');

--退保
--t≤ppp，年领未欠缴保费
select round(a.prem / 1000 * b.endcv *
             power(1 + 0.0375,
                   (((date '2026-02-10' - date '2025-11-11') - 365) / 365)), 2) cash
from lcpol a,
     cv_1136003 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025111000000456'
  and b.dt = 1;

--t≤ppp，年领欠缴保费
select round(a.prem / 1000 * b.endcv - 593.00, 2) cash
from lcpol a,
     cv_1136003 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025111000001186'
  and b.dt = 5;

--t>ppp，年领欠缴保费
select round(a.prem / 1000 * b.endcv - 593.00, 2) cash
from lcpol a,
     cv_1136003 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025111000001186'
  and b.dt = 5;

--t>ppp，年领未欠缴保费
select round((a.prem / 1000 * b.endcv * (date '2026-11-28' - date '2026-11-28') / 365) +
             (a.prem / 1000 * b.begcv *
              (365 - (date '2026-11-28' - date '2026-11-28')) / 365), 2) cash
from lcpol a,
     cv_1136003 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025112700000266'
  and b.dt = 2;


-------------------------------------------------------------------------------------------------------------
--购买交清保额
--本年度购买交清保额=实际给付红利*1000/趸交净保费率
select round(a.prem / 1000 * b.bonusfactor * nvl(c.bonusrate, '0'), 2) 当年度基本保额红利,
       decode(d.dt, 1, 0, round(e.amnt / 1000 * nvl(b.jqbonusfactor, 0) * nvl(c.bonusrate, '0'),
                                2))                                    已产生的减额交清红利,
       round(a.prem / 1000 * b.bonusfactor * nvl(c.bonusrate, '0'), 2) +
       decode(d.dt, 1, 0, round(e.amnt / 1000 * nvl(b.jqbonusfactor, 0) * nvl(c.bonusrate, '0'),
                                2))                                    当年度总和,
       round((round(a.prem / 1000 * b.bonusfactor * nvl(c.bonusrate, '0'), 2) +
              decode(d.dt, 1, 0, round(e.amnt / 1000 * nvl(b.jqbonusfactor, 0) * nvl(c.bonusrate, '0'),
                                       2))) * 1000 / puacost, 2)       当年度减额交清红利
from lcpol a,
     lobonusfactor b,
     bonusrate c,
     pua_1136003 d,
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
  and to_date('2026-11-28', 'yyyy-mm-dd') between b.startdate and b.enddate
  and to_date('2026-11-28', 'yyyy-mm-dd') between c.cvalidate and c.enddate
  and b.bonusgrade = 'H'
  and b.annuitygetage = '0'
--   and e.dutycode like '%1001'/*dt='1'时注释掉*/
  and d.dt = '1'
  and a.contno = '2025112700000266'
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
  and a.contno = '2025111200000296'
order by to_number(polyear);

select a.*
from lobonusfactor a
where riskcode = '1136003';

select a.*
from bonusrate a
where riskcode = '1136003'
order by cvalidate;

select b.*
from lcpol a,
     pua_1136003 b
where a.insuredappage = b.age
  and a.insuredsex = b.gender
  and a.contno = '2025111200000296'
order by dt;

select getmoney, jqamnt, a.*
from ljabonusget a
where contno = '2025112700000266'
order by makedate, maketime;

select a.*
from lisdata.lpedoritem a
where contno = '2025103100001116'

--退保
--累积交清基本保险金额应退金额
select round(a.amnt / 1000 * cv2 * (date'2026-11-28' - date'2026-11-28') / 365 +
             a.amnt / 1000 * cv1 * (1 - (date'2026-11-28' - date'2026-11-28') / 365), 2) cash
from lcduty a,
     pua_1136003 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.insuredappage
  and b.gender = c.insuredsex
  and a.dutycode like '%1001'
  and a.contno = '2025112700000266'
  and b.dt = 2;

--红利宣告交清基本保险金额应退金额
select round(492.47 / 1000 * cv2 * (date'2030-12-10' - date'2030-11-13') / 365 +
             492.47 / 1000 * cv1 * (1 - (date'2030-12-10' - date'2030-11-13') / 365), 2) cash
from lcduty a,
     pua_1136003 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.insuredappage
  and b.gender = c.insuredsex
  and a.dutycode like '%1001'
  and a.contno = '2025111200000296'
  and b.dt = 6;

select 3321.14 + 1686.04
from dual;

--基本保额应退金额
select round(prem / 1000 * endcv * (date'2028-11-30' - date'2028-10-30') / 365 +
             prem / 1000 * begcv *
             (1 - (date'2028-11-30' - date'2028-10-30') / 365), 2) cash
from cv_1136003 a,
     lcpol b
where pt = payendyear
  and age = insuredappage
  and gender = insuredsex
  and contno = '2025111200000296'
  and dt = 4;

--红利利息
select round(33407.97 * round(0.03 / 365, 8) * (date'2030-10-10' - date'2030-09-29'), 2)
from dual;
