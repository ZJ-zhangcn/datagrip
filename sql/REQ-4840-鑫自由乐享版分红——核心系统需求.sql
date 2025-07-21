select a.bonusgetmode,
       (select codename from ldcode where codetype = 'bonusgetmode' and code = a.bonusgetmode) 红利领取方式,
       a.*
from lcpol a
where contno = '2025071100000466';

select a.* from LISDATA.LOBONUSPOL a where contno='2025071400001276' order by SGETDATE;
select a.* from LISDATA.LCINSUREACCTRACE a where contno='2025071100000826' order by paydate,makedate,maketime,otherno;

select (68.22+142.02+2.05+218.96+7.31) 本金,(68.22+142.02+2.05+218.96+7.31)*round(0.03/365/*恒365*/,8)*(date '2029-07-20' - date '2029-07-12') 利息 from dual;

select bonussamenewacc,a.* from lccont a where prtno='5000118350711016'

SELECT *
FROM BonusRate
WHERE riskcode = '1111002'
order by CVALIDATE;
/*
INSERT INTO LISDATA.BONUSRATE (RISKCODE, CVALIDATE, ENDDATE, BONUSGRADE, BONUSRATE) VALUES ('1111002', DATE '2025-07-01', DATE '2026-06-30', 'H', '1.2');
INSERT INTO LISDATA.BONUSRATE (RISKCODE, CVALIDATE, ENDDATE, BONUSGRADE, BONUSRATE) VALUES ('1111002', DATE '2026-07-01', DATE '2027-06-30', 'H', '1.2');
INSERT INTO LISDATA.BONUSRATE (RISKCODE, CVALIDATE, ENDDATE, BONUSGRADE, BONUSRATE) VALUES ('1111002', DATE '2027-07-01', DATE '2028-06-30', 'H', '1.2');
INSERT INTO LISDATA.BONUSRATE (RISKCODE, CVALIDATE, ENDDATE, BONUSGRADE, BONUSRATE) VALUES ('1111002', DATE '2028-07-01', DATE '2029-06-30', 'H', '1.2');
INSERT INTO LISDATA.BONUSRATE (RISKCODE, CVALIDATE, ENDDATE, BONUSGRADE, BONUSRATE) VALUES ('1111002', DATE '2029-07-01', DATE '2030-06-30', 'H', '1.2');

*/

select amnt / 1000 * 1.2 * b.BONUSFACTOR
from lcpol a,
     lobonusfactor b
where a.riskcode = b.riskcode
  and a.INSUREDSEX = b.INSUREDSEX
  and a.INSUREDAPPAGE = b.INSUREDAPPAGE
  and a.INSUYEAR = b.INSUYEAR
  and a.INSUYEARFLAG = b.INSUYEARFLAG
  and a.PAYENDYEAR = b.PAYENDYEAR
  and a.PAYENDYEARFLAG = b.PAYENDYEARFLAG
  and b.POLYEAR = '1'
  and b.BONUSGRADE = 'H'
  and contno = '2025071100000786';

select 68.22*round(0.03/365,8)*(date'2026-07-20'-date'2026-07-12') from dual;

--t≤PPP，年领未欠缴保费
select a.prem / 1000 * b.endcv *
       power(1 + 0.0375,
             (((date '2030-06-01' - date '2029-07-12') - 365) / 365))
  from lcpol a, cv_1111002 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno='2025071100001286'
   and b.dt = 5;

--t≤PPP，年领欠缴保费
select a.prem / 1000 * b.endcv
  from lcpol a, cv_1111002 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno = '2025071100001286'
   and b.dt = 5;

--t>PPP，年领欠缴保费
select a.prem / 1000 * b.endcv
  from lcpol a, cv_1111002 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno = '2025071100000786'
   and b.dt = 2

--复效利息
select 5000*round(0.03/365,8)*(date'2028-07-20'-date'2027-07-12') from dual;

--t>PPP，年领未欠缴保费
select prem / 1000 * endcv * (date '2029-07-20' - date '2029-07-12') / 365 +
       prem / 1000 * begcv *
       (1 - (date '2029-07-20' - date '2029-07-12') / 365)
  from cv_1111002 a, lcpol b
 where pt = payendyear
   and age = insuredappage
   and gender = insuredsex
   and contno = '2025071100000786'
   and dt = 5;

--减额交清公共保额限制
select * from ldcode a where codetype = 'PublicPUlowestAmnt' and code='000000';

--减额交清后保额计算
--u=0 & 未交纳年初应交保费 & 未发放年初生存保险金
select 10000 / 1000 * a.RPU
from cv_1111002 a,
     lcpol b
where pt = payendyear
  and age = insuredappage
  and gender = insuredsex
  and contno = '2025071100001286'
  and dt = 3 - 1;

--other
select 30694.71 * 1000 / (a.END_AFACTOR * (date '2030-06-01' - date '2029-07-12') / 365 +
                          a.BEG_AFACTOR * (1 - (date '2030-06-01' - date '2029-07-12') / 365))
from cv_1111002 a,
     lcpol b
where pt = payendyear
  and age = insuredappage
  and gender = insuredsex
  and contno = '2025071100001286'
  and dt = 5;

--减额交清后保费计算
select 25071.05932629 * 1000 / a.rate
from rt_1111002 a,
     lcpol b
where pt = payendyear
  and age = insuredappage
  and gender = insuredsex
  and contno = '2025071100001286'

--减额交清后现价计算
select (cast((25071.06 / 1000 * cv_rpuAfactorEnd) as decimal(18, 2)) * ((date '2030-06-01' - date '2029-07-12') / 365)) +
       (cast((25071.06 / 1000 * cv_rpuAfactorBeg) as decimal(18, 2)) *
        (1 - ((date '2030-06-01' - date '2029-07-12') / 365))) cash
from cv_1111002 a,
     lcpol b
where pt = payendyear
  and age = insuredappage
  and gender = insuredsex
  and contno = '2025071100001286'
  and dt = 5

--减保限额
--本年度第一次
select least(46093.5 * 0.2 / 46093.5 * 48665.61240621 - 0,
             48665.61240621)
from lcpol
where contno = '2025070800001786';
--本年度第二次
select least(46093.5 * 0.2 / 45165.42 * 48665.61240621 - 1000,
             48665.61240621)
from lcpol
where contno = '2025070800001786';

--减保后的保额
select round((1 - 2000 / 48665.61240621) * 45165.42,8)
  from cv_1111002 a, lcpol b
 where pt = payendyear
   and age = insuredappage
   and gender = insuredsex
   and contno = '2025070800001786'
   and dt = 6;

--减保后的保费
select 43309.26663968 * 1000 / rate
from rt_1111002 a,
     lcpol b
where pt = payendyear
  and age = insuredappage
  and gender = insuredsex
  and contno = '2025070800001786';