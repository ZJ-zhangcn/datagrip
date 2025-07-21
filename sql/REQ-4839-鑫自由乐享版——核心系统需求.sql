--t≤PPP，年领未欠缴保费
select a.prem / 1000 * b.endcv *
       power(1 + 0.0425,
             (((date '2030-07-08' - date '2030-07-08') - 365) / 365))
  from lcpol a, cv_1011004 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno='2025070700000316'
   and b.dt = 6

--t≤PPP，年领欠缴保费
select a.prem / 1000 * b.endcv
  from lcpol a, cv_1011004 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno = '2025070200005096'
   and b.dt = 1

--t>PPP，年领欠缴保费
select a.prem / 1000 * b.endcv
  from lcpol a, cv_1011004 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno = '2025070200005096'
   and b.dt = 2

--t>PPP，年领未欠缴保费
select prem / 1000 * endcv * (date '2030-10-01' - date '2030-07-09') / 365 +
       prem / 1000 * begcv *
       (1 - (date '2030-10-01' - date '2030-07-09') / 365)
  from cv_1011004 a, lcpol b
 where pt = payendyear
   and age = insuredappage
   and gender = insuredsex
   and contno = '2025070800001786'
   and dt = 6

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
  from cv_1011004 a, lcpol b
 where pt = payendyear
   and age = insuredappage
   and gender = insuredsex
   and contno = '2025070800001786'
   and dt = 6;

--减保后的保费
select 43309.26663968 * 1000 / rate
from rt_1011004 a,
     lcpol b
where pt = payendyear
  and age = insuredappage
  and gender = insuredsex
  and contno = '2025070800001786';

--减额交清公共保额限制
select * from ldcode a where codetype = 'PublicPUlowestAmnt' and code='000000';

--减额交清后保额计算
--u=0 & 未交纳年初应交保费 & 未发放年初生存保险金
select 10000 / 1000 * a.RPU
from cv_1011004 a,
     lcpol b
where pt = payendyear
  and age = insuredappage
  and gender = insuredsex
  and contno = '2025070700000316'
  and dt = 6 - 1;

--other
select 4174.50 * 1000 / (a.END_AFACTOR * (date '2026-08-01' - date '2026-07-10') / 365 +
                          a.BEG_AFACTOR * (1 - (date '2026-08-01' - date '2026-07-10') / 365))
from cv_1011004 a,
     lcpol b
where pt = payendyear
  and age = insuredappage
  and gender = insuredsex
  and contno = '2025070900000286'
  and dt = 2;

--减额交清后保费计算
select 4079.55 * 1000 / a.rate
from rt_1011004 a,
     lcpol b
where pt = payendyear
  and age = insuredappage
  and gender = insuredsex
  and contno = '2025070900000286'

--减额交清后现价计算
select (cast((4079.55400692 / 1000 * cv_rpuAfactorEnd) as decimal(18, 2)) * ((date '2026-08-01' - date '2026-07-10') / 365)) +
       (cast((4079.55400692 / 1000 * cv_rpuAfactorBeg) as decimal(18, 2)) *
        (1 - ((date '2026-08-01' - date '2026-07-10') / 365))) cash
from cv_1011004 a,
     lcpol b
where pt = payendyear
  and age = insuredappage
  and gender = insuredsex
  and contno = '2025070900000286'
  and dt = 2