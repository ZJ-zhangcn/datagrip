-- id: req-5177
-- 标题: 臻享传家（分红型）——核心系统需求

--犹豫期天数
select hesitateend, a.*
from lmedorwt a
where riskcode = '1113004';

--还款利息
select round(71100.38 * round(0.03 / 365, 8) * (date'2026-01-10' - date'2025-12-11'), 2) lx
from dual;

--复效利息
select round(100000 * round(0.03 / 365, 8) * (date'2028-12-10' - date'2027-10-28'), 2) lx
from dual;

--红利
select a.*
from bonusrate a
where riskcode = '1113004';

select round(a.amnt / 1000 * b.bonusfactor * nvl(c.bonusrate, '0'), 2) hl
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
  and to_date('2026-10-27', 'yyyy-mm-dd') between b.startdate and b.enddate
  and to_date('2026-10-27', 'yyyy-mm-dd') between c.cvalidate and c.enddate
  and b.bonusgrade = 'H'
  and b.annuitygetage = '0'
  and b.polyear = '1'
  and contno = '2025102600000276'
order by b.polyear;

--红利利息
select round(1603.04 * round(0.03 / 365, 8) * (date'2026-12-10' - date'2026-10-27'), 2) hllx
from dual;
--退保
--t≤ppp，年领未欠缴保费
select round(a.prem / 1000 * b.endcv *
             power(1 + 0.0375,
                   (((date '2026-01-10' - date '2025-10-27') - 365) / 365)), 2) cash
from lcpol a,
     cv_1113004 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025102600000276'
  and b.dt = 1;

--t≤ppp，年领欠缴保费
select round(a.prem / 1000 * b.endcv, 2) cash
from lcpol a,
     cv_1113004 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025102700000196'
  and b.dt = 1;

--t>ppp，年领欠缴保费
select round(a.prem / 1000 * b.endcv, 2) cash
from lcpol a,
     cv_1113004 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025102700000196'
  and b.dt = 2;

--t>ppp，年领未欠缴保费
select round((a.prem / 1000 * b.endcv * (date '2035-01-10' - date '2034-10-30') / 365) +
             (a.prem / 1000 * b.begcv *
              (365 - (date '2035-01-10' - date '2034-10-30')) / 365), 2) cash
from lcpol a,
     cv_1113004 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025102900001486'
  and b.dt = 10;


-------------------------------------------------------------------------------------------------------------
--减额交清
select amnt
from lcpol a
where contno = '2025102700000286';

--t≤ppp，年领欠缴保费
select round(a.prem / 1000 * b.endcv, 2) cash
from lcpol a,
     cv_1113004 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025102700000286'
  and b.dt = 1;

--t≤ppp，年领未欠缴保费
select round(a.prem / 1000 * b.endcv *
             power(1 + 0.0375,
                   (((date '2026-12-10' - date '2026-10-28') - 365) / 365)), 2) cash
from lcpol a,
     cv_1113004 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025102700000286'
  and b.dt = 2;

--u=0&未交纳年初应交保费&未发放年初生存保险金
select round(prem / 1000 * rpu, 2) 减额交清后保额
from lcpol a,
     cv_1113004 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025102700000286'
  and b.dt = 1;

--other
select round(30762.62 / (end_afactor * (date'2026-12-10' - date'2026-10-28') / 365 +
                         beg_afactor * (1 - (date'2026-12-10' - date'2026-10-28') / 365)) * 1000, 2) 减额交清后保额
from lcpol a,
     cv_1113004 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025102700000286'
  and b.dt = 2;

--减额交清后的退保现金价值
select round(30367.66 / 1000 * (cv_rpuafactorend * (date'2026-12-10' - date'2026-10-28') / 365 +
                                cv_rpuafactorbeg * (1 - (date'2026-12-10' - date'2026-10-28') / 365)), 2) 减额交清后的退保现金价值
from lcpol a,
     cv_1113004 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025102700000286'
  and b.dt = 2;

--减额交清后保费
select round(30367.66 * 1000 / rate, 2) 减额交清后保费
from lcpol a,
     rt_1113004 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025102700000286';


-------------------------------------------------------------------------------------------------------------
--购买交清保额
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
     pua_1113004 d,
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
  and to_date('2027-10-30', 'yyyy-mm-dd') between b.startdate and b.enddate
  and to_date('2027-10-30', 'yyyy-mm-dd') between c.cvalidate and c.enddate
  and b.bonusgrade = 'H'
  and b.annuitygetage = '0'
  and e.dutycode like '%1001'/*dt='1'时注释掉*/
  and d.dt = '3'
  and a.contno = '2025102900001486'
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
  and a.contno = '2025102900001486'
order by to_number(polyear);

select a.*
from bonusrate a
where riskcode = '1113004'
order by cvalidate;

/*
insert into lisdata.bonusrate (riskcode, cvalidate, enddate, bonusgrade, bonusrate) values ('1113004', date '2025-07-01', date '2038-06-30', 'H', '1.2');
*/


select b.*
from lcpol a,
     pua_1113004 b
where a.insuredappage = b.age
  and a.insuredsex = b.gender
  and a.contno = '2025102900001486'
order by dt;

select getmoney, jqamnt, a.*
from ljabonusget a
where contno = '2025103100001116'
order by makedate, maketime;

select a.* from lisdata.lpedoritem a where contno='2025103100001116'

select nvl(sum(jqamnt), 0)
from ljabonusget
where otherno = '2025102900001486'
  and othernotype = '12'
  and feefinatype = 'HLAMNT'
  and bonusyear = '2026';

select a.*
from lcduty a
where contno = '2025103100001116';

select stateflag, a.*
from loprtmanager a
where otherno = '2025102900001486';

select round(606.96 * round(0.03 / 365, 8) * (date'2029-09-18' - date'2028-09-18'), 2)
from dual;

--累积交清基本保险金额减保限额
select round(a.amnt / 1000 * cv2 * (date'2028-11-30' - date'2028-10-30') / 365 +
             a.amnt / 1000 * cv1 * (1 - (date'2028-11-30' - date'2028-10-30') / 365), 2) cash
from lcduty a,
     pua_1113004 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.insuredappage
  and b.gender = c.insuredsex
  and a.dutycode like '%1001'
  and a.contno = '2025102900001486'
  and b.dt = 4;

--累积交清基本保险金额减保后保额  select (1-第t次减保的金额/第t次减保前的现金价值)*第t次减保前的保额 from dual;
select round((1 - 1000 / 3228.66) * 3086.31, 2)
from dual;

--减保前现价
select round(1134.88 / 1000 * 1062.2 * (date'2030-01-10' - date'2029-09-18') / 365 +
             1134.88 / 1000 * 1026.39 * (1 - (date'2030-01-10' - date'2029-09-18') / 365), 2) cash
from dual;

--累积交清基本保险金额应退金额
select round(a.amnt / 1000 * cv2 * (date'2028-11-30' - date'2028-10-30') / 365 +
             a.amnt / 1000 * cv1 * (1 - (date'2028-11-30' - date'2028-10-30') / 365), 2) cash
from lcduty a,
     pua_1113004 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.insuredappage
  and b.gender = c.insuredsex
  and a.dutycode like '%1001'
  and a.contno = '2025102900001486'
  and b.dt = 4;

--红利宣告交清基本保险金额应退金额
select round(1579.76 / 1000 * cv2 * (date'2028-11-30' - date'2028-10-30') / 365 +
             1579.76 / 1000 * cv1 * (1 - (date'2028-11-30' - date'2028-10-30') / 365), 2) cash
from lcduty a,
     pua_1113004 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.insuredappage
  and b.gender = c.insuredsex
  and a.dutycode like '%1001'
  and a.contno = '2025102900001486'
  and b.dt = 4;

select 3228.66 + 1652.62
from dual;

--基本保额应退金额
select round(prem / 1000 * endcv * (date'2028-11-30' - date'2028-10-30') / 365 +
             prem / 1000 * begcv *
             (1 - (date'2028-11-30' - date'2028-10-30') / 365), 2) cash
from cv_1113004 a,
     lcpol b
where pt = payendyear
  and age = insuredappage
  and gender = insuredsex
  and contno = '2025102900001486'
  and dt = 4;

--红利利息
select round(33407.97 * round(0.03 / 365, 8) * (date'2030-10-10' - date'2030-09-29'), 2)
from dual;


--基本保险金额减保限额
select least(round(a.amnt * 0.2 / a.amnt *
                   round((a.prem / 1000 * b.endcv * (date '2030-12-30' - date '2030-10-30') / 365) +
                         (a.prem / 1000 * b.begcv *
                          (365 - (date '2030-12-30' - date '2030-10-30')) / 365), 2) - 0, 2),
             round((a.prem / 1000 * b.endcv * (date '2030-12-30' - date '2030-10-30') / 365) +
                   (a.prem / 1000 * b.begcv *
                    (365 - (date '2030-12-30' - date '2030-10-30')) / 365), 2)) 限额
from lcpol a,
     cv_1113004 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025102900001486'
  and b.dt = 6;

--基本保险金额减保后保额  select (1-第t次减保的金额/第t次减保前的现金价值)*第t次减保前的保额 from dual;
select round((1 - 1000 / 102831.14) * 94461, 2)
from dual;

--减保后保费
select round(((1 - 1000 / 102831.14) * 94461) * 1000 / rate, 2) 减保后保费
from lcpol a,
     rt_1113004 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025102900001486';