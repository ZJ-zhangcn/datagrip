--t≤PPP，年领未欠缴保费
select a.prem / 1000 * b.endcv *
       power(1 + 0.0425,
             (((date '2025-11-05' - date '2025-06-23') - 365) / 365))
  from lcpol a, cv_1016011 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno='2025062300001206'
   and b.dt = 1

--t≤PPP，年领欠缴保费
select a.prem / 1000 * b.endcv
  from lcpol a, cv_1016011 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno = '2025062300001206'
   and b.dt = 1

--t>PPP，年领欠缴保费
select a.prem / 1000 * b.endcv
  from lcpol a, cv_1016011 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno = '2025062300001206'
   and b.dt = 6

--t>PPP，年领未欠缴保费
select prem / 1000 * endcv * (date '2030-06-30' - date '2030-06-25') / 365 +
       prem / 1000 * begcv *
       (1 - (date '2030-06-30' - date '2030-06-25') / 365)
  from cv_1016011 a, lcpol b
 where pt = payendyear
   and age = insuredappage
   and gender = insuredsex
   and contno = '2025062400001306'
   and dt = 6

--减保限额
select least(amnt * 0.2 / amnt * 9056.52 - 1000,
             9056.52)
  from cv_1016007 a, lcpol b
 where pt = payendyear
   and age = insuredappage
   and gender = insuredsex
   and contno = '2025062400001306'
   and dt = 6

--减保后的保额
select round((1 - 1000 / 9056.52) * amnt,8)
  from cv_1016011 a, lcpol b
 where pt = payendyear
   and age = insuredappage
   and gender = insuredsex
   and contno = '2025062400001306'
   and dt = 6;

--减保后的保费
select 6359.35707358*1000/714.87 from dual;

--减额交清公共保额限制
select * from ldcode a where codetype = 'PublicPUlowestAmnt' and code='000000';

--减额交清后现价计算
select (cast((28130.6 / 1000 * cv_rpuAfactorEnd) as decimal(18, 2)) * ((date '2030-06-30' - date '2030-06-25') / 365)) +
       (cast((28130.6 / 1000 * cv_rpuAfactorBeg) as decimal(18, 2)) *
        (1 - ((date '2030-06-30' - date '2030-06-25') / 365))) cash
from cv_1016011 a,
     lcpol b
where pt = payendyear
  and age = insuredappage
  and gender = insuredsex
  and contno = '2025062400001676'
  and dt = 6