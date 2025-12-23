--减保限额
select least(round(2500 * 0.2 / a.amnt * ((a.prem / 1000 * b.endcv * (date '2047-01-30' - date '2046-12-23') / 365) +
                                            (a.prem / 1000 * b.begcv *
                                             (365 - (date '2047-01-30' - date '2046-12-23')) / 365) +
                                            greatest(a.amnt * a.PAYENDYEAR * (1 - 0.0841 * 2),
                                                     0)) - 10000, 2),
             round(600000 * 0.2 - 10000, 2),
             round(((a.prem / 1000 * b.endcv * (date '2047-01-30' - date '2046-12-23') / 365) +
                    (a.prem / 1000 * b.begcv *
                     (365 - (date '2047-01-30' - date '2046-12-23')) / 365) +
                    greatest(a.amnt * a.PAYENDYEAR * (1 - 0.0841 * 2),
                             0)), 2)) 减保限额
from lcpol a,
     cv_1136004 b,
     lcduty c
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = c.contno
  and b.ANNUITYGETAGE = c.ANNUITYGETAGE
  and a.contno = '2025122200000296'
  and b.dt = 22;

--减保后保额
select round((1 - 10000 / ((a.prem / 1000 * b.endcv * (date '2047-01-30' - date '2046-12-23') / 365) +
                           (a.prem / 1000 * b.begcv *
                            (365 - (date '2047-01-30' - date '2046-12-23')) / 365) +
                           greatest(a.amnt * a.PAYENDYEAR * (1 - 0.0841 * 2),
                                    0))) * 2466.87 - 0, 2) 减保后保额,(1 - 10000 / ((a.prem / 1000 * b.endcv * (date '2047-01-30' - date '2046-12-23') / 365) +
                           (a.prem / 1000 * b.begcv *
                            (365 - (date '2047-01-30' - date '2046-12-23')) / 365) +
                           greatest(a.amnt * a.PAYENDYEAR * (1 - 0.0841 * 2),
                                    0))) * 2466.87 - 0
from lcpol a,
     cv_1136004 b,
     lcduty c
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = c.contno
  and b.ANNUITYGETAGE = c.ANNUITYGETAGE
  and a.contno = '2025122200000296'
  and b.dt = 22;

--减保后保费
select round(2433.7355 * 1000 / rate, 2) 减保后保费
from lcpol a,
     rt_1136004 b,
     lcduty c
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = c.contno
  and b.ANNUITYGETAGE = c.ANNUITYGETAGE
  and a.contno = '2025122200000296';

--减保后保单打印现价
select round(a.prem / 1000 * ENDCV, 2) endcv
from lcpol a,
     cv_1136004 b,
     lcduty c
where a.insuredsex = b.gender
  and a.insuredappage = b.age
  and a.payendyear = b.pt
  and a.contno = c.contno
  and b.ANNUITYGETAGE = c.ANNUITYGETAGE
  and a.contno = '2025122200000296'
order by dt;