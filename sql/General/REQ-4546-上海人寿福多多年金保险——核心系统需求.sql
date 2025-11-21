--保费算保额
select 10000/1000*204 from dual

--保单打印现金价值
select endcv, prem / 1000 * endcv
  from lcpol a, cv_1031012 b
 where insuyear = bp
   and insuredsex = gender
   and insuredappage = age
   and payendyear = pt
   and contno = '2024120500000186'
 order by dt

--还款
select 30739.75*0.05/365*(date'2025-07-11'-date'2025-06-10') from dual

--生存金利息
select 1275*0.03/365*(date'2030-12-06'-date'2029-12-06')+(1275+38.25+1275)*0.03/365*(date'2030-12-10'-date'2030-12-06') from dual

--复效利息
select 20000*(date'2026-02-05'-date'2025-12-06')*round(0.05/365,8) from dual

--退保
--t≤PPP，未欠缴保费
select a.prem / 1000 * b.endcv *
       power(1 + 0.045,
             ((date '2025-02-01' - date '2024-12-26')/365 - 1))
  from lcpol a, cv_1031012 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno='2024122500000306'
   and b.dt = 1

--t≤PPP，欠缴保费
select a.prem / 1000 * b.endcv - 2040
  from lcpol a, cv_1031012 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno = '2024120500000456'
   and b.dt = 9

--t>PPP，欠缴保费
select a.prem / 1000 * b.endcv - 2040
  from lcpol a, cv_1031012 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno = '2024120500000456'
   and b.dt = 9

--t>PPP，未欠缴保费
select a.prem / 1000 * b.endcv * (date '2031-03-10' - date '2031-02-25') / 365 +
       a.prem / 1000 * b.begcv *
       (1 - (date '2031-03-10' - date '2031-02-25') / 365)
  from lcpol a, cv_1031012 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno = '2025022400000416' and a.riskcode='1031012'
   and b.dt = 7;