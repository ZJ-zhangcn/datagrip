--t<=PPP
select b.prem / 1000 * a.endcv *
       power(1 + 0.045, (date '2025-12-01' - date '2025-11-21') / 365 - 1)
  from cv_1003007 a, lcpol b
 where bp = insuyear
   and pt = payendyear
   and age = insuredappage
   and gender = insuredsex
   and dt = 1
   and contno = '2024112000000196'

--t>PPP
select b.prem / 1000 * a.endcv * (date '2025-12-03' - date '2025-11-21') / 365 +
       b.prem / 1000 * a.begcv * (1 - (date '2025-12-03' - date '2025-11-21') / 365)
  from cv_1003007 a, lcpol b
 where bp = insuyear
   and pt = payendyear
   and age = insuredappage
   and gender = insuredsex
   and dt = 2
   and contno = '2024112000000196'

select a.* from rt_1003007 a;