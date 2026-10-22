--犹豫期
select HESITATEEND
from LMEdorWT
where riskcode = '1133009';

--还款利息
select round(5779.32 * 0.03 / 365 * (date '2026-08-20' - date '2026-07-20' - 1), 2) 还款利息
from dual;

--复效利息
select round(5000 * round(0.03 / 365, 8) * (date '2029-08-20' - date '2028-06-16'), 2) 复效利息
from dual;
--权限
update lpedorapp
set apppregrade='IPOS-12'
where EdorAcceptNo = '7402121100333055';

--当年度红利计算
--保费（保额）/1000*K值*红利因子
select round(b.amnt / 1000 * round(a.BONUSFACTOR, 2) * c.BONUSRATE, 2) 当年度红利
from lobonusfactor a,
     lcpol b,
     BonusRate c
where a.riskcode = b.riskcode
  and a.RISKCODE = c.RISKCODE
  and a.INSUREDSEX = b.INSUREDSEX
  and a.PAYENDYEAR = b.PAYENDYEAR
  and a.INSUREDAPPAGE = b.INSUREDAPPAGE
  and a.INSUYEAR = b.INSUYEAR
  and a.BONUSGRADE = 'H'
  and a.riskcode = '1133009'
  and date'2027-06-15' between c.CVALIDATE and c.ENDDATE
--   and a.POLYEAR = '2'
  and b.contno = '2026061500000526'
order by to_number(POLYEAR);
--红利利息计算
--红利本金*日利率*计息天数
select round(132.36 * round(0.03 / 365, 8) * (date'2027-08-10' - date'2027-08-01'), 2) 红利利息
from dual;

--生存金
select sum(GETMONEY) 本金
from ljagetdraw a
where contno = '2026073100000876';--2991.22

SELECT sum(MONEY) 已产生的利息
FROM LCINSUREACCTRACE a
WHERE contno = '2026073000002606'
  and MONEYTYPE = 'YFLX';--544.85

SELECT *
FROM LCINSUREACCTRACE a
WHERE contno = '2026073100000876'
--   and MONEYTYPE = 'YFLX'
order by paydate, makedate, maketime;--544.85

select round((2991.22 + 544.85) * round(0.06 / 365, 8) * (date'2036-08-10' - date'2036-07-31'), 2) 当前时间点的利息
from dual;
--5.81

SELECT 544.85 + 5.81 总利息
FROM dual;

--退保
--t≤PPP，未欠缴保费
select round(a.prem / 1000 * b.endcv *
             power(1 + 0.0375, (((date '2026-08-10' - date '2026-07-31') - 365) / 365)), 2) cash,
       (select sumprem from lcprem where contno = a.contno)                                 累计已交保费
from lcpol a,
     cv_1133009 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2026073000002606'
  and b.dt = 1
order by dt;

--t≤PPP，欠缴保费
select round(a.prem / 1000 * b.endcv, 2)-13840.00 cash/*, round(a.prem * 3 * 1.2, 2) 比例*/
from lcpol a,
     cv_1133009 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2026091700000216'
  and b.dt = 8;

SELECT a.* FROM LISDATA.LJAGETDRAW a WHERE contno='2026091700000216';

--t>PPP，欠缴保费
select round(a.prem / 1000 * b.endcv, 2) cash
from lcpol a,
     cv_1133009 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2026061500000526'
  and b.dt = 2;

--t>PPP，未欠缴保费
select round((a.prem / 1000 * b.endcv * (date'2027-10-18' - date'2027-08-18') / 366) +
             (a.prem / 1000 * b.begcv *
              (366 - (date'2027-10-18' - date'2027-08-18')) / 366), 2) cash,
       (select sumprem from lcprem where contno = a.contno)            累计已交保费
from lcpol a,
     cv_1133009 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2026081700000966'
  and b.dt = 2
order by dt;



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
     PUA_1133009 d,
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
  and a.PAYENDYEAR = d.pt
  and a.contno = e.contno
  and to_date('2039-08-18', 'yyyy-mm-dd') between b.startdate and b.enddate
  and to_date('2039-08-18', 'yyyy-mm-dd') between c.cvalidate and c.enddate
  and b.bonusgrade = 'H'
  and b.annuitygetage = '0'
  and e.DUTYCODE like '%1001'/*dt='1'时注释掉*/
  and d.dt = '4'
  and a.contno = '2026081700000786'
order by d.dt;

select a.amnt, b.*
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
  and a.contno = '2026081700000786'
order by to_number(POLYEAR);

SELECT 1.2 * (200000.00 / 1000) * 35.6
FROM dual;

SELECT CalMode, VPU
FROM LMDuty a,
     LMRiskDuty b
WHERE a.DutyCode = b.DutyCode
  AND b.RiskCode = '1133009'
  AND a.CalMode IS NOT NULL;

SELECT prem, a.*
FROM lcpol a
WHERE contno = '2026081700000786';

select a.*
from lobonusfactor a
where RISKCODE = '1133009';

select a.*
from BonusRate a
where riskcode = '1133009'
order by CVALIDATE;

select GETMONEY, JQAMNT, a.*
from LJABonusGet a
where contno = '2026091700000496'
order by makedate, maketime;--3036.47

SELECT 1346.4/27486.6237*1000 FROM dual;
SELECT 48.98*25432.84/1000 FROM dual;

SELECT a.*
FROM LJaGETDRAW a
WHERE contno = '2026091700000216'
order by getdate, makedate, maketime;

SELECT a.*
FROM LCINSUREACCTRACE a
WHERE contno = '2026073000002606'
order by paydate, makedate, maketime;

SELECT sumprem * 0.0175 + 26.22
FROM lcprem
where contno = '2026073000002606';
--201.22

--退保
--红利宣告交清基本保险金额应退金额
select /*round((a.amnt) / 1000 * cv2 * (date'2036-09-18' - date'2035-10-20') / 366 +
             (a.amnt) / 1000 * cv1 * (1 - (date'2036-09-18' - date'2035-10-20') / 366), 2)  cash,
       a.AMNT,
       round((2290.03) / 1000 * cv2 * (date'2036-09-18' - date'2035-10-20') / 366 +
             (2290.03) / 1000 * cv1 * (1 - (date'2036-09-18' - date'2035-10-20') / 366), 2) cash,*/
       round((a.amnt) / 1000 * cv1, 2)  cash
from lcduty a,
     PUA_1133009 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.INSUREDAPPAGE
  and b.GENDER = c.INSUREDSEX
  and b.pt = c.payendyear
  and a.DUTYCODE like '%1001'
  and a.contno = '2026091800000596'
  and b.dt = 2;

--累积交清基本保险金额减保限额
select round(3036.47 / 1000 * cv2 * (date'2035-09-18' - date'2034-12-30') / 365 +
             3036.47 / 1000 * cv1 * (1 - (date'2035-09-18' - date'2034-12-30')  / 365), 2) cash,round(3036.47 / 1000 * cv1, 2),(date'2035-09-18' - date'2034-12-30')
from lcduty a,
     PUA_1133009 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.INSUREDAPPAGE
  and b.GENDER = c.INSUREDSEX
  and b.pt = c.payendyear
  and a.DUTYCODE like '%1001'
  and a.contno = '2026091700000496'
  and b.dt = 9
order by dt;
--累积交清基本保险金额减保后保额  select (1-第t次减保的金额/第t次减保前的现金价值)*第t次减保前的保额 from dual;
select round((1 - 100 / 10661.53) * 566.55, 2) 减保后保额
from dual;

select ((10561.60 - 1000) * 1000 * 366) /
       (cv2 * (date'2039-08-20' - date'2039-08-01') + cv1 * (366 - (date'2039-08-20' - date'2039-08-01'))) 现价逆推保额
from lcduty a,
     PUA_1133009 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.INSUREDAPPAGE
  and b.GENDER = c.INSUREDSEX
  and b.pt = c.payendyear
  and a.DUTYCODE like '%1001'
  and a.contno = '2026073100000876'
  and b.dt = 14
order by dt;

--保险计划变更
select round(99 / 12 * (date'2026-07-16' - date'2026-07-11') / 30, 2),
       round(180 / 12 * (date'2026-07-16' - date'2026-07-11'/*变更生效日期*/) / 30, 2)
from dual;


select prem, standprem, a.*
from lcpol a
where prtno = '3206915160615043';

select appflag, prem, standprem, STANDBYFLAG1, a.*
from lppol a
where grpcontno = '2026061600001086';

select 120 * 1.01
from dual;

select round(round(8.25 * (date'2026-07-15' - date'2026-07-11') / 30, 2) * (1 - 0.25), 2),
       round(round(15 * (date'2026-07-15' - date'2026-07-11') / 30, 2) * (1 - 0.25), 2),
       round(round(22.5 * (date'2026-07-15' - date'2026-07-11') / 30, 2) * (1 - 0.25), 2),
       round(round(35 * (date'2026-07-15' - date'2026-07-11') / 30, 2) * (1 - 0.25), 2)
from dual;

