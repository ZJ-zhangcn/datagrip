--犹豫期
select hesitateend
from lmedorwt
where riskcode = '1033049';

--还款利息
select round(7621.7 * 0.03 / 365 * (date '2026-10-20' - date '2026-09-20' - 1), 2) 还款利息
from dual;

--复效利息
select round(10000 * round(0.03 / 365, 8) * (date '2030-10-10' - date '2028-08-12'), 2) +
       round(10000 * round(0.03 / 365, 8) * (date '2030-10-10' - date '2029-08-12'), 2) +
       round(10000 * round(0.03 / 365, 8) * (date '2030-10-10' - date '2030-08-12'), 2) 复效利息
from dual;

--生存金本金
SELECT sum(getmoney)
FROM ljagetdraw a
WHERE contno = '2026081100001286'
  and FEEFINATYPE = 'YF';
--6000
--已产生的生存金利息
SELECT sum(money)
FROM lcinsureacctrace a
WHERE contno = '2026081100001286'
  and MONEYTYPE = 'YFLX'
order by paydate, makedate, maketime;
--367.88
--截至LG保全生效日的利息
select round(2247.55 * round(0.06 / 365, 8) * (date '2036-08-20' - date '2036-08-12'), 2) +
       round(2120.33 * round(0.06 / 365, 8) * (date '2036-08-20' - date '2036-08-12'), 2) +
       round(2000.00 * round(0.06 / 365, 8) * (date '2036-08-20' - date '2036-08-12'), 2) 截至LG保全生效日的利息
from dual;
--8.38
--总利息
SELECT 367.88 + 8.38 总利息
FROM dual;

SELECT amnt, a.*
FROM lcpol a
WHERE contno = '2026081100001286';
SELECT a.*
FROM ljagetdraw a
WHERE contno = '2026081100001286'
order by getdate, makedate, maketime;
SELECT a.*
FROM lcinsureacctrace a
WHERE contno = '2026081100001286'
order by paydate, makedate, maketime;
SELECT a.*
FROM lcappnt a
WHERE contno = '2026081100001286';

--退保
--t≤ppp，未欠缴保费
select round(a.prem / 1000 * b.endcv *
             power(1 + 0.04, (((date '2034-08-20' - date '2034-08-12') - 365) / 365)), 2) cash,
       a.prem * a.PAYENDYEAR                                                              累计已交保费
from lcpol a,
     cv_1033049 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.insuyear = b.bp
  and a.contno = '2026081100001286'
  and b.dt = 9;

--t≤ppp，欠缴保费
select round(a.prem / 1000 * b.endcv, 2) - 2000 cash
from lcpol a,
     cv_1033049 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.insuyear = b.bp
  and a.contno = '2026081100001286'
  and b.dt = 8;

--t>ppp，欠缴保费
select round(a.prem / 1000 * b.endcv, 2) - 2000 cash
from lcpol a,
     cv_1033049 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.insuyear = b.bp
  and a.contno = '2026081100001286'
  and b.dt = 9;

--t>ppp，未欠缴保费
select round((a.prem / 1000 * b.endcv * (date '2036-08-21' - date '2036-08-12') / 365) +
             (a.prem / 1000 * b.begcv *
              (365 - (date '2036-08-21' - date '2036-08-12')) / 365), 2) cash/*,
       a.prem * a.PAYENDYEAR                                             累计已交保费*/
from lcpol a,
     cv_1033049 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.insuyear = b.bp
  and a.contno = '2026081100001286'
  and b.dt = 11;

