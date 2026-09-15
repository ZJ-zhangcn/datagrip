/*
5000118341880450，2026082100001526，趸交10000，红利现金领取，投保人18岁，被保人男性28天，红利勾选，070107，
5000118341880498，2026082400000186，3年交，女性，72岁，购买交清保额
5000118341880504，2026082400000226，4年交，男性，69岁，累积生息
5000118341880863，2026082500000876，六年交，男性，66岁
*/

--犹豫期
select HESITATEEND
from LMEdorWT
where riskcode = '1116006';

--还款利息
select round(3000 * 0.03 / 365 * (date '2026-10-20' - date '2026-09-20' - 1), 2) 还款利息
from dual;

--复效利息
select round(300000 * round(0.03 / 365, 8) * (date '2027-10-25' - date '2027-08-25'), 2) 复效利息
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
  and a.riskcode = '1116006'
  and date'2027-06-15' between c.CVALIDATE and c.ENDDATE
--   and a.POLYEAR = '2'
  and b.contno = '2026082400000226'
order by to_number(POLYEAR);
--红利利息计算
--红利本金*日利率*计息天数
select round(3932.73 * round(0.03 / 365, 8) * (date'2027-10-25' - date'2027-08-25' - 1), 2) 红利利息
from dual;

--退保
--t≤PPP，未欠缴保费
select round(a.prem / 1000 * b.endcv *
             power(1 + 0.0375, (((date '2029-08-30' - date '2029-08-26') - 365) / 365)), 2) cash/*,
       (select sumprem from lcprem where contno = a.contno)                                 累计已交保费*/
from lcpol a,
     cv_1116006 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2026082500000876'
  and b.dt = 3
order by dt;

--t≤PPP，欠缴保费
select round(a.prem / 1000 * b.endcv, 2) cash/*, round(a.prem * 3 * 1.2, 2) 比例*/
from lcpol a,
     cv_1116006 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2026082500000876'
  and b.dt = 2;

--t>PPP，欠缴保费
select round(a.prem / 1000 * b.endcv, 2) cash
from lcpol a,
     cv_1116006 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2026082400000226'
  and b.dt = 3;

--t>PPP，未欠缴保费
select round((a.prem / 1000 * b.endcv * (date'2031-08-30' - date'2031-08-25') / 366) +
             (a.prem / 1000 * b.begcv *
              (366 - (date'2031-08-30' - date'2031-08-25')) / 366), 2) cash/*,
       (select sumprem from lcprem where contno = a.contno)            累计已交保费*/
from lcpol a,
     cv_1116006 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2026082400000226'
  and b.dt = 6
order by dt;


--减保限额
select round(least(amnt * 0.2 / amnt * 1160873.25 - 0,
                   1160873.25), 2) 减保限额
from lcpol a,
     cv_1116006 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and contno = '2026082400000226'
  and dt = 6;

--减保后的保额
select round((1 - 1000 / 1160873.25) * amnt, 2) 减保后的保额
from lcpol a,
     cv_1116006 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and contno = '2026082400000226'
  and dt = 6;

--减保后的保费
select round(914652.42 * 1000 / 3051.47, 2) 减保后的保费
from dual;


--减额交清
--最低公共保额配置
select *
from ldcode
where codetype = 'PublicPUlowestAmnt'
  and code = '000000';

--t≤PPP，欠缴保费
select round(a.prem / 1000 * b.endcv, 2) cash/*, round(a.prem * 3 * 1.2, 2) 比例*/
from lcpol a,
     cv_1116006 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2026082500000876'
  and b.dt = 3;

--减额交清后保额  u=0 & 未交纳年初应交保费&未发放年初生存保险金
select round(300000 / 1000 * a.rpu, 2) 减额交清后保额
from cv_1116006 a,
     lcpol b
where a.age = b.insuredappage
  and a.gender = b.insuredsex
  and a.pt = b.payendyear
  and b.contno = '2026082500000876'
  and a.dt = '3';

--t≤PPP，未欠缴保费
select round(a.prem / 1000 * b.endcv *
             power(1 + 0.0375, (((date '2029-08-20' - date '2028-08-26') - 365) / 365)), 2) cash
from lcpol a,
     cv_1116006 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2026082500000876'
  and b.dt = 3
order by dt;

--减额交清后的保额  other
select round(550306.74 * 1000 /
             (a.END_AFACTOR * (date '2029-08-20' - date '2028-08-26') / 365 +
              a.BEG_AFACTOR * (365 - (date '2029-08-20' - date '2028-08-26')) / 365), 2) 减额交清后的现金价值
from cv_1116006 a,
     lcpol b
where a.age = b.insuredappage
  and a.gender = b.insuredsex
  and a.pt = b.payendyear
  and b.contno = '2026082500000876'
  and a.dt = '3';

--减额交清后的现金价值
select round(472084.72 / 1000 *
             (a.cv_rpuafactorend * (date '2029-08-20' - date '2028-08-26') / 365 +
              a.cv_rpuafactorbeg * (365 - (date '2029-08-20' - date '2028-08-26')) / 365), 2) 减额交清后的现金价值
from cv_1116006 a,
     lcpol b
where a.age = b.insuredappage
  and a.gender = b.insuredsex
  and a.pt = b.payendyear
  and b.contno = '2026082500000876'
  and a.dt = '3';

--减额交清后保费
select round(248643 * 1000 / a.rate, 2) 减额交清后保费
from rt_1116006 a,
     lcpol b
where a.age = b.insuredappage
  and a.pt = b.payendyear
  and a.gender = b.insuredsex
  and b.contno = '2026082500000876';


-------------------------------------------------------------------------------------------------------------
--购买交清保额
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
     PUA_1116006 d,
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
  and to_date('2028-08-25', 'yyyy-mm-dd') between b.startdate and b.enddate
  and to_date('2028-08-25', 'yyyy-mm-dd') between c.cvalidate and c.enddate
  and b.bonusgrade = 'H'
  and b.annuitygetage = '0'
  and e.DUTYCODE like '%1001'/*dt='1'时注释掉*/
  and d.dt = '5'
  and a.contno = '2026082400000226'
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
  and a.contno = '2026082400000226'
order by to_number(POLYEAR);

SELECT 1.2 * (200000.00 / 1000) * 35.6
FROM dual;

SELECT CalMode, VPU
FROM LMDuty a,
     LMRiskDuty b
WHERE a.DutyCode = b.DutyCode
  AND b.RiskCode = '1116006'
  AND a.CalMode IS NOT NULL;

SELECT prem, a.*
FROM lcpol a
WHERE contno = '2026082400000226';

select a.*
from lobonusfactor a
where RISKCODE = '1116006';

select a.*
from BonusRate a
where riskcode = '1116006'
order by CVALIDATE;

select GETMONEY, JQAMNT, a.*
from LJABonusGet a
where contno = '2026082400000226'
order by makedate, maketime;

SELECT a.*
FROM lcduty a
WHERE contno = '2026082400000226';--19981.06

SELECT a.*
FROM LJaGETDRAW a
WHERE contno = '2026082400000226'
order by getdate, makedate, maketime;

SELECT a.*
FROM LCINSUREACCTRACE a
WHERE contno = '2026082400000226'
order by paydate, makedate, maketime;

SELECT sumprem * 0.0175 + 26.22
FROM lcprem
where contno = '2026082400000226';
--201.22

--退保
--红利宣告交清基本保险金额应退金额
select round((16217.86 + a.amnt) / 1000 * cv2 * (date'2031-08-30' - date'2031-08-25') / 366 +
             (16217.86 + a.amnt) / 1000 * cv1 * (1 - (date'2031-08-30' - date'2031-08-25') / 366), 2) cash
from lcduty a,
     PUA_1116006 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.INSUREDAPPAGE
  and b.GENDER = c.INSUREDSEX
  and a.DUTYCODE like '%1001'
  and a.contno = '2026082400000226'
  and b.dt = 6;

--累积交清基本保险金额减保限额
select round(a.AMNT / 1000 * cv2 * (date'2029-09-10' - date'2029-08-25') / 365 +
             a.AMNT / 1000 * cv1 * (1 - (date'2029-09-10' - date'2029-08-25') / 365), 2) cash
from lcduty a,
     PUA_1116006 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.INSUREDAPPAGE
  and b.GENDER = c.INSUREDSEX
  and a.DUTYCODE like '%1001'
  and a.contno = '2026082400000226'
  and b.dt = 4
order by dt;
--累积交清基本保险金额减保后保额  select (1-第t次减保的金额/第t次减保前的现金价值)*第t次减保前的保额 from dual;
select round((1 - 1000 / 20120.34) * 19981.06, 2) 减保后保额
from dual;

select ((10561.60 - 1000) * 1000 * 366) /
       (cv2 * (date'2039-08-20' - date'2039-08-01') + cv1 * (366 - (date'2039-08-20' - date'2039-08-01'))) 现价逆推保额
from lcduty a,
     PUA_1116006 b,
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

SELECT a.*
FROM ldtask a
WHERE TASKDESCRIBE like '%短信%';

SELECT a.* FROM lcpol a WHERE polno='210310000006246';
SELECT a.* FROM lcduty a WHERE contno='2026083100001456';

select round(a.AMNT / 1000 * cv2 * (date'2027-09-03' - date'2027-09-01') / 366 +
             a.AMNT / 1000 * cv1 * (1 - (date'2027-09-03' - date'2027-09-01') / 366), 2) cash
from lcduty a,
     PUA_1116006 b,
     lcpol c
where a.contno = c.contno
  and b.age = c.INSUREDAPPAGE
  and b.GENDER = c.INSUREDSEX
  and a.DUTYCODE like '%1001'
  and a.contno = '2026083100001456'
  and b.dt = 2
order by dt;