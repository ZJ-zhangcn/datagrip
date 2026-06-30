-- id: req-4292
-- 标题: 稳赢添添恒盈版ab——核心系统需求-a款

--t≤ppp，月领未欠缴保费
select a.prem / 1000 * b.endcv *
       power(1 + 0.0425,
             (((date '2024-12-10' - date '2024-08-13') - 365) / 365)) +
       greatest(0 - 0, 0)
  from lcpol a, cv_1033026 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno='2024081200004026'
   and b.dt = 1

--t≤ppp，月领欠缴保费
select a.prem / 1000 * b.endcv -
       (select nvl(sum(getmoney), 0)
          from ljagetdraw
         where contno = a.contno
           and getdate between date '2025-08-13' and date
         '2025-10-01'
           and enteraccdate is not null)
  from lcpol a, cv_1033026 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno = '2024081200004026'
   and b.dt = 1

--t>ppp，月领欠缴保费
select a.prem / 1000 * b.endcv -
       (select nvl(sum(getmoney), 0)
          from ljagetdraw
         where contno = a.contno
           and getdate between date '2025-08-13' and date
         '2029-10-01'
           and enteraccdate is not null)
  from lcpol a, cv_1033026 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno = '2024081200004026'
   and b.dt = 1

--t>ppp，月领未欠缴保费
select (a.prem / 1000 * b.endcv * (date '2029-10-01' - date '2029-08-13') / 365) +
       (a.prem / 1000 * b.begcv *
       (365 - (date '2029-10-01' - date '2029-08-13')) / 365) +
       greatest((a.amnt * 5 - 53.24*2
                /*(select nvl(sum(getmoney), 0)
                    from ljagetdraw
                   where contno = a.contno
                     and getdate between date '2029-08-13' and date
                   '2029-10-01')*/),
                0)
  from lcpol a, cv_1033026 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno = '2024081200004026'
   and b.dt = 6

--t≤ppp，年领未欠缴保费
select a.prem / 1000 * b.endcv *
       power(1 + 0.0425,
             (((date '2024-10-01' - date '2024-08-13') - 365) / 365))
  from lcpol a, cv_1033026 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno='2024081200003886'
   and b.dt = 1

--t≤ppp，年领欠缴保费
select a.prem / 1000 * b.endcv -
       (select nvl(sum(getmoney), 0)
          from ljagetdraw
         where contno = a.contno
           and getdate between date '2025-08-13' and date '2025-10-01')
  from lcpol a, cv_1033026 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno = '2024081200003886'
   and b.dt = 1

--t>ppp，年领欠缴保费
select a.prem / 1000 * b.endcv -
       (select nvl(sum(getmoney), 0)
          from ljagetdraw
         where contno = a.contno
           and getdate between date '2026-08-13' and date '2027-10-01')
  from lcpol a, cv_1033026 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno = '2024081200003886'
   and b.dt = 2

--t>ppp，年领未欠缴保费
select (a.prem / 1000 * b.endcv * (date '2043-08-01' - date '2042-08-10') / 365) +
       (a.prem / 1000 * b.begcv *
       (365 - (date '2043-08-01' - date '2042-08-10')) / 365)
  from lcpol a, cv_1033026 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno = '2024081200002196'
   and b.dt = 19;