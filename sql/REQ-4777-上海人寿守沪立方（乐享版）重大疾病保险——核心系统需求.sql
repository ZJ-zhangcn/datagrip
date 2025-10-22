--t≤PPP，未欠缴保费
select a.amnt / 1000 * b.endcv *
       power(1 + 0.045,
             (((date '2025-10-01' - date '2025-05-21') - 365) / 365))
from lcpol a,
     cv_1051020 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.CONTPLANCODE = b.plancode
  and a.contno = '2025051900000206'
  and b.dt = 1;
--t≤PPP，欠缴保费
select a.amnt / 1000 * b.endcv
  from lcpol a, cv_1051020 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
  and a.CONTPLANCODE = b.plancode
   and a.contno = '2025052000000286'
   and b.dt = 2;
--t>PPP，欠缴保费
select a.amnt / 1000 * b.endcv
  from lcpol a, cv_1051020 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
  and a.CONTPLANCODE = b.plancode
   and a.contno = '2025052000000286'
   and b.dt = 4;
--t>PPP，未欠缴保费
select (a.amnt / 1000 * b.endcv * (date '2030-10-01' - date '2030-05-21') / 365) +
       (a.amnt / 1000 * b.begcv *
       (365 - (date '2030-10-01' - date '2030-05-21')) / 365)
  from lcpol a, cv_1051020 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
  and a.CONTPLANCODE = b.plancode
   and a.contno = '2025052000000286'
   and b.dt = 6;
/*
计划责任编码：
    计划一：ID0412
    计划二：ID0413
    计划三：ID0414
    计划四：ID0415
*/;