--保全支持红利自动转账配置
SELECT *
from ldcode
where codetype = 'HLAutopayRisk'
  and code = '1136003';

--保单打印现价
select dt, case when dt < 5 then prem / 1000 * ENDCV else prem / 1000 * ENDCV - a.AMNT end cashvalue
from lcpol a,
     cv_1136003 b
where a.INSUYEAR = b.BP
  and a.PAYENDYEAR = b.PT
  and a.INSUREDAPPAGE = b.AGE
  and a.INSUREDSEX = b.GENDER
  and a.contno = '2025110700000686'
order by dt;

--犹豫期天数
select HESITATEEND
from LMEdorWT a
where riskcode = '1136003';

--还款利息
select round(2925.72 * round(0.03 / 365, 8) * (date'2026-02-10' - date'2026-01-11'), 2) LX
from dual;

--复效利息
select round(5000 * round(0.03 / 365, 8) * (date'2028-10-10' - date'2027-11-11'), 2) LX
from dual;

--非购买交清保额红利计算
select a.*
from BonusRate a
where riskcode = '1136003';

select a.*
from lobonusfactor a
where riskcode = '1136003';

select round(a.prem / 1000 * b.BonusFactor * nvl(c.bonusrate, '0'), 2) HL
from lcpol a,
     lobonusfactor b,
     BonusRate c
where a.riskcode = b.RISKCODE
  and a.riskcode = c.RISKCODE
  and b.INSUREDSEX = a.INSUREDSEX
  and b.InsuYear = a.INSUYEAR
  and b.INSUYEARFLAG = a.INSUYEARFLAG
  and b.PAYENDYEAR = a.PAYENDYEAR
  and b.PAYENDYEARFLAG = a.PAYENDYEARFLAG
  and b.INSUREDAPPAGE = a.INSUREDAPPAGE
  and to_date('2027-11-11', 'yyyy-mm-dd') between b.startdate and b.enddate
  and to_date('2027-11-11', 'yyyy-mm-dd') between c.cvalidate and c.enddate
  and b.bonusgrade = 'H'
  and b.annuitygetage = '0'
  and b.PolYear = '2'
  and a.CONTNO = '2025111000000456'
order by b.PolYear;

select GETMONEY, a.*
from LJABONUSGET a
where CONTNO = '2025111000001186'
order by BONUSYEAR, GETDATE, MAKEDATE, MAKETIME;

--红利利息
--累积生息批处理
select round(74.22 * round(0.03 / 365, 8) * (date'2027-11-11' - date'2026-11-11'), 2) HLLX
from dual;
--DB-红利给付
select round(sum(GETMONEY) * round(0.03 / 365, 8) * (date'2031-11-20' - date'2031-11-11'), 2) HLLX
from LJABONUSGET a
where CONTNO = '2025111000001186';

--生存金
select a.AMNT, b.GETMONEY, b.*
from lcpol a,
     LJAGETDRAW b
where a.CONTNO = b.CONTNO
  and a.CONTNO = '2025111000001186';

--LG-生存给付利息
SELECT SUM(CASE WHEN MONEYTYPE = 'YFLX' THEN MONEY ELSE 0 END) +
       ROUND(
               SUM(CASE WHEN MONEYTYPE IN ('YF', 'YFLX') THEN MONEY ELSE 0 END) *
               ROUND(0.06 / 365, 8) *
               (DATE'2031-11-20' - DATE'2031-11-11'),
               2
       ) AS YFLX
FROM LCINSUREACCTRACE
WHERE CONTNO = '2025111000001186'
  AND MONEYTYPE IN ('YF', 'YFLX');

--退保
--t≤PPP，年领未欠缴保费
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

--t≤PPP，年领欠缴保费
select round(a.prem / 1000 * b.endcv - 593.00, 2) cash
from lcpol a,
     cv_1136003 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025111000001186'
  and b.dt = 5;

--t>PPP，年领欠缴保费
select round(a.prem / 1000 * b.endcv - 593.00, 2) cash
from lcpol a,
     cv_1136003 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025111000001186'
  and b.dt = 5;

--t>PPP，年领未欠缴保费
select round((a.prem / 1000 * b.endcv * (DATE '2026-12-10' - DATE '2026-11-14') / 365) +
             (a.prem / 1000 * b.begcv *
              (365 - (DATE '2026-12-10' - DATE '2026-11-14')) / 365), 2) cash
from lcpol a,
     cv_1136003 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025111300000486'
  and b.dt = 2;


-------------------------------------------------------------------------------------------------------------
--购买交清保额
--本年度购买交清保额=实际给付红利*1000/趸交净保费率
select round(a.prem / 1000 * b.BonusFactor * nvl(c.bonusrate, '0'), 2) 当年度基本保额红利,
       decode(d.dt, 1, 0, round(e.amnt / 1000 * nvl(b.jqbonusfactor, 0) * nvl(c.bonusrate, '0'),
                                2))                                    已产生的减额交清红利,
       round(a.prem / 1000 * b.BonusFactor * nvl(c.bonusrate, '0'), 2) +
       decode(d.dt, 1, 0, round(e.amnt / 1000 * nvl(b.jqbonusfactor, 0) * nvl(c.bonusrate, '0'),
                                2))                                    当年度总和,
       round((round(a.prem / 1000 * b.BonusFactor * nvl(c.bonusrate, '0'), 2) +
              decode(d.dt, 1, 0, round(e.amnt / 1000 * nvl(b.jqbonusfactor, 0) * nvl(c.bonusrate, '0'),
                                       2))) * 1000 / PUACOST, 2)       当年度减额交清红利
from lcpol a,
     lobonusfactor b,
     BonusRate c,
     PUA_1136003 d,
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
  and to_date('2027-11-13', 'yyyy-mm-dd') between b.startdate and b.enddate
  and to_date('2027-11-13', 'yyyy-mm-dd') between c.cvalidate and c.enddate
  and b.bonusgrade = 'H'
  and b.annuitygetage = '0'
  and e.DUTYCODE like '%1001'/*dt='1'时注释掉*/
  and d.dt = '3'
  and a.contno = '2025111200000296'
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
  and b.BONUSGRADE = 'H'
  and a.contno = '2025111200000296'
order by to_number(POLYEAR);

select a.*
from lobonusfactor a
where RISKCODE = '1136003';

select a.*
from BonusRate a
where riskcode = '1136003'
order by CVALIDATE;

select b.*
from lcpol a,
     pua_1136003 b
where a.INSUREDAPPAGE = b.age
  and a.INSUREDSEX = b.GENDER
  and a.contno = '2025111200000296'
order by dt;

select GETMONEY, JQAMNT, a.*
from LJABonusGet a
where contno = '2025111200000296'
order by makedate, maketime;

select a.*
from LISDATA.LPEDORITEM a
where contno = '2025103100001116'

--退保
--累积交清基本保险金额应退金额
select round(a.AMNT / 1000 * cv2 * (date'2028-11-20' - date'2028-11-13') / 365 +
             a.AMNT / 1000 * cv1 * (1 - (date'2028-11-20' - date'2028-11-13') / 365), 2) cash,a.AMNT
from lcduty a,
     PUA_1136003 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.INSUREDAPPAGE
  and b.GENDER = c.INSUREDSEX
  and a.DUTYCODE like '%1001'
  and a.contno = '2025111200000296'
  and b.dt = 4;
--红利宣告交清基本保险金额应退金额
select round(492.47 / 1000 * cv2 * (date'2030-12-10' - date'2030-11-13') / 365 +
             492.47 / 1000 * cv1 * (1 - (date'2030-12-10' - date'2030-11-13') / 365), 2) cash
from lcduty a,
     PUA_1136003 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.INSUREDAPPAGE
  and b.GENDER = c.INSUREDSEX
  and a.DUTYCODE like '%1001'
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

