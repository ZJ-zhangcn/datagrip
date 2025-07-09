--保盾云开关  codename='0'为开
select * from ldcode where codetype = 'bfyswitch' for update;

select COMCODE from ldcode where codetype = 'bfyswitch' and code = '0'

--
select 19999000/1000*66.53 from dual

--
select amnt / 1000 * endcv, endcv
  from cv_1016007 a, lcpol b
 where pt = b.payendyear
   and age = insuredappage
   and gender = insuredsex
   and contno = '2024111200000466'
 order by dt

--t<PPP，未欠缴保费
select amnt / 1000 * endcv *
       power((1 + 0.045),
             ((date '2024-12-31' - date '2024-11-29') / 365 - 1))
  from cv_1016007 a, lcpol b
 where pt = payendyear
   and age = insuredappage
   and gender = insuredsex
   and contno = '2024112800000266'
   and dt = 1

--t<PPP，欠缴保费
select amnt / 1000 * endcv
  from cv_1016007 a, lcpol b
 where pt = payendyear
   and age = insuredappage
   and gender = insuredsex
   and contno = '2024111400002686'
   and dt = 1

--t>PPP，欠缴保费
select amnt / 1000 * endcv
  from cv_1016007 a, lcpol b
 where pt = payendyear
   and age = insuredappage
   and gender = insuredsex
   and contno = '2024111400002316'
   and dt = 2

--t>PPP，未欠缴保费
select amnt / 1000 * endcv * (date '2030-06-30' - date '2030-06-25') / 365 +
       amnt / 1000 * begcv *
       (1 - (date '2030-06-30' - date '2030-06-25') / 365)
  from cv_1016007 a, lcpol b
 where pt = payendyear
   and age = insuredappage
   and gender = insuredsex
   and contno = '2025062400001306'
   and dt = 6

--减保限额
select least(amnt * 0.2 / amnt * 1876223.87 - 0,
             1876223.87)
  from cv_1016007 a, lcpol b
 where pt = payendyear
   and age = insuredappage
   and gender = insuredsex
   and contno = '2024112800000266'
   and dt = 1

--减保后的保额
select (1 - 10000 / 1876223.87) * amnt
  from cv_1016007 a, lcpol b
 where pt = payendyear
   and age = insuredappage
   and gender = insuredsex
   and contno = '2024112800000266'
   and dt = 1

--减保后的保费
select 19892408.24/1000*280.9 from dual

--还款利息
select 30000*(date'2026-01-01'-date'2025-11-15')*round(0.05/365,8) from dual

--复效利息
select 32510*(date'2026-02-20'-date'2025-11-15')*round(0.05/365,8) from dual
