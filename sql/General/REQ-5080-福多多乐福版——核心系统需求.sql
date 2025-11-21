select 10000/1000*161 from dual;
select endcv * 30000 / 1000
from cv_1031014 a
where pt = 3
  and age = 75
  and gender = 0
order by dt;
select HESITATEEND,a.* from LMEdorWT a where riskcode='1031014';
--贷款利息
select round(34520.97*round(0.03/365,8)*(date'2025-11-10'-date'2025-10-11'),2) from dual;
--复效利息
select round(10000 * round(0.03 / 365, 8) * (date'2029-10-20' - date'2027-08-20'), 2) +
       round(10000 * round(0.03 / 365, 8) * (date'2029-10-20' - date'2028-08-20'), 2) +
       round(10000 * round(0.03 / 365, 8) * (date'2029-10-20' - date'2029-08-20'), 2) LX
from dual;
select a.* from ljapayperson a where contno='2025081900001486' order by paycount;
select amnt from lcpol a where contno='2025081900000606';
select round(1610 * round(0.06 / 365, 8) * (date'2035-10-20' - date'2031-08-20'), 2) +
       round(1610 * round(0.06 / 365, 8) * (date'2035-10-20' - date'2033-08-20'), 2) +
       round(1610 * round(0.06 / 365, 8) * (date'2035-10-20' - date'2033-08-20'), 2) +
       round(1610 * round(0.06 / 365, 8) * (date'2035-10-20' - date'2034-08-20'), 2) +
       round(1610 * round(0.06 / 365, 8) * (date'2035-10-20' - date'2035-08-20'), 2) LX
from dual;
select 7323.23+round(7323.23 * round(0.06 / 365, 8) * (date'2035-10-20' - date'2035-08-20'), 2)+1610 from dual;
--t≤PPP，年领未欠缴保费
select round(a.prem / 1000 * b.endcv *
             power(1 + 0.04,
                   (((date '2025-11-10' - date '2025-08-20') - 365) / 365)), 2)
from lcpol a,
     cv_1031014 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025081900001486'
  and b.dt = 1;
--t≤PPP，年领欠缴保费
select a.prem / 1000 * b.endcv - 1610
from lcpol a,
     cv_1031014 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025081900001486'
  and b.dt = 6;
--t>PPP，年领欠缴保费
select round(a.prem / 1000 * b.endcv , 2)
from lcpol a,
     cv_1031014 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025091000001386'
  and b.dt = 1;
--t>PPP，年领未欠缴保费
select round((a.prem / 1000 * b.endcv * (date'2030-10-20' - date'2030-08-20') / 366) +
             (a.prem / 1000 * b.begcv *
              (366 - (date'2030-10-20' - date'2030-08-20')) / 366), 2) cash
from lcpol a,
     cv_1031014 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025081900000606'
  and b.dt = 6;
--理赔
select greatest(round((a.prem / 1000 * b.endcv * (date'2030-10-20' - date'2030-08-20') / 365) +
                      (a.prem / 1000 * b.begcv *
                       (365 - (date'2030-10-20' - date'2030-08-20')) / 365), 2), a.prem)
from lcpol a,
     cv_1031014 b
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = '2025081900000606'
  and b.dt = 6;