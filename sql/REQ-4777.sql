-- id: req-4777
-- 标题: 上海人寿守沪立方（乐享版）重大疾病保险——核心系统需求

--t≤ppp，未欠缴保费
select a.amnt / 1000 * b.endcv *
       power(1 + 0.045,
             (((date '2025-10-01' - date '2025-05-21') - 365) / 365))
from lcpol a,
     cv_1051020 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contplancode = b.plancode
  and a.contno = '2025051900000206'
  and b.dt = 1;

--t≤ppp，欠缴保费
select a.amnt / 1000 * b.endcv
  from lcpol a, cv_1051020 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
  and a.contplancode = b.plancode
   and a.contno = '2025052000000286'
   and b.dt = 2;

--t>ppp，欠缴保费
select a.amnt / 1000 * b.endcv
  from lcpol a, cv_1051020 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
  and a.contplancode = b.plancode
   and a.contno = '2025052000000286'
   and b.dt = 4;

--t>ppp，未欠缴保费
select (a.amnt / 1000 * b.endcv * (date '2030-10-01' - date '2030-05-21') / 365) +
       (a.amnt / 1000 * b.begcv *
       (365 - (date '2030-10-01' - date '2030-05-21')) / 365)
  from lcpol a, cv_1051020 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
  and a.contplancode = b.plancode
   and a.contno = '2025052000000286'
   and b.dt = 6;
/*
计划责任编码：
    计划一：id0412
    计划二：id0413
    计划三：id0414
    计划四：id0415
*/;